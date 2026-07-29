<?php

namespace Opencart\Admin\Controller\Event;

use Opencart\System\Engine\Controller;

class Statistics extends Controller {
	public function addReview(string &$route, array &$args, &$output): void {
		$this->load->model('report/statistics');

		$this->model_report_statistics->addValue('review', 1);
	}

	public function deleteReview(string &$route, array &$args, &$output): void {
		$this->load->model('report/statistics');

		$this->model_report_statistics->removeValue('review', 1);
	}

	public function addReturn(string &$route, array &$args, &$output): void {
		$this->load->model('report/statistics');

		$this->model_report_statistics->addValue('returns', 1);
	}

	public function deleteReturn(string &$route, array &$args, &$output): void {
		$this->load->model('report/statistics');

		$this->model_report_statistics->removeValue('returns', 1);
	}
}
