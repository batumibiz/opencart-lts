<?php

namespace Opencart\Admin\Model\Catalog;

use Opencart\System\Engine\Model;

class Download extends Model {
	/**
	 * @param array<string, mixed> $data array of data
	 */
	public function addDownload(array $data): int {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "download` SET `filename` = '" . $this->db->escape((string)$data['filename']) . "', `mask` = '" . $this->db->escape((string)$data['mask']) . "', `date_added` = NOW()");

		$download_id = $this->db->getLastId();

		foreach ($data['download_description'] as $language_id => $download_description) {
			$this->model_catalog_download->addDescription($download_id, $language_id, $download_description);
		}

		return $download_id;
	}

	/**
	 * @param int                  $download_id
	 * @param array<string, mixed> $data        array of data
	 */
	public function editDownload(int $download_id, array $data): void {
		$this->db->query("UPDATE `" . DB_PREFIX . "download` SET `filename` = '" . $this->db->escape((string)$data['filename']) . "', `mask` = '" . $this->db->escape((string)$data['mask']) . "' WHERE `download_id` = '" . (int)$download_id . "'");

		$this->model_catalog_download->deleteDescriptions($download_id);

		foreach ($data['download_description'] as $language_id => $download_description) {
			$this->model_catalog_download->addDescription($download_id, $language_id, $download_description);
		}
	}

	public function deleteDownload(int $download_id): void {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "download` WHERE `download_id` = '" . (int)$download_id . "'");

		$this->model_catalog_download->deleteDescriptions($download_id);
		$this->model_catalog_download->deleteReports($download_id);

		// Product
		$this->load->model('catalog/product');

		$this->model_catalog_product->deleteDownloadsByDownloadId($download_id);
	}

	/**
	 * @param int $download_id
	 *
	 * @return array<string, mixed> download record that has download ID
	 */
	public function getDownload(int $download_id): array {
		$query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "download` `d` LEFT JOIN `" . DB_PREFIX . "download_description` `dd` ON (`d`.`download_id` = `dd`.`download_id`) WHERE `d`.`download_id` = '" . (int)$download_id . "' AND `dd`.`language_id` = '" . (int)$this->config->get('config_language_id') . "'");

		return $query->row;
	}

	/**
	 * @param array<string, mixed> $data
	 *
	 * @return array<int, array<string, mixed>>
	 */
	public function getDownloads(array $data = []): array {
		$sql = "SELECT * FROM `" . DB_PREFIX . "download` `d` LEFT JOIN `" . DB_PREFIX . "download_description` `dd` ON (`d`.`download_id` = `dd`.`download_id`) WHERE `dd`.`language_id` = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(`dd`.`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_name'])) . "%'";
		}

		if (!empty($data['filter_date_from'])) {
			$sql .= " AND DATE(`d`.`date_added`) >= DATE('" . $this->db->escape((string)$data['filter_date_from']) . "')";
		}

		if (!empty($data['filter_date_to'])) {
			$sql .= " AND DATE(`d`.`date_added`) <= DATE('" . $this->db->escape((string)$data['filter_date_to']) . "')";
		}

		$sort_data = [
			'dd.name',
			'd.date_added'
		];

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY `dd`.`name`";
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
	public function getTotalDownloads(array $data = []): int {
		$sql = "SELECT COUNT(*) AS `total` FROM `" . DB_PREFIX . "download` `d` LEFT JOIN `" . DB_PREFIX . "download_description` `dd` ON (`d`.`download_id` = `dd`.`download_id`) WHERE `dd`.`language_id` = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND LCASE(`dd`.`name`) LIKE '%" . $this->db->escape(oc_strtolower($data['filter_name'])) . "%'";
		}

		if (!empty($data['filter_date_from'])) {
			$sql .= " AND DATE(`d`.`date_added`) >= DATE('" . $this->db->escape((string)$data['filter_date_from']) . "')";
		}

		if (!empty($data['filter_date_to'])) {
			$sql .= " AND DATE(`d`.`date_added`) <= DATE('" . $this->db->escape((string)$data['filter_date_to']) . "')";
		}

		$query = $this->db->query($sql);

		return (int)$query->row['total'];
	}

	/**
	 * @param int                  $download_id
	 * @param int                  $language_id
	 * @param array<string, mixed> $data
	 */
	public function addDescription(int $download_id, int $language_id, array $data): void {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "download_description` SET `download_id` = '" . (int)$download_id . "', `language_id` = '" . (int)$language_id . "', `name` = '" . $this->db->escape($data['name']) . "'");
	}

	public function deleteDescriptions(int $download_id): void {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "download_description` WHERE `download_id` = '" . (int)$download_id . "'");
	}

	public function deleteDescriptionsByLanguageId(int $language_id): void {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "download_description` WHERE `language_id` = '" . (int)$language_id . "'");
	}

	/**
	 * @param int $download_id
	 *
	 * @return array<int, array<string, string>>
	 */
	public function getDescriptions(int $download_id): array {
		$download_description_data = [];

		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "download_description` WHERE `download_id` = '" . (int)$download_id . "'");

		foreach ($query->rows as $result) {
			$download_description_data[$result['language_id']] = $result;
		}

		return $download_description_data;
	}

	/**
	 * @param int $language_id
	 *
	 * @return array<int, array<string, string>>
	 */
	public function getDescriptionsByLanguageId(int $language_id): array {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "download_description` WHERE `language_id` = '" . (int)$language_id . "'");

		return $query->rows;
	}

	/**
	 * @param int $download_id
	 * @param int $start
	 * @param int $limit
	 *
	 * @return array<int, array<string, mixed>>
	 */
	public function getReports(int $download_id, int $start = 0, int $limit = 10): array {
		if ($start < 0) {
			$start = 0;
		}

		if ($limit < 1) {
			$limit = 10;
		}

		$query = $this->db->query("SELECT `ip`, `store_id`, `country`, `date_added` FROM `" . DB_PREFIX . "download_report` WHERE `download_id` = '" . (int)$download_id . "' ORDER BY `date_added` ASC LIMIT " . (int)$start . "," . (int)$limit);

		return $query->rows;
	}

	public function deleteReports(int $download_id): void {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "download_report` WHERE `download_id` = '" . (int)$download_id . "'");
	}

	public function getTotalReports(int $download_id): int {
		$query = $this->db->query("SELECT COUNT(*) AS `total` FROM `" . DB_PREFIX . "download_report` WHERE `download_id` = '" . (int)$download_id . "'");

		return (int)$query->row['total'];
	}
}
