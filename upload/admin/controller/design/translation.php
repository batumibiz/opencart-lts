<?php

namespace Opencart\Admin\Controller\Design;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class Translation extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_route'       => true,
		'filter_key'         => true,
		'filter_value'       => true,
		'filter_store_id'    => false,
		'filter_language_id' => false,
	];

	public function index(): void {
		$filter = new Filter($this->request, $this->filterKeys);

		$data = $filter->getFilterData();

		$this->load->language('design/translation');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('design/translation', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['add'] = $this->url->link('design/translation.form', 'user_token=' . $this->session->data['user_token'] . $url);
		$data['delete'] = $this->url->link('design/translation.delete', 'user_token=' . $this->session->data['user_token']);

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

		$this->response->setOutput($this->load->view('design/translation', $data));
	}

	public function list(): void {
		$this->load->language('design/translation');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'store');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('design/translation.list', 'user_token=' . $this->session->data['user_token'] . $url);

		// Language
		$this->load->model('localisation/language');

		// Translation
		$data['translations'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		$this->load->model('design/translation');

		$results = $this->model_design_translation->getTranslations($filter_data);

		foreach ($results as $result) {
			$language_info = $this->model_localisation_language->getLanguage($result['language_id']);

			if ($language_info) {
				$code = $language_info['code'];
				$image = $language_info['image'];
			} else {
				$code = '';
				$image = '';
			}

			$data['translations'][] = [
				'store'    => ($result['store_id'] ? $result['store'] : $this->language->get('text_default')),
				'image'    => $image,
				'language' => $code,
				'edit'     => $this->url->link('design/translation.form', 'user_token=' . $this->session->data['user_token'] . '&translation_id=' . $result['translation_id'])
			] + $result;
		}

		$url = $filter->getQueryString();
		$url .= ($order == 'ASC') ? '&order=DESC' : '&order=ASC';

		$data['sort_store'] = $this->url->link('design/translation.list', 'user_token=' . $this->session->data['user_token'] . '&sort=store' . $url);
		$data['sort_language'] = $this->url->link('design/translation.list', 'user_token=' . $this->session->data['user_token'] . '&sort=language' . $url);
		$data['sort_route'] = $this->url->link('design/translation.list', 'user_token=' . $this->session->data['user_token'] . '&sort=route' . $url);
		$data['sort_key'] = $this->url->link('design/translation.list', 'user_token=' . $this->session->data['user_token'] . '&sort=key' . $url);
		$data['sort_value'] = $this->url->link('design/translation.list', 'user_token=' . $this->session->data['user_token'] . '&sort=value' . $url);

		$url = $filter->getQueryString(true, true);

		$translation_total = $this->model_design_translation->getTotalTranslations($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $translation_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('design/translation.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($translation_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($translation_total - $this->config->get('config_pagination_admin'))) ? $translation_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $translation_total, ceil($translation_total / $this->config->get('config_pagination_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		return $this->load->view('design/translation_list', $data);
	}

	public function form(): void {
		$this->load->language('design/translation');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['text_form'] = !isset($this->request->get['translation_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$filter = new Filter($this->request, $this->filterKeys);
		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('design/translation', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['save'] = $this->url->link('design/translation.save', 'user_token=' . $this->session->data['user_token']);
		$data['back'] = $this->url->link('design/translation', 'user_token=' . $this->session->data['user_token'] . $url);

		if (isset($this->request->get['translation_id'])) {
			$this->load->model('design/translation');

			$translation_info = $this->model_design_translation->getTranslation($this->request->get['translation_id']);
		}

		if (!empty($translation_info)) {
			$data['translation_id'] = $translation_info['translation_id'];
		} else {
			$data['translation_id'] = 0;
		}

		// Store
		$this->load->model('setting/store');

		$data['stores'] = $this->model_setting_store->getStores();

		if (!empty($translation_info)) {
			$data['store_id'] = $translation_info['store_id'];
		} else {
			$data['store_id'] = 0;
		}

		// Language
		$this->load->model('localisation/language');

		$data['languages'] = $this->model_localisation_language->getLanguages();

		if (!empty($translation_info)) {
			$data['language_id'] = $translation_info['language_id'];
		} else {
			$data['language_id'] = '';
		}

		if (!empty($translation_info)) {
			$data['route'] = $translation_info['route'];
		} else {
			$data['route'] = '';
		}

		if (!empty($translation_info)) {
			$data['key'] = $translation_info['key'];
		} else {
			$data['key'] = '';
		}

		if (!empty($translation_info)) {
			$data['value'] = $translation_info['value'];
		} else {
			$data['value'] = '';
		}

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('design/translation_form', $data));
	}

	public function save(): void {
		$this->load->language('design/translation');

		$json = [];

		if (!$this->user->hasPermission('modify', 'design/translation')) {
			$json['error']['warning'] = $this->language->get('error_permission');
		}

		$required = [
			'translation_id' => 0,
			'store_id'       => 0,
			'language_id'    => 0,
			'route'          => '',
			'key'            => '',
			'value'          => ''
		];

		$post_info = $this->request->post + $required;

		if (!oc_validate_length($post_info['key'], 3, 64)) {
			$json['error']['key'] = $this->language->get('error_key');
		}

		$this->load->model('design/translation');

		// Check if there is already a route - key pair on the same store using the same language
		$translation_info = $this->model_design_translation->getTranslationByRouteKey($post_info['route'], $post_info['key'], $post_info['store_id'], $post_info['language_id']);

		if ($translation_info && (!$post_info['translation_id'] || ((int)$translation_info['translation_id'] !== (int)$post_info['translation_id']))) {
			$json['error']['key'] = $this->language->get('error_key_exists');
		}

		if (!$json) {
			$this->load->model('design/translation');

			if (!$post_info['translation_id']) {
				$this->model_design_translation->addTranslation($post_info);
			} else {
				$this->model_design_translation->editTranslation($post_info['translation_id'], $post_info);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete(): void {
		$this->load->language('design/translation');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (!$this->user->hasPermission('modify', 'design/translation')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->load->model('design/translation');

			foreach ($selected as $translation_id) {
				$this->model_design_translation->deleteTranslation($translation_id);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function path(): void {
		$this->load->language('design/translation');

		$json = [];

		if (isset($this->request->get['language_id'])) {
			$language_id = (int)$this->request->get['language_id'];
		} else {
			$language_id = 0;
		}

		// Language
		$this->load->model('localisation/language');

		$language_info = $this->model_localisation_language->getLanguage($language_id);

		if (!empty($language_info)) {
			$path = glob(DIR_CATALOG . 'language/' . $language_info['code'] . '/*');

			while (count($path) != 0) {
				$next = array_shift($path);

				foreach ((array)glob($next . '/*') as $file) {
					if (is_dir($file)) {
						$path[] = $file;
					}

					if (substr($file, -4) == '.php') {
						$json[] = substr(substr($file, strlen(DIR_CATALOG . 'language/' . $language_info['code'] . '/')), 0, -4);
					}
				}
			}

			$path = glob(DIR_EXTENSION . '*/catalog/language/' . $language_info['code'] . '/*');

			while (count($path) != 0) {
				$next = array_shift($path);

				foreach ((array)glob($next . '/*') as $file) {
					if (is_dir($file)) {
						$path[] = $file;
					}

					if (substr($file, -4) == '.php') {
						$new_path = substr($file, strlen(DIR_EXTENSION));

						$code = substr($new_path, 0, strpos($new_path, '/'));

						$length = strlen(DIR_EXTENSION . $code . '/catalog/language/' . $language_info['code'] . '/');

						$route = substr(substr($file, $length), 0, -4);

						$json[] = 'extension/' . $code . '/' . $route;
					}
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function translation(): void {
		$this->load->language('design/translation');

		$json = [];

		if (isset($this->request->get['store_id'])) {
			$store_id = (int)$this->request->get['store_id'];
		} else {
			$store_id = 0;
		}

		if (isset($this->request->get['language_id'])) {
			$language_id = (int)$this->request->get['language_id'];
		} else {
			$language_id = 0;
		}

		if (isset($this->request->get['path'])) {
			$route = $this->request->get['path'];
		} else {
			$route = '';
		}

		// Language
		$this->load->model('localisation/language');

		$language_info = $this->model_localisation_language->getLanguage($language_id);

		$part = explode('/', $route);

		if ($part[0] != 'extension') {
			$directory = DIR_CATALOG . 'language/';
		} else {
			$directory = DIR_EXTENSION . $part[1] . '/catalog/language/';

			array_shift($part);
			// Don't remove. Required for extension route.
			array_shift($part);

			$route = implode('/', $part);
		}

		if ($language_info && is_file($directory . $language_info['code'] . '/' . $route . '.php') && substr(str_replace('\\', '/', realpath($directory . $language_info['code'] . '/' . $route . '.php')), 0, strlen($directory)) == str_replace('\\', '/', $directory)) {
			$json = [];

			include($directory . $language_info['code'] . '/' . $route . '.php');

			if (!empty($_) && is_array($_)) {
				foreach ($_ as $key => $value) {
					$json[] = [
						'key'   => $key,
						'value' => $value
					];
				}
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function autocomplete(): void {
		$json = [];
		$filter_data = [];

		if (isset($this->request->get['filter_route'])) {
			$filter_data['filter_route'] = $this->request->get['filter_route'];
		} elseif (isset($this->request->get['filter_key'])) {
			$filter_data['filter_key'] = $this->request->get['filter_key'];
		} elseif (isset($this->request->get['filter_value'])) {
			$filter_data['filter_value'] = $this->request->get['filter_value'];
		}

		if (!empty($filter_data)) {
			$filter_data['limit'] = $this->config->get('config_autocomplete_limit');
			$this->load->model('design/translation');
			$json = $this->model_design_translation->autocomplete($filter_data);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
