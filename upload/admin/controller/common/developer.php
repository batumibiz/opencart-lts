<?php

namespace Opencart\Admin\Controller\Common;

use Opencart\System\Engine\Controller;

class Developer extends Controller {
	public function index(): void {
		$this->load->language('common/developer');

		$data['developer_sass'] = $this->config->get('developer_sass');

		$data['user_token'] = $this->session->data['user_token'];

		$this->response->setOutput($this->load->view('common/developer', $data));
	}

	public function edit(): void {
		$this->load->language('common/developer');

		$json = [];

		if (!$this->user->hasPermission('modify', 'common/developer')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			// Setting
			$this->load->model('setting/setting');

			$this->model_setting_setting->editSetting('developer', $this->request->post, 0);

			$json['success'] = $this->language->get('text_developer_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function systemcache(): void {
		$this->load->language('common/developer');

		$json = [];

		if (!$this->user->hasPermission('modify', 'common/developer')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->cache->clear();
			$this->cleanDirectory(DIR_CACHE);
			$json['success'] = $this->language->get('text_systemcache_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function imagecache(): void {
		$this->load->language('common/developer');

		$json = [];

		if (!$this->user->hasPermission('modify', 'common/developer')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			$this->cleanDirectory(DIR_IMAGE . 'cache');
			$json['success'] = $this->language->get('text_imagecache_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function sass(): void {
		$this->load->language('common/developer');

		$json = [];

		if (!$this->user->hasPermission('modify', 'common/developer')) {
			$json['error'] = $this->language->get('error_permission');
		}

		if (!$json) {
			// Cleans the *.css files of a specified directory
			array_map('unlink', array_filter(glob(DIR_APPLICATION . 'view/stylesheet/*.css'), 'is_file'));
			array_map('unlink', array_filter(glob(DIR_CATALOG . 'view/stylesheet/*.css'), 'is_file'));

			$json['success'] = $this->language->get('text_sass_success');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	/**
	 * Cleans the contents of a specified directory by deleting all files and subdirectories,
	 * except for the 'index.html' file in the root of the directory.
	 *
	 * @param string $dir the path of the directory to clean
	 *
	 * @return bool returns true if the directory was successfully cleaned, or false if the provided path is not a directory
	 */
	private function cleanDirectory(string $dir): bool {
		if (!is_dir($dir)) {
			return false;
		}

		$dir = rtrim($dir, '/\\') . DIRECTORY_SEPARATOR;
		$indexHtmlPath = $dir . 'index.html';

		$iterator = new \RecursiveIteratorIterator(
			new \RecursiveDirectoryIterator($dir, \RecursiveDirectoryIterator::SKIP_DOTS),
			\RecursiveIteratorIterator::CHILD_FIRST
		);

		foreach ($iterator as $file) {
			/** @var \SplFileInfo $file */
			$pathname = $file->getPathname();

			// Пропускаем index.html только в корневой папке
			if ($pathname === $indexHtmlPath) {
				continue;
			}

			if ($file->isDir()) {
				@rmdir($pathname);
			} else {
				@unlink($pathname);
			}
		}

		return true;
	}
}
