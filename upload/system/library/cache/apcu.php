<?php
namespace Opencart\System\Library\Cache;
/**
 * Class APCU
 *
 * @package Opencart\System\Library\Cache
 */
class Apcu {
	private int $expire;

	private bool $active;

	private string $prefix;

	public function __construct(int $expire = 3600) {
		defined('CACHE_PREFIX') || define('CACHE_PREFIX', 'oc_');

		$this->prefix = CACHE_PREFIX;
		$this->expire = $expire;
		$this->active = function_exists('apcu_cache_info') && ini_get('apc.enabled');
	}

	/**
	 * Get
	 *
	 * @param string $key
	 *
	 * @return mixed
	 */
	public function get(string $key) {
		return $this->active ? apcu_fetch($this->prefix . $key) : [];
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

		if ($this->active) {
			apcu_store($this->prefix . $key, $value, $expire);
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
		if ($this->active) {
			$cache_info = apcu_cache_info();

			$cache_list = $cache_info['cache_list'];

			foreach ($cache_list as $entry) {
				if (str_starts_with($entry['info'], $this->prefix . $key)) {
					apcu_delete($entry['info']);
				}
			}
		}
	}

	/**
	 * Clear all cache
	 *
	 * @return void
	 */
	public function clear(): void {
		if (function_exists('apcu_clear_cache')) {
			apcu_clear_cache();
		}
	}
}
