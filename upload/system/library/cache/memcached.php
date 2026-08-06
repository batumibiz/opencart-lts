<?php

namespace Opencart\System\Library\Cache;

class Memcached {
	private \Memcached $memcached;

	private int $expire;

	private string $prefix;

	public function __construct(int $expire = 3600) {
		defined('CACHE_HOSTNAME') || define('CACHE_HOSTNAME', '127.0.0.1');
		defined('CACHE_PORT') || define('CACHE_PORT', 11211);
		defined('CACHE_PREFIX') || define('CACHE_PREFIX', 'oc_');

		$this->prefix = CACHE_PREFIX;

		$this->expire = $expire;
		$this->memcached = new \Memcached();
		$this->memcached->addServer(CACHE_HOSTNAME, CACHE_PORT);
	}

	public function get(string $key): mixed {
		return $this->memcached->get($this->prefix . $key);
	}

	public function set(string $key, mixed $value, int $expire = 0): void {
		if (!$expire) {
			$expire = $this->expire;
		}

		$this->memcached->set($this->prefix . $key, $value, $expire);
	}

	public function delete(string $key): void {
		$this->memcached->delete($this->prefix . $key);
	}

	public function clear(): void {
		$this->memcached->flush();
	}
}
