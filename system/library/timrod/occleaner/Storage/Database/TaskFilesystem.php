<?php

namespace Timrod\Occleaner\Storage\Database;

use Timrod\Occleaner\Utils;

class TaskFilesystem extends Task
{
    protected $DB_TABLE_TASK_STORAGE = 'timrod_occleaner_filesystem';

	public function add($data)
	{
		$this->db->query(
			"INSERT IGNORE INTO " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " SET " .
				"filename = '" . $this->db->escape($data['filename']) . "'," .
				"path = '" . $this->db->escape($data['path']) . "'," .
				"size = '" . (int)$data['size'] . "'," .
				"task = '" . $this->db->escape($this->taskName) . "'," .
				"ignored = '0'"
		);

		return $this->db->getLastId();
	}

	public function getList()
	{
		$sql = "SELECT * FROM " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " WHERE task = '" . $this->db->escape($this->taskName) . "'";

		// Ignored
		if ($this->filterParams['list_type'] === 'ignore') {
			$sql .= " AND ignored = '1'";
		} else {
			$sql .= " AND ignored = '0'";
		}

		// Search
		if ($this->filterParams['search']) {
			$sql .= " AND path LIKE '%" . $this->db->escape($this->filterParams['search']) . "%'";
		}

		// Sort column
		$sort_data = array(
			'id',
			'filename',
			'size',
		);

		if (in_array($this->filterParams['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $this->filterParams['sort'];
		} else {
			$sql .= " ORDER BY id";
		}

		// Direction
		if ($this->filterParams['order'] == 'DESC') {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		// Limit
		if ($this->filterParams['start'] < 0) {
			$this->filterParams['start'] = 0;
		}

		if ($this->filterParams['limit'] < 1) {
			$this->filterParams['limit'] = 20;
		}

		$sql .= " LIMIT " . (int)$this->filterParams['start'] . "," . (int)$this->filterParams['limit'];

		$query = $this->db->query($sql);

		// Prepare
		$pageSize = 0;
		$countFiles = 0;
		$list = array();

		foreach ($query->rows as $id => $file) {

		    $image = str_replace(realpath(DIR_IMAGE), '', $file['path']);

            if ($this->request->server['HTTPS']) {
                $image = HTTPS_CATALOG . 'image' . $image;
            } else {
                $image = HTTP_CATALOG . 'image' . $image;
            }

			$list[] = array(
				'filename' => $file['filename'],
				'path' => $file['path'],
				'size' => Utils::formatToSize($file['size']),
				'id' => $file['id'],
                'image' => $image,
			);

			$pageSize += $file['size'];
			$countFiles++;
		}

		return array(
			'list' => $list,
			'page_size' => Utils::formatToSize($pageSize),
			'count_items' => $countFiles,
		);
	}

	public function getTotal()
	{
		$sql = "SELECT COUNT(*) AS count, SUM(`size`) AS size FROM " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " WHERE task = '" . $this->db->escape($this->taskName) . "'";

		if ($this->filterParams['list_type'] === 'ignore') {
			$sql .= " AND ignored = '1'";
		} else {
			$sql .= " AND ignored = '0'";
		}

        // Search
        if ($this->filterParams['search']) {
            $sql .= " AND path LIKE '%" . $this->db->escape($this->filterParams['search']) . "%'";
        }

		$query = $this->db->query($sql);

		return array(
			'count' => $query->row['count'],
			'size' => Utils::formatToSize($query->row['size']),
		);
	}
}
