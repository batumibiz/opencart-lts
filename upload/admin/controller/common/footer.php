<?php

namespace Opencart\Admin\Controller\Common;

use Opencart\System\Engine\Controller;

class Footer extends Controller {
	public function index(): string {
		$this->load->language('common/footer');

		if ($this->user->isLogged() && isset($this->request->get['user_token']) && ($this->request->get['user_token'] == $this->session->data['user_token'])) {
			$data['text_version'] = sprintf($this->language->get('text_version'), VERSION);
			$data['text_oc_plus_version'] = sprintf($this->language->get('text_oc_plus_version'), OC_PLUS__VERSION);
		} else {
			$data['text_version'] = '';
			$data['text_oc_plus_version'] = '';
		}

		$data['bootstrap'] = 'view/javascript/bootstrap/bootstrap.bundle.min.js';

		return $this->load->view('common/footer', $data);
	}
}
