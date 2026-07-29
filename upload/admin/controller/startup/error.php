<?php

namespace Opencart\Admin\Controller\Startup;

use Opencart\System\Engine\Controller;

class Error extends Controller {
	public function index(): void {
		$this->registry->set('log', new \Opencart\System\Library\Log($this->config->get('config_error_filename') ?: $this->config->get('error_filename')));

		set_error_handler([$this, 'error']);
		set_exception_handler([$this, 'exception']);
	}

	public function error(int $code, string $message, string $file, int $line): bool {
		// PHP 8 compatible check for the @ suppression operator
		if (!(error_reporting() & $code)) {
			// Return false to let the standard PHP internal error handler take over (or do nothing)
			return false;
		}

		switch ($code) {
			case E_NOTICE:
			case E_USER_NOTICE:
				$error = 'Notice';
				break;
			case E_WARNING:
			case E_USER_WARNING:
				$error = 'Warning';
				break;
			case E_ERROR:
			case E_USER_ERROR:
				$error = 'Fatal Error';
				break;
			case E_DEPRECATED:
			case E_USER_DEPRECATED:
				$error = 'Deprecated';
				break;
			default:
				$error = 'Unknown';
				break;
		}

		if ($this->config->get('config_error_log')) {
			$this->log->write('PHP ' . $error . ':  ' . $message . ' in ' . $file . ' on line ' . $line);
		}

		if ($this->config->get('config_error_display')) {
			echo '<b>' . $error . '</b>: ' . $message . ' in <b>' . $file . '</b> on line <b>' . $line . '</b>';
		} elseif ($error === 'Fatal Error' || $error === 'Unknown') {
			header('Location: ' . $this->config->get('error_page'));
			exit();
		}

		return true;
	}

	public function exception(\Throwable $e): void {
		$output  = 'Error: ' . $e->getMessage() . "\n";
		$output .= 'File: ' . $e->getFile() . "\n";
		$output .= 'Line: ' . $e->getLine() . "\n\n";

		foreach ($e->getTrace() as $key => $trace) {
			$output .= 'Backtrace: ' . $key . "\n";
			$output .= 'File: ' . ($trace['file'] ?? 'unknown') . "\n";
			$output .= 'Line: ' . ($trace['line'] ?? 'unknown') . "\n";

			if (isset($trace['class'])) {
				$output .= 'Class: ' . $trace['class'] . "\n";
			}

			$output .= 'Function: ' . $trace['function'] . "\n\n";
		}

		if ($this->config->get('config_error_log')) {
			$this->log->write(trim($output));
		}

		if ($this->config->get('config_error_display')) {
			echo $output;
		} else {
			header('Location: ' . $this->config->get('error_page'));
			exit();
		}
	}
}
