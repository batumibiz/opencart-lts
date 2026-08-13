<?php

namespace Opencart\Admin\Controller\Report;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class Online extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_customer' => true,
		'filter_ip'       => false
	];

	public function index(): void {
		$filter = new Filter($this->request, $this->filterKeys);

		$data = $filter->getFilterData();

		$this->load->language('report/online');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('report/online', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['list'] = $this->getList();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('report/online', $data));
	}

	public function list(): void {
		$this->load->language('report/online');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'd.name');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		// Customer
		$data['customers'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		// Online
		$this->load->model('report/online');

		$this->load->model('customer/customer');

		$results = $this->model_report_online->getOnline($filter_data);

		foreach ($results as $result) {
			$customer_info = $this->model_customer_customer->getCustomer($result['customer_id']);

			if ($customer_info) {
				$customer = $customer_info['firstname'] . ' ' . $customer_info['lastname'];
			} else {
				$customer = $this->language->get('text_guest');
			}

			$data['customers'][] = [
				'customer'   => $customer,
				'date_added' => date($this->language->get('datetime_format'), strtotime($result['date_added'])),
				'edit'       => $this->url->link('customer/customer.form', 'user_token=' . $this->session->data['user_token'] . '&customer_id=' . $result['customer_id'])
			] + $result;
		}

		$url = $filter->getQueryString(true, true);

		$customer_total = $this->model_report_online->getTotalOnline($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $customer_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('report/online.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($customer_total - $this->config->get('config_pagination_admin'))) ? $customer_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $customer_total, ceil($customer_total / $this->config->get('config_pagination_admin')));

		return $this->load->view('report/online_list', $data);
	}

	public function autocomplete(): void {
		$json = [];

		if (isset($this->request->get['autocomplete_ip'])) {
			$filter_data = [
				'filter_ip' => $this->request->get['autocomplete_ip'],
				'limit'     => $this->config->get('config_autocomplete_limit')
			];

			$this->load->model('report/online');
			$json = $this->model_report_online->getIp($filter_data);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
