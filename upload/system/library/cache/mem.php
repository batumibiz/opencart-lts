<?php

namespace Opencart\System\Library\Cache;

class Mem {
	private \Memcache $memcache;

	private int $expire;

	private string $prefix;

	public function __construct(int $expire = 3600) {
		defined('CACHE_HOSTNAME') || define('CACHE_HOSTNAME', '127.0.0.1');
		defined('CACHE_PORT') || define('CACHE_PORT', 11211);
		defined('CACHE_PREFIX') || define('CACHE_PREFIX', 'oc_');

		$this->prefix = CACHE_PREFIX;
		$this->expire = $expire;

		$this->memcache = new \Memcache();
		$this->memcache->pconnect(CACHE_HOSTNAME, CACHE_PORT);
	}

	/**
	 * Get
	 *
	 * @param string $key
	 *
	 * @return mixed
	 */
	public function get(string $key) {
		return $this->memcache->get($this->prefix . $key);
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

		$this->memcache->set($this->prefix . $key, $value, MEMCACHE_COMPRESSED, $expire);
	}

	/**
	 * Delete
	 *
	 * @param string $key
	 *
	 * @return void
	 */
	public function delete(string $key): void {
		$this->memcache->delete($this->prefix . $key);
	}

	/**
	 * Clear
	 *
	 * Clear all cache
	 *
	 * @return void
	 */
	public function clear(): void {
		$this->memcache->flush();
	}
}
