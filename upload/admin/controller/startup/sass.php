<?php

namespace Opencart\Admin\Controller\Startup;

use Opencart\System\Engine\Controller;

class Sass extends Controller {
	public function index(): void {
		$path = DIR_APPLICATION . 'view/stylesheet/';
		$files = glob($path . '*.scss');

		if ($files) {
			foreach ($files as $file) {
				$basename = basename($file, '.scss');
				$stylesheet = $path . $basename . '.css';
				$stylesheetMin = $path . $basename . '.min.css';

				// Compiling a regular .css file
				if (!is_file($stylesheet) || !$this->config->get('developer_sass')) {
					$scss = new \ScssPhp\ScssPhp\Compiler();
					$scss->setImportPaths($path);

					$output = $scss->compileString('@import "' . $basename . '.scss"')->getCss();
					file_put_contents($stylesheet, $output, LOCK_EX);
				}

				// Compiling the minified .min.css file
				if (!is_file($stylesheetMin) || !$this->config->get('developer_sass')) {
					$scss = new \ScssPhp\ScssPhp\Compiler();
					$scss->setImportPaths($path);
					$scss->setOutputStyle(\ScssPhp\ScssPhp\OutputStyle::COMPRESSED);

					$output = $scss->compileString('@import "' . $basename . '.scss"')->getCss();
					file_put_contents($stylesheetMin, $output, LOCK_EX);
				}
			}
		}
	}
}
