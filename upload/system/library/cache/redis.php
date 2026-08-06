<?php

namespace Opencart\System\Library\Cache;

class Redis {
	/**
	 * @var \Redis
	 */
	private \Redis $redis;
	/**
	 * @var int
	 */
	private int $expire;

	private string $prefix;

	/**
	 * Constructor
	 *
	 * @param int $expire
	 */
	public function __construct(int $expire = 3600) {
		defined('CACHE_HOSTNAME') || define('CACHE_HOSTNAME', '127.0.0.1');
		defined('CACHE_PORT') || define('CACHE_PORT', 6379);
		defined('CACHE_PASSWORD') || define('CACHE_PASSWORD', '');
		defined('CACHE_PREFIX') || define('CACHE_PREFIX', 'oc_');

		$this->prefix = CACHE_PREFIX;
		$this->expire = $expire;

		$this->redis = new \Redis();

		if (str_contains(CACHE_HOSTNAME, 'unix:')) {
			$socketPath = preg_replace('#^unix:/*#', '/', CACHE_HOSTNAME);
			$this->redis->pconnect($socketPath, 0);
		} else {
			$this->redis->pconnect(CACHE_HOSTNAME, CACHE_PORT);
		}

		$this->redis->auth(CACHE_PASSWORD);
	}

	/**
	 * Get
	 *
	 * @param string $key
	 *
	 * @return mixed
	 */
	public function get(string $key) {
		$data = $this->redis->get($this->prefix . $key);

		if ($data === false) {
			return [];
		}

		$decoded = json_decode($data, true);

		return $decoded !== null ? $decoded : [];
	}

	/**
	 * Set
	 *
	 * @param string $key
	 * @param mixed  $value
	 * @param int    $expire
	 *
	 * @return void
	 */
	public function set(string $key, $value, int $expire = 0): void {
		if (!$expire) {
			$expire = $this->expire;
		}

		$status = $this->redis->set($this->prefix . $key, json_encode($value));

		if ($status) {
			$this->redis->expire($this->prefix . $key, $expire);
		}
	}

	/**
	 * Delete
	 *
	 * @param string $key
	 *
	 * @return void
	 */
	public function delete(string $key): void {
		$this->redis->del($this->prefix . $key);
	}

	/**
	 * Clear
	 *
	 * Clear all cache
	 *
	 * @return void
	 */
	public function clear(): void {
		$this->redis->flushAll();
	}
}
