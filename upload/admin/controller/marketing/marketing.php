<?php

namespace Opencart\Admin\Controller\Marketing;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class Marketing extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_name'      => true,
		'filter_code'      => false,
		'filter_date_from' => false,
		'filter_date_to'   => false,
	];

	public function index(): void {
		$filter = new Filter($this->request, $this->filterKeys);

		$data = $filter->getFilterData();

		$this->load->language('marketing/marketing');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('marketing/marketing', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['add'] = $this->url->link('marketing/marketing.form', 'user_token=' . $this->session->data['user_token'] . $url);
		$data['delete'] = $this->url->link('marketing/marketing.delete', 'user_token=' . $this->session->data['user_token']);

		$data['list'] = $this->getList();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('marketing/marketing', $data));
	}

	public function list(): void {
		$this->load->language('marketing/marketing');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'm.name');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('marketing/marketing.list', 'user_token=' . $this->session->data['user_token'] . $url);

		$data['marketings'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		$this->load->model('marketing/marketing');

		$results = $this->model_marketing_marketing->getMarketings($filter_data);

		foreach ($results as $result) {
			$data['marketings'][] = [
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'       => $this->url->link('marketing/marketing.form', 'user_token=' . $this->session->data['user_token'] . '&marketing_id=' . $result['marketing_id'] . $url)
			] + $result;
		}

		$url = $filter->getQueryString();
		$url .= ($order == 'ASC') ? '&order=DESC' : '&order=ASC';

		$data['sort_name'] = $this->url->link('marketing/marketing.list', 'user_token=' . $this->session->data['user_token'] . '&sort=m.name' . $url);
		$data['sort_code'] = $this->url->link('marketing/marketing.list', 'user_token=' . $this->session->data['user_token'] . '&sort=m.code' . $url);
		$data['sort_date_added'] = $this->url->link('marketing/marketing.list', 'user_token=' . $this->session->data['user_token'] . '&sort=m.date_added' . $url);

		$url = $filter->getQueryString(true, true);

		$marketing_total = $this->model_marketing_marketing->getTotalMarketings($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $marketing_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('marketing/marketing.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($marketing_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($marketing_total - $this->config->get('config_pagination_admin'))) ? $marketing_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $marketing_total, ceil($marketing_total / $this->config->get('config_pagination_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		return $this->load->view('marketing/marketing_list', $data);
	}

	public function form(): void {
		$this->load->language('marketing/marketing');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['text_form'] = !isset($this->request->get['marketing_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$filter = new Filter($this->request, $this->filterKeys);
		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('marketing/marketing', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['save'] = $this->url->link('marketing/marketing.save', 'user_token=' . $this->session->data['user_token']);
		$data['back'] = $this->url->link('marketing/marketing', 'user_token=' . $this->session->data['user_token'] . $url);

		if (isset($this->request->get['marketing_id'])) {
			$this->load->model('marketing/marketing');

			$marketing_info = $this->model_marketing_marketing->getMarketing($this->request->get['marketing_id']);
		}

		if (!empty($marketing_info)) {
			$data['marketing_id'] = $marketing_info['marketing_id'];
		} else {
			$data['marketing_id'] = 0;
		}

		$data['store'] = HTTP_CATALOG;

		if (!empty($marketing_info)) {
			$data['name'] = $marketing_info['name'];
		} else {
			$data['name'] = '';
		}

		if (!empty($marketing_info)) {
			$data['description'] = $marketing_info['description'];
		} else {
			$data['description'] = '';
		}

		if (!empty($marketing_info)) {
			$data['code'] = $marketing_info['code'];
		} else {
			$data['code'] = uniqid();
		}

		$data['report'] = $this->getReport();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('marketing/marketing_form', $data));
	}

	public function save(): void {
		$this->load->language('marketing/marketing');

		$json = [];

		if (!$this->user->hasPermission('modify', 'marketing/marketing')) {
			$json['error']['warning'] = $this->language->get('error_permission');
		}

		$required = [
			'marketing_id' => 0,
			'name'         => '',
			'description'  => '',
			'code'         => ''
		];

		$post_info = $this->request->post + $required;

		if (!oc_validate_length($post_info['name'], 1, 32)) {
			$json['error']['name'] = $this->language->get('error_name');
		}

		if (!$post_info['code']) {
			$json['error']['code'] = $this->language->get('error_code');
		}

		$this->load->model('marketing/marketing');

		$marketing_info = $this->model_marketing_marketing->getMarketingByCode($post_info['code']);

		if ($marketing_info && (!$post_info['marketing_id'] || ($post_info['marketing_id'] != $marketing_info['marketing_id']))) {
			$json['error']['code'] = $this->language->get('error_exists');
		}

		if (!$json) {
			if (!$post_info['marketing_id']) {
				$json['marketing_id'] = $this->model_marketing_marketing->addMarketing($post_info);
			} else {
				$this->model_marketing_marketing->editMarketing($post_info['marketing_id'], $post_info);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete(): void {
		$this->load->language('marketing/marketing');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (!$this->user->hasPermission('modify', 'marketing/marketing')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->load->model('marketing/marketing');

			foreach ($selected as $marketing_id) {
				$this->model_marketing_marketing->deleteMarketing($marketing_id);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function report(): void {
		$this->load->language('marketing/marketing');

		$this->response->setOutput($this->getReport());
	}

	public function getReport(): string {
		if (isset($this->request->get['marketing_id'])) {
			$marketing_id = (int)$this->request->get['marketing_id'];
		} else {
			$marketing_id = 0;
		}

		if (isset($this->request->get['page']) && $this->request->get['route'] == 'marketing/marketing.report') {
			$page = (int)$this->request->get['page'];
		} else {
			$page = 1;
		}

		$limit = 10;

		$data['reports'] = [];

		// Marketing
		$this->load->model('marketing/marketing');

		// Customer
		$this->load->model('customer/customer');

		// Store
		$this->load->model('setting/store');

		$results = $this->model_marketing_marketing->getReports($marketing_id, ($page - 1) * $limit, $limit);

		foreach ($results as $result) {
			$store_info = $this->model_setting_store->getStore($result['store_id']);

			if ($store_info) {
				$store = $store_info['name'];
			} elseif (!$result['store_id']) {
				$store = $this->config->get('config_name');
			} else {
				$store = '';
			}

			$data['reports'][] = [
				'ip'         => $result['ip'],
				'account'    => $this->model_customer_customer->getTotalCustomersByIp($result['ip']),
				'store'      => $store,
				'country'    => $result['country'],
				'date_added' => date($this->language->get('datetime_format'), strtotime($result['date_added'])),
				'filter_ip'  => $this->url->link('customer/customer', 'user_token=' . $this->session->data['user_token'] . '&filter_ip=' . $result['ip'])
			];
		}

		$report_total = $this->model_marketing_marketing->getTotalReports($marketing_id);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $report_total,
			'page'  => $page,
			'limit' => $limit,
			'url'   => $this->url->link('marketing/marketing.report', 'user_token=' . $this->session->data['user_token'] . '&marketing_id=' . $marketing_id . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($report_total) ? (($page - 1) * $limit) + 1 : 0, ((($page - 1) * $limit) > ($report_total - $limit)) ? $report_total : ((($page - 1) * $limit) + $limit), $report_total, ceil($report_total / $limit));

		return $this->load->view('marketing/marketing_report', $data);
	}

	public function autocomplete(): void {
		$json = [];

		if (isset($this->request->get['autocomplete_name'])) {
			$filter_name = $this->request->get['autocomplete_name'];
		} else {
			$filter_name = '';
		}

		if (isset($this->request->get['autocomplete_code'])) {
			$filter_code = $this->request->get['autocomplete_code'];
		} else {
			$filter_code = '';
		}

		// Marketing
		$filter_data = [
			'filter_name' => $filter_name,
			'filter_code' => $filter_code,
			'start'       => 0,
			'limit'       => $this->config->get('config_autocomplete_limit')
		];

		$this->load->model('marketing/marketing');

		$results = $this->model_marketing_marketing->getMarketings($filter_data);

		foreach ($results as $result) {
			$json[] = [
				'marketing_id' => $result['marketing_id'],
				'name'         => $result['name'],
				'code'         => $result['code']
			];
		}

		$sort_order = [];

		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
