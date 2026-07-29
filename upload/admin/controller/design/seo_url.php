<?php

namespace Opencart\Admin\Controller\Design;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class SeoUrl extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array
	 */
	private array $filterKeys = [
		'filter_keyword'     => true,
		'filter_key'         => true,
		'filter_value'       => true,
		'filter_store_id'    => false,
		'filter_language_id' => false,
	];

	public function index(): void {
		$filter = new Filter($this->request, $this->filterKeys);

		$data = $filter->getFilterData();

		$this->load->language('design/seo_url');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('design/seo_url', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['add'] = $this->url->link('design/seo_url.form', 'user_token=' . $this->session->data['user_token'] . $url);
		$data['delete'] = $this->url->link('design/seo_url.delete', 'user_token=' . $this->session->data['user_token']);

		$data['list'] = $this->getList();

		// Store
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		// Language
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('design/seo_url', $data));
	}

	public function list(): void {
		$this->load->language('design/seo_url');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'key');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . $url);

		$data['seo_urls'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		// SEO
		$this->load->model('design/seo_url');

		// Language
		$this->load->model('localisation/language');

		$results = $this->model_design_seo_url->getSeoUrls($filter_data);

		foreach ($results as $result) {
			$language_info = $this->model_localisation_language->getLanguage($result['language_id']);

			if ($language_info) {
				$code = $language_info['code'];
				$image = $language_info['image'];
			} else {
				$code = '';
				$image = '';
			}

			$data['seo_urls'][] = [
				'image'    => $image,
				'language' => $code,
				'store'    => $result['store_id'] ? $result['store'] : $this->language->get('text_default'),
				'edit'     => $this->url->link('design/seo_url.form', 'user_token=' . $this->session->data['user_token'] . '&seo_url_id=' . $result['seo_url_id'] . $url)
			] + $result;
		}

		$url = $filter->getQueryString();
		$url .= ($order == 'ASC') ? '&order=DESC' : '&order=ASC';

		$data['sort_keyword'] = $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . '&sort=keyword' . $url);
		$data['sort_key'] = $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . '&sort=key' . $url);
		$data['sort_value'] = $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . '&sort=value' . $url);
		$data['sort_sort_order'] = $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . '&sort=sort_order' . $url);
		$data['sort_store'] = $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . '&sort=store_id' . $url);
		$data['sort_language'] = $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . '&sort=language_id' . $url);

		$url = $filter->getQueryString(true, true);

		$seo_url_total = $this->model_design_seo_url->getTotalSeoUrls($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $seo_url_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('design/seo_url.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($seo_url_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($seo_url_total - $this->config->get('config_pagination_admin'))) ? $seo_url_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $seo_url_total, ceil($seo_url_total / $this->config->get('config_pagination_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		return $this->load->view('design/seo_url_list', $data);
	}

	public function form(): void {
		$this->load->language('design/seo_url');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['text_form'] = !isset($this->request->get['seo_url_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$filter = new Filter($this->request, $this->filterKeys);
		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('design/seo_url', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['save'] = $this->url->link('design/seo_url.save', 'user_token=' . $this->session->data['user_token']);
		$data['back'] = $this->url->link('design/seo_url', 'user_token=' . $this->session->data['user_token'] . $url);

		if (isset($this->request->get['seo_url_id'])) {
			$this->load->model('design/seo_url');

			$seo_url_info = $this->model_design_seo_url->getSeoUrl($this->request->get['seo_url_id']);
		}

		if (!empty($seo_url_info)) {
			$data['seo_url_id'] = $seo_url_info['seo_url_id'];
		} else {
			$data['seo_url_id'] = 0;
		}

		// Stores
		$stores = [];

		$stores[] = [
			'store_id' => 0,
			'name'     => $this->language->get('text_default')
		];

		$this->load->model('setting/store');

		$data['stores'] = array_merge($stores, $this->model_setting_store->getStores());

		if (!empty($seo_url_info)) {
			$data['store_id'] = $seo_url_info['store_id'];
		} else {
			$data['store_id'] = 0;
		}

		// Language
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (!empty($seo_url_info)) {
			$data['language_id'] = $seo_url_info['language_id'];
		} else {
			$data['language_id'] = '';
		}

		if (!empty($seo_url_info)) {
			$data['key'] = $seo_url_info['key'];
		} else {
			$data['key'] = '';
		}

		if (!empty($seo_url_info)) {
			$data['value'] = $seo_url_info['value'];
		} else {
			$data['value'] = '';
		}

		if (!empty($seo_url_info)) {
			$data['keyword'] = $seo_url_info['keyword'];
		} else {
			$data['keyword'] = '';
		}

		if (!empty($seo_url_info)) {
			$data['sort_order'] = $seo_url_info['sort_order'];
		} else {
			$data['sort_order'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('design/seo_url_form', $data));
	}

	public function save(): void {
		$this->load->language('design/seo_url');

		$json = [];

		if (!$this->user->hasPermission('modify', 'design/seo_url')) {
			$json['error']['warning'] = $this->language->get('error_permission');
		}

		$required = [
			'seo_url_id'  => 0,
			'store_id'    => 0,
			'language_id' => 0,
			'key'         => '',
			'value'       => '',
			'keyword'     => ''
		];

		$post_info = $this->request->post + $required;

		if (!oc_validate_length($post_info['key'], 1, 64)) {
			$json['error']['key'] = $this->language->get('error_key');
		}

		if (!oc_validate_length($post_info['value'], 1, 255)) {
			$json['error']['value'] = $this->language->get('error_value');
		}

		$this->load->model('design/seo_url');

		// Check if there is already a key value pair on the same store using the same language
		$seo_url_info = $this->model_design_seo_url->getSeoUrlByKeyValue($post_info['key'], $post_info['value'], $post_info['store_id'], $post_info['language_id']);

		if ($seo_url_info && (!$post_info['seo_url_id'] || ($seo_url_info['seo_url_id'] != (int)$post_info['seo_url_id']))) {
			$json['error']['value'] = $this->language->get('error_value_exists');
		}

		// Split keywords by / so we can validate each keyword
		$keywords = explode('/', $post_info['keyword']);

		foreach ($keywords as $keyword) {
			if (!oc_validate_length($keyword, 1, 64)) {
				$json['error']['keyword'] = $this->language->get('error_keyword');
			}

			if (!oc_validate_path($keyword)) {
				$json['error']['keyword'] = $this->language->get('error_keyword_character');
			}
		}

		// Check if keyword already exists and on the same store as long as the keyword matches the key / value pair
		$seo_url_info = $this->model_design_seo_url->getSeoUrlByKeyword($post_info['keyword'], $post_info['store_id']);

		if ($seo_url_info && (($seo_url_info['key'] != $post_info['key']) || ($seo_url_info['value'] != $post_info['value']))) {
			$json['error']['keyword'] = $this->language->get('error_keyword_exists');
		}

		if (!$json) {
			if (!$post_info['seo_url_id']) {
				$json['seo_url_id'] = $this->model_design_seo_url->addSeoUrl($post_info['key'], $post_info['value'], $post_info['keyword'], $post_info['store_id'], $post_info['language_id'], (int)$post_info['sort_order']);
			} else {
				$this->model_design_seo_url->editSeoUrl($post_info['seo_url_id'], $post_info['key'], $post_info['value'], $post_info['keyword'], $post_info['store_id'], $post_info['language_id'], (int)$post_info['sort_order']);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete(): void {
		$this->load->language('design/seo_url');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (!$this->user->hasPermission('modify', 'design/seo_url')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->load->model('design/seo_url');

			foreach ($selected as $seo_url_id) {
				$this->model_design_seo_url->deleteSeoUrl($seo_url_id);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete(): void {
		$json = [];
		$filter_data = [];

		if (isset($this->request->get['filter_keyword'])) {
			$filter_data['filter_keyword'] = $this->request->get['filter_keyword'];
		} elseif (isset($this->request->get['filter_key'])) {
			$filter_data['filter_key'] = $this->request->get['filter_key'];
		} elseif (isset($this->request->get['filter_value'])) {
			$filter_data['filter_value'] = $this->request->get['filter_value'];
		}

		if (!empty($filter_data)) {
			$filter_data['limit'] = $this->config->get('config_autocomplete_limit');
			$this->load->model('design/seo_url');
			$json = $this->model_design_seo_url->autocomplete($filter_data);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
