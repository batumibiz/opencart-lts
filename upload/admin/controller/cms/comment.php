<?php

namespace Opencart\Admin\Controller\Cms;

use Opencart\System\Engine\Controller;
use Opencart\System\Library\Filter;

class Comment extends Controller {
	/**
	 * List of filter request keys,
	 * and whether their value must be urlencoded when it is placed into a query string.
	 *
	 * @var array<string, bool>
	 */
	private array $filterKeys = [
		'filter_keyword'   => true,
		'filter_article'   => true,
		'filter_customer'  => true,
		'filter_email'     => false,
		'filter_date_from' => false,
		'filter_date_to'   => false,
		'filter_status'    => false,
	];

	public function index(): void {
		$this->load->language('cms/comment');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = [];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'user_token=' . $this->session->data['user_token'])
		];

		$data['breadcrumbs'][] = [
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('cms/comment', 'user_token=' . $this->session->data['user_token'])
		];

		$data['approve'] = $this->url->link('cms/comment.approve', 'user_token=' . $this->session->data['user_token']);
		$data['spam'] = $this->url->link('cms/comment.spam', 'user_token=' . $this->session->data['user_token']);
		$data['delete'] = $this->url->link('cms/comment.delete', 'user_token=' . $this->session->data['user_token']);

		$data['list'] = $this->getList();

		$data['user_token'] = $this->session->data['user_token'];

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('cms/comment', $data));
	}

	public function list(): void {
		$this->load->language('cms/comment');
		$this->response->setOutput($this->getList());
	}

	public function getList(): string {
		$filter = new Filter($this->request, $this->filterKeys);

		$filter_data = $filter->getFilterData();

		$sort = (string)($this->request->get['sort'] ?? 'pd.name');
		$order = (string)($this->request->get['order'] ?? 'ASC');
		$page = (int)($this->request->get['page'] ?? 1);

		$url = $filter->getQueryString(false, false, true);

		$data['action'] = $this->url->link('cms/comment.list', 'user_token=' . $this->session->data['user_token'] . $url);

		$data['comments'] = [];

		$filter_data['sort'] = $sort;
		$filter_data['order'] = $order;
		$filter_data['start'] = ($page - 1) * $this->config->get('config_pagination_admin');
		$filter_data['limit'] = $this->config->get('config_pagination_admin');

		$this->load->model('cms/article');

		$results = $this->model_cms_article->getComments($filter_data);

		foreach ($results as $result) {
			$article_info = $this->model_cms_article->getArticle($result['article_id']);

			if ($article_info) {
				$article = $article_info['name'];
			} else {
				$article = '';
			}

			if (!$result['status']) {
				$approve = $this->url->link('cms/comment.approve', 'user_token=' . $this->session->data['user_token'] . '&article_comment_id=' . $result['article_comment_id'] . $url);
			} else {
				$approve = '';
			}

			$data['comments'][] = [
				'article'       => $article,
				'article_edit'  => $this->url->link('cms/article.form', 'user_token=' . $this->session->data['user_token'] . '&article_id=' . $result['article_id']),
				'customer_edit' => $result['customer_id'] ? $this->url->link('customer/customer.form', 'user_token=' . $this->session->data['user_token'] . '&customer_id=' . $result['customer_id']) : '',
				'comment'       => nl2br($result['comment']),
				'date_added'    => date($this->language->get('datetime_format'), strtotime($result['date_added'])),
				'approve'       => $approve,
				'spam'          => $this->url->link('cms/comment.spam', 'user_token=' . $this->session->data['user_token'] . '&article_comment_id=' . $result['article_comment_id'] . $url),
				'delete'        => $this->url->link('cms/comment.delete', 'user_token=' . $this->session->data['user_token'] . '&article_comment_id=' . $result['article_comment_id'] . $url)
			] + $result;
		}

		$url = $filter->getQueryString(true, true);

		$comment_total = $this->model_cms_article->getTotalComments($filter_data);

		$data['pagination'] = $this->load->controller('common/pagination', [
			'total' => $comment_total,
			'page'  => $page,
			'limit' => 10,
			'url'   => $this->url->link('cms/comment.list', 'user_token=' . $this->session->data['user_token'] . $url . '&page={page}')
		]);

		$data['results'] = sprintf($this->language->get('text_pagination'), ($comment_total) ? (($page - 1) * $this->config->get('config_pagination_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_pagination_admin')) > ($comment_total - $this->config->get('config_pagination_admin'))) ? $comment_total : ((($page - 1) * $this->config->get('config_pagination_admin')) + $this->config->get('config_pagination_admin')), $comment_total, ceil($comment_total / $this->config->get('config_pagination_admin')));

		return $this->load->view('cms/comment_list', $data);
	}

	public function approve(): void {
		$this->load->language('cms/comment');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (isset($this->request->get['article_comment_id'])) {
			$selected[] = (int)$this->request->get['article_comment_id'];
		}

		if (!$this->user->hasPermission('modify', 'cms/comment')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			// Article
			$this->load->model('cms/article');

			// Customer
			$this->load->model('customer/customer');

			foreach ($selected as $article_comment_id) {
				$comment_info = $this->model_cms_article->getComment($article_comment_id);

				if ($comment_info) {
					$this->model_cms_article->editCommentStatus($article_comment_id, true);

					if ($comment_info['customer_id']) {
						$this->model_customer_customer->editCommenter($comment_info['customer_id'], true);

						$filter_data = [
							'filter_customer_id' => $comment_info['customer_id'],
							'filter_status'      => 0
						];

						$results = $this->model_cms_article->getComments($filter_data);

						foreach ($results as $result) {
							$this->model_cms_article->editCommentStatus($result['article_comment_id'], true);
						}
					}
				}
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function spam(): void {
		$this->load->language('cms/comment');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (isset($this->request->get['article_comment_id'])) {
			$selected[] = (int)$this->request->get['article_comment_id'];
		}

		if (!$this->user->hasPermission('modify', 'cms/comment')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			// Article
			$this->load->model('cms/article');

			// Customer
			$this->load->model('customer/customer');

			foreach ($selected as $article_comment_id) {
				$comment_info = $this->model_cms_article->getComment($article_comment_id);

				if ($comment_info) {
					$this->model_cms_article->editCommentStatus($article_comment_id, false);

					if ($comment_info['customer_id']) {
						$this->model_customer_customer->editCommenter($comment_info['customer_id'], false);
						$this->model_customer_customer->addHistory($comment_info['customer_id'], 'SPAMMER!!!');

						// Delete all customer comments
						$results = $this->model_cms_article->getComments(['filter_customer_id' => $comment_info['customer_id']]);

						foreach ($results as $result) {
							$this->model_cms_article->deleteComment($result['article_comment_id']);
						}
					}
				}
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function delete(): void {
		$this->load->language('cms/comment');

		$json = [];

		if (isset($this->request->post['selected'])) {
			$selected = (array)$this->request->post['selected'];
		} else {
			$selected = [];
		}

		if (isset($this->request->get['article_comment_id'])) {
			$selected[] = (int)$this->request->get['article_comment_id'];
		}

		if (!$this->user->hasPermission('modify', 'cms/comment')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			// Article
			$this->load->model('cms/article');

			foreach ($selected as $article_comment_id) {
				$this->model_cms_article->deleteComment($article_comment_id);
			}

			$json['success'] = $this->language->get('text_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function rating(): void {
		$this->load->language('cms/comment');

		$json = [];

		if (isset($this->request->get['page'])) {
			$page = (int)$this->request->get['page'];
		} else {
			$page = 1;
		}

		if (!$this->user->hasPermission('modify', 'cms/comment')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$limit = 100;

			// Article
			$filter_data = [
				'sort'  => 'date_added',
				'order' => 'ASC',
				'start' => ($page - 1) * $limit,
				'limit' => $limit
			];

			$this->load->model('cms/article');

			$results = $this->model_cms_article->getComments($filter_data);

			foreach ($results as $result) {
				$like = 0;
				$dislike = 0;

				$ratings = $this->model_cms_article->getRatings($result['article_id'], $result['article_comment_id']);

				foreach ($ratings as $rating) {
					if ($rating['rating'] == 1) {
						$like = $rating['total'];
					}

					if ($rating['rating'] == 0) {
						$dislike = $rating['total'];
					}
				}

				$this->model_cms_article->editCommentRating($result['article_id'], $result['article_comment_id'], $like - $dislike);
			}

			$comment_total = $this->model_cms_article->getTotalComments();

			$start = ($page - 1) * $limit;
			$end = ($start > ($comment_total - $limit)) ? $comment_total : ($start + $limit);

			if ($end < $comment_total) {
				$json['text'] = sprintf($this->language->get('text_next'), $start ?: 1, $end, $comment_total);

				$json['next'] = $this->url->link('cms/comment.rating', 'user_token=' . $this->session->data['user_token'] . '&page=' . ($page + 1), true);
			} else {
				$json['success'] = $this->language->get('text_success');

				$json['next'] = '';
			}
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}
