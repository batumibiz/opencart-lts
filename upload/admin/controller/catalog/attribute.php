<?php

namespace Opencart\Admin\Controller\Catalog;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class Attribute extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_name'  => true,
		'filter_group' => true
	];

	public function index(): void {
		$filter = new Filter($this->request, $this->filterKeys);

		$data = $filter->getFilterData();

		$this->load->language('catalog/attribute');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/attribute', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['add'] = $this->url->link('catalog/attribute.form', 'user_token=' . $this->session->data['user_token'] . $url);
		$data['delete'] = $this->url->link('catalog/attribute.delete', 'user_token=' . $this->session->data['user_token']);

		$data['list'] = $this->getList();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/attribute', $data));
	}

	public function list(): void {
		$this->load->language('catalog/attribute');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'd.name');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('catalog/attribute.list', 'user_token=' . $this->session->data['user_token'] . $url);

		// Attribute
		$data['attributes'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		$this->load->model('catalog/attribute');

		$results = $this->model_catalog_attribute->getAttributes($filter_data);

		foreach ($results as $result) {
			$data['attributes'][] = ['edit' => $this->url->link('catalog/attribute.form', 'user_token=' . $this->session->data['user_token'] . '&attribute_id=' . $result['attribute_id'] . $url)] + $result;
		}

		$url = $filter->getQueryString();
		$url .= ($order == 'ASC') ? '&order=DESC' : '&order=ASC';

		$data['sort_name'] = $this->url->link('catalog/attribute.list', 'user_token=' . $this->session->data['user_token'] . '&sort=d.name' . $url);
		$data['sort_attribute_group'] = $this->url->link('catalog/attribute.list', 'user_token=' . $this->session->data['user_token'] . '&sort=attribute_group' . $url);
		$data['sort_sort_order'] = $this->url->link('catalog/attribute.list', 'user_token=' . $this->session->data['user_token'] . '&sort=a.sort_order' . $url);

		$url = $filter->getQueryString(true, true);

		$attribute_total = $this->model_catalog_attribute->getTotalAttributes($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $attribute_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('catalog/attribute.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($attribute_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($attribute_total - $this->config->get('config_pagination_admin'))) ? $attribute_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $attribute_total, ceil($attribute_total / $this->config->get('config_pagination_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		return $this->load->view('catalog/attribute_list', $data);
	}

	public function form(): void {
		$this->load->language('catalog/attribute');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['text_form'] = !isset($this->request->get['attribute_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$filter = new Filter($this->request, $this->filterKeys);
		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/attribute', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['save'] = $this->url->link('catalog/attribute.save', 'user_token=' . $this->session->data['user_token']);
		$data['back'] = $this->url->link('catalog/attribute', 'user_token=' . $this->session->data['user_token'] . $url);

		$attribute_info = [];

		if (isset($this->request->get['attribute_id'])) {
			$this->load->model('catalog/attribute');

			$attribute_info = $this->model_catalog_attribute->getAttribute((int)$this->request->get['attribute_id']);
		}

		if (!empty($attribute_info)) {
			$data['attribute_id'] = $attribute_info['attribute_id'];
		} else {
			$data['attribute_id'] = 0;
		}

		// Language
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (!empty($attribute_info)) {
			$data['attribute_description'] = $this->model_catalog_attribute->getDescriptions($attribute_info['attribute_id']);
		} else {
			$data['attribute_description'] = [];
		}

		// Attribute Group
		$this->load->model('catalog/attribute_group');

		$data['attribute_groups'] = $this->model_catalog_attribute_group->getAttributeGroups();

		if (!empty($attribute_info)) {
			$data['attribute_group_id'] = $attribute_info['attribute_group_id'];
		} else {
			$data['attribute_group_id'] = 0;
		}

		if (!empty($attribute_info)) {
			$data['sort_order'] = $attribute_info['sort_order'];
		} else {
			$data['sort_order'] = 0;
		}

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/attribute_form', $data));
	}

	public function save(): void {
		$this->load->language('catalog/attribute');

		$json = [];

		if (!$this->user->hasPermission('modify', 'catalog/attribute')) {
			$json['error']['warning'] = $this->language->get('error_permission');
		}

		$required = [
			'attribute_id'          => 0,
			'attribute_group_id'    => 0,
			'attribute_description' => [],
			'sort_order'            => 0
		];

		$post_info = $this->request->post + $required;

		if (!$post_info['attribute_group_id']) {
			$json['error']['attribute_group'] = $this->language->get('error_attribute_group');
		}

		foreach ($post_info['attribute_description'] as $language_id => $value) {
			if (!oc_validate_length((string)$value['name'], 1, 64)) {
				$json['error']['name_' . (int)$language_id] = $this->language->get('error_name');
			}
		}

		if (isset($json['error']) && !isset($json['error']['warning'])) {
			$json['error']['warning'] = $this->language->get('error_warning');
		}

		if (!$json) {
			$this->load->model('catalog/attribute');

			if (!$post_info['attribute_id']) {
				$json['attribute_id'] = $this->model_catalog_attribute->addAttribute($post_info);
			} else {
				$this->model_catalog_attribute->editAttribute((int)$post_info['attribute_id'], $post_info);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete(): void {
		$this->load->language('catalog/attribute');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (!$this->user->hasPermission('modify', 'catalog/attribute')) {
			$json['error'] = $this->language->get('error_permission');
		}

		// Product
		$this->load->model('catalog/product');

		foreach ($selected as $attribute_id) {
			$product_total = $this->model_catalog_product->getTotalAttributesByAttributeId((int)$attribute_id);

			if ($product_total) {
				$json['error'] = sprintf($this->language->get('error_product'), $product_total);
			}
		}

		if (!$json) {
			$this->load->model('catalog/attribute');

			foreach ($selected as $attribute_id) {
				$this->model_catalog_attribute->deleteAttribute((int)$attribute_id);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete(): void {
		$this->load->model('catalog/attribute');

		if (isset($this->request->get['filter_name'])) {
			$json = $this->model_catalog_attribute->autocompleteName($this->request->get);
		} elseif (isset($this->request->get['filter_attribute_group'])) {
			$json = $this->model_catalog_attribute->autocompleteGroup($this->request->get);
		} else {
			$json = [];
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
