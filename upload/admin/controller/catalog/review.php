<?php

namespace Opencart\Admin\Controller\Catalog;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class Review extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_product'   => true,
		'filter_author'    => false,
		'filter_status'    => false,
		'filter_date_from' => false,
		'filter_date_to'   => false,
	];

	public function index(): void {
		$filter = new Filter($this->request, $this->filterKeys);

		$data = $filter->getFilterData();

		$this->load->language('catalog/review');

		$this->document->setTitle($this->language->get('heading_title'));

		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/review', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['add'] = $this->url->link('catalog/review.form', 'user_token=' . $this->session->data['user_token'] . $url);
		$data['delete'] = $this->url->link('catalog/review.delete', 'user_token=' . $this->session->data['user_token']);

		$data['list'] = $this->getList();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/review', $data));
	}

	public function list(): void {
		$this->load->language('catalog/review');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'r.date_added');
		$order = (string)($this->request->get['order'] ?? 'DESC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('catalog/review.list', 'user_token=' . $this->session->data['user_token'] . $url);

		// Review
		$data['reviews'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		$this->load->model('catalog/review');

		$results = $this->model_catalog_review->getReviews($filter_data);

		foreach ($results as $result) {
			$data['reviews'][] = [
				'date_added' => date($this->language->get('date_format_short'), strtotime($result['date_added'])),
				'edit'       => $this->url->link('catalog/review.form', 'user_token=' . $this->session->data['user_token'] . '&review_id=' . $result['review_id'] . $url)
			] + $result;
		}

		$url = $filter->getQueryString();
		$url .= ($order == 'ASC') ? '&order=DESC' : '&order=ASC';

		$data['sort_product'] = $this->url->link('catalog/review.list', 'user_token=' . $this->session->data['user_token'] . '&sort=pd.name' . $url);
		$data['sort_author'] = $this->url->link('catalog/review.list', 'user_token=' . $this->session->data['user_token'] . '&sort=r.author' . $url);
		$data['sort_rating'] = $this->url->link('catalog/review.list', 'user_token=' . $this->session->data['user_token'] . '&sort=r.rating' . $url);
		$data['sort_date_added'] = $this->url->link('catalog/review.list', 'user_token=' . $this->session->data['user_token'] . '&sort=r.date_added' . $url);

		$url = $filter->getQueryString(true, true);

		$review_total = $this->model_catalog_review->getTotalReviews($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $review_total,
			'page'  => $page,
			'limit' => $this->config->get('config_pagination_admin'),
			'url'   => $this->url->link('catalog/review.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($review_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($review_total - $this->config->get('config_pagination_admin'))) ? $review_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $review_total, ceil($review_total / $this->config->get('config_pagination_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		return $this->load->view('catalog/review_list', $data);
	}

	public function form(): void {
		$this->load->language('catalog/review');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['text_form'] = !isset($this->request->get['review_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');

		$filter = new Filter($this->request, $this->filterKeys);
		$url = $filter->getQueryString(true, true, true);

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/review', 'user_token=' . $this->session->data['user_token'] . $url)
		];

		$data['save'] = $this->url->link('catalog/review.save', 'user_token=' . $this->session->data['user_token']);
		$data['back'] = $this->url->link('catalog/review', 'user_token=' . $this->session->data['user_token'] . $url);

		$review_info = [];

		if (isset($this->request->get['review_id'])) {
			$this->load->model('catalog/review');

			$review_info = $this->model_catalog_review->getReview((int)$this->request->get['review_id']);
		}

		if (!empty($review_info)) {
			$data['review_id'] = $review_info['review_id'];
		} else {
			$data['review_id'] = 0;
		}

		if (!empty($review_info)) {
			$data['product_id'] = $review_info['product_id'];
		} else {
			$data['product_id'] = '';
		}

		if (!empty($review_info)) {
			$data['product'] = $review_info['product'];
		} else {
			$data['product'] = '';
		}

		if (!empty($review_info)) {
			$data['author'] = $review_info['author'];
		} else {
			$data['author'] = '';
		}

		if (!empty($review_info)) {
			$data['text'] = $review_info['text'];
		} else {
			$data['text'] = '';
		}

		if (!empty($review_info)) {
			$data['rating'] = $review_info['rating'];
		} else {
			$data['rating'] = '';
		}

		if (!empty($review_info)) {
			$data['date_added'] = ($review_info['date_added'] != '0000-00-00 00:00:00' ? $review_info['date_added'] : date('Y-m-d H:i:s'));
		} else {
			$data['date_added'] = date('Y-m-d H:i:s');
		}

		if (!empty($review_info)) {
			$data['status'] = $review_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/review_form', $data));
	}

	public function save(): void {
		$this->load->language('catalog/review');

		$json = [];

		if (!$this->user->hasPermission('modify', 'catalog/review')) {
			$json['error']['warning'] = $this->language->get('error_permission');
		}

		$required = [
			'review_id'  => 0,
			'author'     => '',
			'product_id' => 0,
			'text'       => '',
			'rating'     => 0,
			'status'     => 0
		];

		$post_info = $this->request->post + $required;

		if (!oc_validate_length($post_info['author'], 3, 64)) {
			$json['error']['author'] = $this->language->get('error_author');
		}

		if (!$post_info['product_id']) {
			$json['error']['product'] = $this->language->get('error_product');
		}

		if (oc_strlen($post_info['text']) < 1) {
			$json['error']['text'] = $this->language->get('error_text');
		}

		if (!isset($post_info['rating']) || $post_info['rating'] < 0 || $post_info['rating'] > 5) {
			$json['error']['rating'] = $this->language->get('error_rating');
		}

		if (isset($json['error']) && !empty($json['error']['warning'])) {
			$json['error']['warning'] = $this->language->get('error_warning');
		}

		if (!$json) {
			$this->load->model('catalog/review');

			if (!$post_info['review_id']) {
				$json['review_id'] = $this->model_catalog_review->addReview($post_info);
			} else {
				$this->model_catalog_review->editReview($post_info['review_id'], $post_info);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete(): void {
		$this->load->language('catalog/review');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (!$this->user->hasPermission('modify', 'catalog/review')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->load->model('catalog/review');

			foreach ($selected as $review_id) {
				$this->model_catalog_review->deleteReview($review_id);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function sync(): void {
		$this->load->language('catalog/review');

		$json = [];

		if (isset($this->request->get['page'])) {
			$page = (int)$this->request->get['page'];
		} else {
			$page = 1;
		}

		if (!$this->user->hasPermission('modify', 'catalog/review')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			// Product
			$this->load->model('catalog/product');

			// Review
			$this->load->model('catalog/review');

			$limit = 10;

			$product_data = [
				'start' => ($page - 1) * $limit,
				'limit' => $limit
			];

			$results = $this->model_catalog_product->getProducts($product_data);

			foreach ($results as $result) {
				$this->model_catalog_product->editRating($result['product_id'], $this->model_catalog_review->getRating($result['product_id']));
			}

			$product_total = $this->model_catalog_product->getTotalProducts();

			$start = ($page - 1) * $limit;
			$end = $start > ($product_total - $limit) ? $product_total : ($start + $limit);

			if ($end < $product_total) {
				$json['text'] = sprintf($this->language->get('text_next'), $start, $end, $product_total);

				$json['next'] = $this->url->link('catalog/review.sync', 'user_token=' . $this->session->data['user_token'] . '&page=' . ($page + 1), true);
			} else {
				$json['success'] = $this->language->get('text_success');

				$json['next'] = '';
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
