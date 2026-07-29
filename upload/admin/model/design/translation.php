<?php
namespace Opencart\Admin\Model\Design;
/**
 * Class Translation
 *
 * Can be loaded using $this->load->model('design/translation');
 *
 * @package Opencart\Admin\Model\Design
 */
class Translation extends \Opencart\System\Engine\Model {
	/**
	 * Add Translation
	 *
	 * Create a new translation record in the database.
	 *
	 * @param array<string, mixed> $data array of data
	 *
	 * @return void
	 *
	 * @example
	 *
	 * $translation_data = [
	 *     'store_id'    => 1,
	 *     'language_id' => 1,
	 *     'route'       => '',
	 *     'key'         => '',
	 *     'value'       => ''
	 * ];
	 *
	 * $this->load->model('design/translation');
	 *
	 * $this->model_design_translation->addTranslation($translation_data);
	 */
	public function addTranslation(array $data): void {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "translation` SET `store_id` = '" . (int)$data['store_id'] . "', `language_id` = '" . (int)$data['language_id'] . "', `route` = '" . $this->db->escape((string)$data['route']) . "', `key` = '" . $this->db->escape((string)$data['key']) . "', `value` = '" . $this->db->escape((string)$data['value']) . "', `date_added` = NOW()");
	}

	/**
	 * Edit Translation
	 *
	 * Edit translation record in the database.
	 *
	 * @param int                  $translation_id primary key of the translation record
	 * @param array<string, mixed> $data           array of data
	 *
	 * @return void
	 *
	 * @example
	 *
	 * $translation_data = [
	 *     'store_id'    => 1,
	 *     'language_id' => 1,
	 *     'route'       => '',
	 *     'key'         => '',
	 *     'value'       => ''
	 * ];
	 *
	 * $this->load->model('design/translation');
	 *
	 * $this->model_design_translation->editTranslation($translation_id, $translation_data);
	 */
	public function editTranslation(int $translation_id, array $data): void {
		$this->db->query("UPDATE `" . DB_PREFIX . "translation` SET `store_id` = '" . (int)$data['store_id'] . "', `language_id` = '" . (int)$data['language_id'] . "', `route` = '" . $this->db->escape((string)$data['route']) . "', `key` = '" . $this->db->escape((string)$data['key']) . "', `value` = '" . $this->db->escape((string)$data['value']) . "' WHERE `translation_id` = '" . (int)$translation_id . "'");
	}

	/**
	 * Delete Translation
	 *
	 * Delete translation record in the database.
	 *
	 * @param int $translation_id primary key of the translation record
	 *
	 * @return void
	 *
	 * @example
	 *
	 * $this->load->model('design/translation');
	 *
	 * $this->model_design_translation->deleteTranslation($translation_id);
	 */
	public function deleteTranslation(int $translation_id): void {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "translation` WHERE `translation_id` = '" . (int)$translation_id . "'");
	}

	/**
	 * Delete Translations By Store ID
	 *
	 * Delete translations by store record in the database.
	 *
	 * @param int $store_id primary key of the store record
	 *
	 * @return void
	 *
	 * @example
	 *
	 * $this->load->model('design/translation');
	 *
	 * $this->model_design_translation->deleteTranslationsByStoreId($store_id);
	 */
	public function deleteTranslationsByStoreId(int $store_id): void {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "translation` WHERE `store_id` = '" . (int)$store_id . "'");
	}

	/**
	 * Delete Translations By Language ID
	 *
	 * Delete translations by language record in the database.
	 *
	 * @param int $language_id primary key of the language record
	 *
	 * @return void
	 *
	 * @example
	 *
	 * $this->load->model('design/translation');
	 *
	 * $this->model_design_translation->deleteTranslationsByLanguageId($language_id);
	 */
	public function deleteTranslationsByLanguageId(int $language_id): void {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "translation` WHERE `language_id` = '" . (int)$language_id . "'");
	}

	/**
	 * Get Translation
	 *
	 * Get the record of the translation record in the database.
	 *
	 * @param int $translation_id primary key of the translation record
	 *
	 * @return array<string, mixed> translation record that has translation ID
	 *
	 * @example
	 *
	 * $this->load->model('design/translation');
	 *
	 * $translation_info = $this->model_design_translation->getTranslation($translation_id);
	 */
	public function getTranslation(int $translation_id): array {
		$query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "translation` WHERE `translation_id` = '" . (int)$translation_id . "'");

		return $query->row;
	}

	/**
	 * Get Translations
	 *
	 * Get the record of the translation records in the database.
	 *
	 * @param array<string, mixed> $data array of filters
	 *
	 * @return array<int, array<string, mixed>> translation records
	 *
	 * @example
	 *
	 * $filter_data = [
	 *     'sort'  => 'store',
	 *     'order' => 'DESC',
	 *     'start' => 0,
	 *     'limit' => 10
	 * ];
	 *
	 * $this->load->model('design/translation');
	 *
	 * $results = $this->model_design_translation->getTranslations($filter_data);
	 */
	public function getTranslations(array $data = []): array {
		$sql = "SELECT *, (SELECT `s`.`name` FROM `" . DB_PREFIX . "store` `s` WHERE `s`.`store_id` = `t`.`store_id`) AS `store`, (SELECT `l`.`name` FROM `" . DB_PREFIX . "language` `l` WHERE `l`.`language_id` = `t`.`language_id`) AS `language` FROM `" . DB_PREFIX . "translation` `t`";

		$implode = [];

		if (!empty($data['filter_route'])) {
			$implode[] = "LCASE(`route`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_route'])) . "%'";
		}

		if (!empty($data['filter_key'])) {
			$implode[] = "LCASE(`key`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_key'])) . "%'";
		}

		if (!empty($data['filter_value'])) {
			$implode[] = "LCASE(`value`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_value'])) . "%'";
		}

		if (isset($data['filter_store_id']) && $data['filter_store_id'] !== '') {
			$implode[] = "`store_id` = '" . (int)$data['filter_store_id'] . "'";
		}

		if (!empty($data['filter_language_id']) && $data['filter_language_id'] !== '') {
			$implode[] = "`language_id` = '" . (int)$data['filter_language_id'] . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$sort_data = [
			'store',
			'language',
			'route',
			'key',
			'value'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY `" . $data['sort'] . '`';
		} else {
			$sql .= " ORDER BY `store`";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getTotalTranslations(array $data = []): int {
		$sql = "SELECT COUNT(*) AS `total` FROM `" . DB_PREFIX . "translation`";

		$implode = [];

		if (!empty($data['filter_route'])) {
			$implode[] = "LCASE(`route`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_route'])) . "%'";
		}

		if (!empty($data['filter_key'])) {
			$implode[] = "LCASE(`key`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_key'])) . "%'";
		}

		if (!empty($data['filter_value'])) {
			$implode[] = "LCASE(`value`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_value'])) . "%'";
		}

		if (isset($data['filter_store_id']) && $data['filter_store_id'] !== '') {
			$implode[] = "`store_id` = '" . (int)$data['filter_store_id'] . "'";
		}

		if (!empty($data['filter_language_id']) && $data['filter_language_id'] !== '') {
			$implode[] = "`language_id` = '" . (int)$data['filter_language_id'] . "'";
		}

		if ($implode) {
			$sql .= " WHERE " . implode(" AND ", $implode);
		}

		$query = $this->db->query($sql);

		return (int)$query->row['total'];
	}

	public function getTranslationByRouteKey(string $route, string $key, int $store_id = 0, int $language_id = 0): array {
		$sql = "SELECT * FROM `" . DB_PREFIX . "translation` WHERE `route` = '" . $this->db->escape($route) . "' AND `key` = '" . $this->db->escape($key) . "'";

		if ($store_id) {
			$sql .= " AND `store_id` = '" . $store_id . "'";
		}

		if ($language_id) {
			$sql .= " AND `language_id` = '" . $language_id . "'";
		}

		$query = $this->db->query($sql);

		return $query->row;
	}

	public function autocomplete(array $data = []): array {
		$sql = "SELECT *, LEFT(`value`, 30) AS `value` FROM `" . DB_PREFIX . "translation`";

		if (isset($data['filter_route'])) {
			if (!empty($data['filter_route'])) {
				$sql .= " WHERE LCASE(`route`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_route'])) . "%'";
			}

			$sql .= " GROUP BY `route` ORDER BY `route`";
		} elseif (isset($data['filter_key'])) {
			if (!empty($data['filter_key'])) {
				$sql .= " WHERE LCASE(`key`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_key'])) . "%'";
			}

			$sql .= " GROUP BY `key` ORDER BY `key`";
		} elseif (isset($data['filter_value'])) {
			if (!empty($data['filter_value'])) {
				$sql .= " WHERE LCASE(`value`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_value'])) . "%'";
			}

			$sql .= " GROUP BY `value` ORDER BY `value`";
		}

		$sql .= " LIMIT " . (int)$data['limit'];
		$query = $this->db->query($sql);

		return $query->rows;
	}
}
