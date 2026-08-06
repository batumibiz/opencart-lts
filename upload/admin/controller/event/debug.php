<?php

namespace Opencart\Admin\Controller\Event;

use Opencart\System\Engine\Controller;

class Debug extends Controller {
	/**
	 * @param string            $route
	 * @param array<int, mixed> $args
	 */
	public function before(string &$route, array &$args): void {
		if ($route == 'common/home') { // Add the route you want to test
			//$this->session->data['debug'][$route] = microtime();
		}
	}

	/**
	 * @param string            $route
	 * @param array<int, mixed> $args
	 * @param mixed             $output
	 */
	public function after(string $route, array &$args, &$output): void {
		if ($route == 'common/home') {
			// add the route you want to test
			if (isset($this->session->data['debug'][$route])) {
				$log_data = [
					'route' => $route,
					'time'  => microtime() - $this->session->data['debug'][$route]
				];

				$this->log->write($route);
			}
		}
	}
}
