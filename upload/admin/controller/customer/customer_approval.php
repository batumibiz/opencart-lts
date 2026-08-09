<?php

namespace Opencart\Admin\Controller\Customer;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class CustomerApproval extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_customer'          => true,
		'filter_email'             => true,
		'filter_customer_group_id' => false,
		'filter_type'              => false,
		'filter_date_from'         => false,
		'filter_date_to'           => false,
	];

	public function index(): void {
		$this->load->language('customer/customer_approval');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('customer/customer_approval', 'user_token=' . $this->session->data['user_token'])
		];

		$data['approve'] = $this->url->link('customer/customer_approval.approve', 'user_token=' . $this->session->data['user_token'], true);
		$data['deny'] = $this->url->link('customer/customer_approval.deny', 'user_token=' . $this->session->data['user_token'], true);

		// Customer Group
		$this->load->model('customer/customer_group');

		$data['customer_groups'] = $this->model_customer_customer_group->getCustomerGroups();

		$data['list'] = $this->getList();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('customer/customer_approval', $data));
	}

	public function list(): void {
		$this->load->language('customer/customer_approval');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'pd.name');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('customer/customer_approval.list', 'user_token=' . $this->session->data['user_token'] . $url, true);

		// Customer Approval
		$data['customer_approvals'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		$this->load->model('customer/customer_approval');

		$results = $this->model_customer_customer_approval->getCustomerApprovals($filter_data);

		foreach ($results as $result) {
			$data['customer_approvals'][] = [
				'type'       => $this->language->get('text_' . $result['type']),
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'approve'    => $this->url->link('customer/customer_approval.approve', 'user_token=' . $this->session->data['user_token'] . '&customer_approval_id=' . $result['customer_approval_id'], true),
				'deny'       => $this->url->link('customer/customer_approval.deny', 'user_token=' . $this->session->data['user_token'] . '&customer_approval_id=' . $result['customer_approval_id'], true),
				'edit'       => $this->url->link('customer/customer.form', 'user_token=' . $this->session->data['user_token'] . '&customer_id=' . $result['customer_id'], true)
			] + $result;
		}

		$url = $filter->getQueryString(true, true);

		$customer_approval_total = $this->model_customer_customer_approval->getTotalCustomerApprovals($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $customer_approval_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('customer/customer_approval.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($customer_approval_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($customer_approval_total - $this->config->get('config_pagination_admin'))) ? $customer_approval_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $customer_approval_total, ceil($customer_approval_total / $this->config->get('config_pagination_admin')));

		return $this->load->view('customer/customer_approval_list', $data);
	}

	public function approve(): void {
		$this->load->language('customer/customer_approval');

		$json = [];

		if (!$this->user->hasPermission('modify', 'customer/customer_approval')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->load->model('customer/customer_approval');

			$approvals = [];

			if (isset($this->request->post['selected'])) {
				$approvals = (array)$this->request->post['selected'];
			}

			if (isset($this->request->get['customer_approval_id'])) {
				$approvals[] = (int)$this->request->get['customer_approval_id'];
			}

			foreach ($approvals as $customer_approval_id) {
				$customer_approval_info = $this->model_customer_customer_approval->getCustomerApproval($customer_approval_id);

				if ($customer_approval_info) {
					if ($customer_approval_info['type'] == 'customer') {
						$this->model_customer_customer_approval->approveCustomer($customer_approval_info['customer_id']);
					}

					if ($customer_approval_info['type'] == 'affiliate') {
						$this->model_customer_customer_approval->approveAffiliate($customer_approval_info['customer_id']);
					}
				}
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function deny(): void {
		$this->load->language('customer/customer_approval');

		$json = [];

		if (!$this->user->hasPermission('modify', 'customer/customer_approval')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->load->model('customer/customer_approval');

			$denials = [];

			if (isset($this->request->post['selected'])) {
				$denials = (array)$this->request->post['selected'];
			}

			if (isset($this->request->get['customer_approval_id'])) {
				$denials[] = (int)$this->request->get['customer_approval_id'];
			}

			foreach ($denials as $customer_approval_id) {
				$customer_approval_info = $this->model_customer_customer_approval->getCustomerApproval($customer_approval_id);

				if ($customer_approval_info) {
					if ($customer_approval_info['type'] == 'customer') {
						$this->model_customer_customer_approval->denyCustomer($customer_approval_info['customer_id']);
					}

					if ($customer_approval_info['type'] == 'affiliate') {
						$this->model_customer_customer_approval->denyAffiliate($customer_approval_info['customer_id']);
					}
				}
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
