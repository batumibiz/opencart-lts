<?php

namespace Opencart\System\Engine;

use Opencart\System\Library\Document;
use Opencart\System\Library\Language;
use Opencart\System\Library\Request;
use Opencart\System\Library\Response;
use Opencart\System\Library\Session;
use Opencart\System\Library\Url;

/**
 * Class Controller
 *
 * @mixin \Opencart\System\Engine\Registry
 *
 * @property Config   $config
 * @property Document $document
 * @property Language $language
 * @property Loader   $load
 * @property Request  $request
 * @property Response $response
 * @property Session  $session
 * @property Url      $url
 */
class Controller {
	/**
	 * @var \Opencart\System\Engine\Registry
	 */
	protected \Opencart\System\Engine\Registry $registry;

	/**
	 * Constructor
	 *
	 * @param \Opencart\System\Engine\Registry $registry
	 */
	public function __construct(\Opencart\System\Engine\Registry $registry) {
		$this->registry = $registry;
	}

	/**
	 * __get
	 *
	 * @param string $key
	 *
	 * @return object
	 */
	public function __get(string $key): object {
		if ($this->registry->has($key)) {
			return $this->registry->get($key);
		} else {
			throw new \Exception('Error: Could not call registry key ' . $key . '!');
		}
	}

	/**
	 * __set
	 *
	 * @param string $key
	 * @param object $value
	 *
	 * @return void
	 */
	public function __set(string $key, object $value): void {
		$this->registry->set($key, $value);
	}
}
