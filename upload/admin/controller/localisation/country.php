<?php

namespace Opencart\Admin\Controller\Localisation;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class Country extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_name'       => true,
		'filter_iso_code_2' => true,
		'filter_iso_code_3' => true,
	];

	public function index(): void {
		$filter = new Filter($this->request, $this->filterKeys);

		$data = $filter->getFilterData();

		$this->load->language('localisation/country');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('localisation/country', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['add'] = $this->url->link('localisation/country.form', 'user_token=' . $this->session->data['user_token'] . $url);
		$data['delete'] = $this->url->link('localisation/country.delete', 'user_token=' . $this->session->data['user_token']);

		$data['list'] = $this->getList();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('localisation/country', $data));
	}

	public function list(): void {
		$this->load->language('localisation/country');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'name');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('localisation/country.list', 'user_token=' . $this->session->data['user_token'] . $url);

		// Country
		$data['countries'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		$this->load->model('localisation/country');

		$results = $this->model_localisation_country->getCountries($filter_data);

		foreach ($results as $result) {
			$data['countries'][] = [
				'name' => $result['name'] . (($result['country_id'] == $this->config->get('config_country_id')) ? $this->language->get('text_default') : ''),
				'edit' => $this->url->link('localisation/country.form', 'user_token=' . $this->session->data['user_token'] . '&country_id=' . $result['country_id'] . $url)
			] + $result;
		}

		$url = $filter->getQueryString();
		$url .= ($order == 'ASC') ? '&order=DESC' : '&order=ASC';

		$data['sort_name'] = $this->url->link('localisation/country.list', 'user_token=' . $this->session->data['user_token'] . '&sort=name' . $url);
		$data['sort_iso_code_2'] = $this->url->link('localisation/country.list', 'user_token=' . $this->session->data['user_token'] . '&sort=iso_code_2' . $url);
		$data['sort_iso_code_3'] = $this->url->link('localisation/country.list', 'user_token=' . $this->session->data['user_token'] . '&sort=iso_code_3' . $url);

		$url = $filter->getQueryString(true, true);

		$country_total = $this->model_localisation_country->getTotalCountries($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $country_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('localisation/country.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($country_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($country_total - $this->config->get('config_pagination_admin'))) ? $country_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $country_total, ceil($country_total / $this->config->get('config_pagination_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		return $this->load->view('localisation/country_list', $data);
	}

	public function form(): void {
		$this->load->language('localisation/country');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['text_form'] = !isset($this->request->get['country_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$filter = new Filter($this->request, $this->filterKeys);
		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('localisation/country', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['save'] = $this->url->link('localisation/country.save', 'user_token=' . $this->session->data['user_token']);
		$data['back'] = $this->url->link('localisation/country', 'user_token=' . $this->session->data['user_token'] . $url);

		if (isset($this->request->get['country_id'])) {
			$this->load->model('localisation/country');

			$country_info = $this->model_localisation_country->getCountry((int)$this->request->get['country_id']);
		}

		if (!empty($country_info)) {
			$data['country_id'] = $country_info['country_id'];
		} else {
			$data['country_id'] = 0;
		}

		// Language
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (!empty($country_info)) {
			$data['country_description'] = $this->model_localisation_country->getDescriptions($country_info['country_id']);
		} else {
			$data['country_description'] = [];
		}

		if (!empty($country_info)) {
			$data['iso_code_2'] = $country_info['iso_code_2'];
		} else {
			$data['iso_code_2'] = '';
		}

		if (!empty($country_info)) {
			$data['iso_code_3'] = $country_info['iso_code_3'];
		} else {
			$data['iso_code_3'] = '';
		}

		// Address Format
		$this->load->model('localisation/address_format');

		$data['address_formats'] = $this->model_localisation_address_format->getAddressFormats();

		if (!empty($country_info)) {
			$data['address_format_id'] = $country_info['address_format_id'];
		} else {
			$data['address_format_id'] = '';
		}

		if (!empty($country_info)) {
			$data['postcode_required'] = $country_info['postcode_required'];
		} else {
			$data['postcode_required'] = 0;
		}

		if (!empty($country_info)) {
			$data['status'] = $country_info['status'];
		} else {
			$data['status'] = '1';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('localisation/country_form', $data));
	}

	public function save(): void {
		$this->load->language('localisation/country');

		$json = [];

		if (!$this->user->hasPermission('modify', 'localisation/country')) {
			$json['error']['warning'] = $this->language->get('error_permission');
		}

		$required = [
			'country_id'          => 0,
			'country_description' => [],
			'iso_code_2'          => '',
			'iso_code_3'          => ''
		];

		$post_info = $this->request->post + $required;

		foreach ($post_info['country_description'] as $language_id => $value) {
			if (!oc_validate_length($value['name'], 1, 128)) {
				$json['error']['name_' . $language_id] = $this->language->get('error_name');
			}
		}

		if (oc_strlen($post_info['iso_code_2']) != 2) {
			$json['error']['iso_code_2'] = $this->language->get('error_iso_code_2');
		}

		if (oc_strlen($post_info['iso_code_3']) != 3) {
			$json['error']['iso_code_3'] = $this->language->get('error_iso_code_3');
		}

		if (!$json) {
			$this->load->model('localisation/country');

			if (!$post_info['country_id']) {
				$json['country_id'] = $this->model_localisation_country->addCountry($post_info);
			} else {
				$this->model_localisation_country->editCountry($post_info['country_id'], $post_info);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete(): void {
		$this->load->language('localisation/country');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (!$this->user->hasPermission('modify', 'localisation/country')) {
			$json['error'] = $this->language->get('error_permission');
		}

		// Store
		$this->load->model('setting/store');

		// Customer
		$this->load->model('customer/customer');

		// Zone
		$this->load->model('localisation/zone');

		// Geo Zone
		$this->load->model('localisation/geo_zone');

		foreach ($selected as $country_id) {
			if ($this->config->get('config_country_id') == $country_id) {
				$json['error'] = $this->language->get('error_default');
			}

			$store_total = $this->model_setting_store->getTotalStoresByCountryId($country_id);

			if ($store_total) {
				$json['error'] = sprintf($this->language->get('error_store'), $store_total);
			}

			$address_total = $this->model_customer_customer->getTotalAddressesByCountryId($country_id);

			if ($address_total) {
				$json['error'] = sprintf($this->language->get('error_address'), $address_total);
			}

			$zone_total = $this->model_localisation_zone->getTotalZonesByCountryId($country_id);

			if ($zone_total) {
				$json['error'] = sprintf($this->language->get('error_zone'), $zone_total);
			}

			$zone_to_geo_zone_total = $this->model_localisation_geo_zone->getTotalZoneToGeoZoneByCountryId($country_id);

			if ($zone_to_geo_zone_total) {
				$json['error'] = sprintf($this->language->get('error_zone_to_geo_zone'), $zone_to_geo_zone_total);
			}
		}

		if (!$json) {
			// Country
			$this->load->model('localisation/country');

			foreach ($selected as $country_id) {
				$this->model_localisation_country->deleteCountry($country_id);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function country(): void {
		$json = [];

		if (isset($this->request->get['country_id'])) {
			$country_id = (int)$this->request->get['country_id'];
		} else {
			$country_id = 0;
		}

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($country_id);

		if ($country_info) {
			// Zone
			$this->load->model('localisation/zone');

			$json = ['zone' => $this->model_localisation_zone->getZonesByCountryId($country_id)] + $country_info;
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete(): void {
		$json = [];

		if (isset($this->request->get['autocomplete_name'])) {
			$this->load->model('localisation/country');

			$filter_data = [
				'filter_name' => $this->request->get['autocomplete_name'],
				'start'       => 0,
				'limit'       => $this->config->get('config_autocomplete_limit')
			];

			$results = $this->model_localisation_country->getCountries($filter_data);

			foreach ($results as $result) {
				$json[] = [
					'country_id' => $result['country_id'],
					'name'       => $result['name']
				];
			}
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
