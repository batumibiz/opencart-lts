<?php

namespace Opencart\Admin\Model\Catalog;

use Opencart\System\Engine\Model;

class Attribute extends Model {
	/**
	 * @param array<string, mixed> $data
	 */
	public function addAttribute(array $data): int {
		$this->db->query("
			INSERT INTO `" . DB_PREFIX . "attribute`
			SET
				`attribute_group_id` = '" . (int)$data['attribute_group_id'] . "',
				`sort_order` = " . (int)$data['sort_order']);

		$attribute_id = $this->db->getLastId();

		foreach ($data['attribute_description'] as $language_id => $attribute_description) {
			$this->model_catalog_attribute->addDescription($attribute_id, $language_id, $attribute_description);
		}

		return $attribute_id;
	}

	/**
	 * @param int                  $attribute_id
	 * @param array<string, mixed> $data
	 */
	public function editAttribute(int $attribute_id, array $data): void {
		$this->db->query("
			UPDATE `" . DB_PREFIX . "attribute`
			SET
				`attribute_group_id` = " . (int)$data['attribute_group_id'] . ",
				`sort_order` = " . (int)$data['sort_order'] . "
			WHERE `attribute_id` = " . $attribute_id);

		$this->model_catalog_attribute->deleteDescriptions($attribute_id);

		foreach ($data['attribute_description'] as $language_id => $attribute_description) {
			$this->model_catalog_attribute->addDescription($attribute_id, $language_id, $attribute_description);
		}
	}

	public function deleteAttribute(int $attribute_id): void {
		$this->db->query("
			DELETE FROM `" . DB_PREFIX . "attribute`
			WHERE `attribute_id` = " . $attribute_id);

		$this->model_catalog_attribute->deleteDescriptions($attribute_id);
	}

	/**
	 * @param int $attribute_id
	 *
	 * @return array<string, mixed>
	 */
	public function getAttribute(int $attribute_id): array {
		$query = $this->db->query("
			SELECT *
			FROM `" . DB_PREFIX . "attribute` `a`
			LEFT JOIN `" . DB_PREFIX . "attribute_description` `ad` ON (`a`.`attribute_id` = `ad`.`attribute_id`)
			WHERE `a`.`attribute_id` = " . $attribute_id . "
				AND `ad`.`language_id` = " . (int)$this->config->get('config_language_id'));

		return $query->row;
	}

	/**
	 * @param array<string, mixed> $data
	 *
	 * @return array<int, array<string, mixed>>
	 */
	public function getAttributes(array $data = []): array {
		$sql = "
			SELECT `a`.*, `d`.`name`, `g`.`name` AS `attribute_group`
			FROM `" . DB_PREFIX . "attribute` `a`
			INNER JOIN `" . DB_PREFIX . "attribute_description` `d` ON (`a`.`attribute_id` = `d`.`attribute_id`)
			INNER JOIN `" . DB_PREFIX . "attribute_group_description` `g` ON (`a`.`attribute_group_id` = `g`.`attribute_group_id`)
			WHERE `d`.`language_id` = " . (int)$this->config->get('config_language_id') . "
				AND `g`.`language_id` = " . (int)$this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(`d`.`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_name'])) . "%'";
		}

		if (!empty($data['filter_group'])) {
			$sql .= " AND LCASE(`g`.`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_group'])) . "%'";
		}

		$sort_data = [
			'd.name',
			'attribute_group',
			'a.sort_order'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY `d`.`name`, `g`.`name`";
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

	/**
	 * @param array<string, mixed> $data
	 */
	public function getTotalAttributes(array $data = []): int {
		$sql = "
			SELECT COUNT(*) AS `total`
			FROM `" . DB_PREFIX . "attribute` `a`
			INNER JOIN `" . DB_PREFIX . "attribute_description` `d` ON (`a`.`attribute_id` = `d`.`attribute_id`)
			INNER JOIN `" . DB_PREFIX . "attribute_group_description` `g` ON (`a`.`attribute_group_id` = `g`.`attribute_group_id`)
			WHERE `d`.`language_id` = " . (int)$this->config->get('config_language_id') . "
				AND `g`.`language_id` = " . (int)$this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(`d`.`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_name'])) . "%'";
		}

		if (!empty($data['filter_group'])) {
			$sql .= " AND LCASE(`g`.`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_group'])) . "%'";
		}

		$query = $this->db->query($sql);

		return (int)$query->row['total'];
	}

	public function getTotalAttributesByAttributeGroupId(int $attribute_group_id): int {
		$query = $this->db->query("
			SELECT COUNT(*) AS `total`
			FROM `" . DB_PREFIX . "attribute`
			WHERE `attribute_group_id` = " . $attribute_group_id);

		return (int)$query->row['total'];
	}

	/**
	 * @param int                  $attribute_id
	 * @param int                  $language_id
	 * @param array<string, mixed> $data
	 */
	public function addDescription(int $attribute_id, int $language_id, array $data): void {
		$this->db->query("
			INSERT INTO `" . DB_PREFIX . "attribute_description`
			SET
				`attribute_id` = " . $attribute_id . ",
				`language_id` = " . $language_id . ",
				`name` = '" . $this->db->escape($data['name']) . "'");
	}

	public function deleteDescriptions(int $attribute_id): void {
		$this->db->query("
			DELETE FROM `" . DB_PREFIX . "attribute_description`
			WHERE `attribute_id` = " . $attribute_id);
	}

	public function deleteDescriptionsByLanguageId(int $language_id): void {
		$this->db->query("
			DELETE FROM `" . DB_PREFIX . "attribute_description`
			WHERE `language_id` = " . $language_id);
	}

	/**
	 * @param int $attribute_id
	 * @param int $language_id
	 *
	 * @return array<string, mixed>
	 */
	public function getDescription(int $attribute_id, int $language_id): array {
		$query = $this->db->query("
			SELECT *
			FROM `" . DB_PREFIX . "attribute_description`
			WHERE `attribute_id` = " . $attribute_id . "
				AND `language_id` = " . $language_id);

		return $query->row;
	}

	/**
	 * @param int $attribute_id
	 *
	 * @return array<int, array<string, string>>
	 */
	public function getDescriptions(int $attribute_id): array {
		$attribute_data = [];

		$query = $this->db->query("
			SELECT *
			FROM `" . DB_PREFIX . "attribute_description`
			WHERE `attribute_id` = " . $attribute_id);

		foreach ($query->rows as $result) {
			$attribute_data[$result['language_id']] = $result;
		}

		return $attribute_data;
	}

	/**
	 * @param int $language_id
	 *
	 * @return array<int, array<string, string>>
	 */
	public function getDescriptionsByLanguageId(int $language_id): array {
		$query = $this->db->query("
			SELECT *
			FROM `" . DB_PREFIX . "attribute_description`
			WHERE `language_id` = " . $language_id);

		return $query->rows;
	}

	/**
	 * @param array<string, mixed> $data
	 *
	 * @return array<int, array<string, mixed>>
	 */
	public function autocompleteName(array $data = []): array {
		$sql = "
			SELECT *
			FROM `" . DB_PREFIX . "attribute_description`
			WHERE `language_id` = " . (int)$this->config->get('config_language_id');

		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_name'])) . "%'";
		}

		$sql .= " ORDER BY `name` LIMIT 0," . (int)$this->config->get('config_autocomplete_limit');

		$query = $this->db->query($sql);

		return $query->rows;
	}

	/**
	 * @param array<string, mixed> $data
	 *
	 * @return array<int, array<string, mixed>>
	 */
	public function autocompleteGroup(array $data = []): array {
		$sql = "
			SELECT *, `name` AS `attribute_group`
			FROM `" . DB_PREFIX . "attribute_group_description`
			WHERE `language_id` = " . (int)$this->config->get('config_language_id');

		if (!empty($data['filter_attribute_group'])) {
			$sql .= " AND LCASE(`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_attribute_group'])) . "%'";
		}

		$sql .= " ORDER BY `name` LIMIT 0," . (int)$this->config->get('config_autocomplete_limit');

		$query = $this->db->query($sql);

		return $query->rows;
	}
}
