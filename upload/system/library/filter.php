<?php

namespace Opencart\System\Library;

class Filter {
	private Request $request;

	/**
	 * @var array<string, bool>
	 */
	private array $filterKeys;

	/**
	 * @param Request             $request
	 * @param array<string, bool> $filterKeys
	 */
	public function __construct(Request $request, array $filterKeys = []) {
		$this->request = $request;
		$this->filterKeys = $filterKeys;
	}

	/**
	 * @return array<string, string>
	 */
	public function getFilterData(): array {
		$filterData = [];

		foreach ($this->filterKeys as $key => $encode) {
			$filterData[$key] = $this->request->get[$key] ?? '';
		}

		return $filterData;
	}

	public function getQueryString(
		bool $sort = false,
		bool $order = false,
		bool $page = false,
		bool $master_id = false
	): string {
		$url = '';

		foreach ($this->filterKeys as $key => $encode) {
			if (isset($this->request->get[$key])) {
				$url .= '&' . $key . '=' . (
					$encode
						? urlencode(html_entity_decode($this->request->get[$key], ENT_QUOTES, 'UTF-8'))
						: $this->request->get[$key]
				);
			}
		}

		if ($sort && isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if ($order && isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if ($page && isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if ($master_id && isset($this->request->get['master_id'])) {
			$url .= '&master_id=' . $this->request->get['master_id'];
		}

		return $url;
	}
}
