<?php

namespace Opencart\Admin\Controller\Tool;

use Opencart\System\Engine\Controller;

class Upgrade extends Controller {
	public const OC_VERSION_URL = 'https://raw.githubusercontent.com/oc-plus/oc-plus-update/main/version.json';

	public function index(): void {
		$this->load->language('tool/upgrade');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('tool/upgrade', 'user_token=' . $this->session->data['user_token'])
		];

		$data['current_version'] = OC_PLUS__VERSION;
		$data['upgrade'] = false;

		$response_info = $this->cache->get('update-info');

		if (!$response_info) {
			$curl = curl_init(self::OC_VERSION_URL);
			curl_setopt_array($curl, [
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_TIMEOUT        => 10,
				CURLOPT_USERAGENT      => 'OC+',
				CURLOPT_FAILONERROR    => true,
			]);

			$response = curl_exec($curl);

			$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);

			if ($status == 200) {
				$response_info = json_decode($response, true);
				$this->cache->set('update-info', $response_info);
			} else {
				$response_info = [];
			}
		}

		if ($response_info) {
			$data['latest_version'] = $response_info['version'];
			$data['date_added'] = date($this->language->get('date_format_short'), strtotime($response_info['date_added']));
			$data['log'] = nl2br($response_info['log']);

			if (!version_compare(OC_PLUS__VERSION, $response_info['version'], '>=')) {
				$data['upgrade'] = true;
			}
		} else {
			$data['latest_version'] = '';
			$data['date_added'] = '';
			$data['log'] = '';
		}

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tool/upgrade', $data));
	}

	public function download(): void {
		$json['error'] = $this->language->get('error_download');
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function install(): void {
		$json['error'] = $this->language->get('error_unzip');
		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
