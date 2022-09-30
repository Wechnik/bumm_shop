<?php

namespace Timrod\Occleaner\Storage\Database;

use Timrod\Occleaner\Engine\Library;

abstract class Task extends Library
{
	protected $taskName;
	protected $filterParams;
	protected $DB_TABLE_TASK_STORAGE = '';

	/**
	 * 
	 */
	public function __construct($taskName, $registry)
	{
		parent::__construct($registry);

        $this->taskName = $taskName;
        $this->storage = new Data($registry);

		$this->filterParams = array(
			'search' => '',
			'list_type' => 'default',
			'sort' => 'id',
			'order' => 'ASC',
			'start' => 0,
			'limit' => 20,
		);

		$this->resetAutoIncrement();
	}

	/**
	 * 
	 */
	public function filter($data)
	{
		foreach ($data as $key => $value) {
			if (isset($this->filterParams[$key])) {
				$this->filterParams[$key] = $value;
			}
		}

		return $this;
	}

	/**
	 * 
	 */
	abstract public function add($data);

	/**
	 * 
	 */
	public function delete($id)
	{
		$this->db->query("DELETE FROM " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " WHERE id = '" . (int)$id . "'");
	}

	/**
	 * 
	 */
	public function clear()
	{
		$this->db->query("DELETE FROM " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " WHERE task = '" . $this->db->escape($this->taskName) . "' AND ignored = '0'");
	}

	/**
	 * 
	 */
	public function ignore($id)
	{
		$this->db->query("UPDATE " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " SET ignored = '1' WHERE id = '" . (int)$id . "'");
	}

	/**
	 * 
	 */
	public function notIgnore($id)
	{
		$this->db->query("UPDATE " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " SET ignored = '0' WHERE id = '" . (int)$id . "'");
	}

	/**
	 * 
	 */
	public function get($id)
	{
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " WHERE id = '" . (int)$id . "'");
		return $query->row;
	}

	/**
	 * 
	 */
	abstract public function getList();

	/**
	 * 
	 */
	abstract public function getTotal();

	/**
	 * 
	 */
	public function getLastScan()
	{
        $result = $this->storage->get($this->taskName . '_info', 'last_scan');
        return $result ?: '';
	}

	/**
	 * 
	 */
	public function updateLastScan()
	{
        $date = new \DateTime();
        $date->setTimestamp(time());

        $this->storage->set($this->taskName . '_info', 'last_scan', $date->format('Y-m-d H:i:s'));
	}

    private function resetAutoIncrement()
    {
        $query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE . " LIMIT 1");

        if ($query->num_rows === 0) {
            $this->db->query("TRUNCATE TABLE " . DB_PREFIX . $this->DB_TABLE_TASK_STORAGE);
        }
    }
}
