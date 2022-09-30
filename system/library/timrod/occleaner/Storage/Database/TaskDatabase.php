<?php

namespace Timrod\Occleaner\Storage\Database;


class TaskDatabase extends Task
{
    protected $DB_TABLE_TASK_STORAGE = 'timrod_occleaner_database';

	public function add($data)
	{
		$this->db->query(
			"INSERT IGNORE INTO " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " SET " .
				"name = '" . $this->db->escape($data['name']) . "'," .
				"item_id = '" . (int)$data['item_id'] . "'," .
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
			'item_id',
			'name',
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
		$countFiles = 0;
		$list = array();

		foreach ($query->rows as $id => $item) {

			$list[] = array(
				'name' => $item['name'],
				'item_id' => $item['item_id'],
				'id' => $item['id'],
			);

			$countFiles++;
		}

		return array(
			'list' => $list,
			'page_size' => 0,
			'count_items' => $countFiles,
		);
	}

	public function getTotal()
	{
		$sql = "SELECT COUNT(*) AS count FROM " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " WHERE task = '" . $this->db->escape($this->taskName) . "'";

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

		return array('count' => $query->row['count']);
	}
}
