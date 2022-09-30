<?php

namespace Timrod\Occleaner\Storage\Database;

use Timrod\Occleaner\Engine\Library;

class TaskDatabaseLive extends Library
{
    protected $taskName;
    protected $filterParams;

    public function __construct($taskName, $registry)
    {
        parent::__construct($registry);

        $this->filterParams = array(
            'start' => 0,
            'limit' => 20,
        );

        $this->taskName = $taskName;
    }

    public function filter($data)
    {
        foreach ($data as $key => $value) {
            if (isset($this->filterParams[$key])) {
                $this->filterParams[$key] = $value;
            }
        }

        return $this;
    }

	public function getList()
	{
	    $sql = '';
        $list = array();
        $count_items = 0;

	    switch ($this->taskName) {
            case 'expired_sessions':
                //$check = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "` WHERE Tables_in_" . DB_DATABASE . " LIKE '" . DB_PREFIX . "session'");
                $check = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "` LIKE '" . DB_PREFIX . "session'");
                if ($check->num_rows == 1) {
                    $sql = "SELECT * FROM " . DB_PREFIX . 'session' . " WHERE `expire` < DATE_SUB(NOW(), INTERVAL 1 DAY)";
                }
                break;
        }

        if ($sql) {

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
            foreach ($query->rows as $result) {
                $list[] = array(
                    'expire' => isset($result['expire']) ? $result['expire'] : '',
                    'item_id' => isset($result['session_id']) ? $result['session_id'] : '',
                );
                $count_items ++;
            }
        }



		return array(
			'list' => $list,
            'count_items' => $count_items,
		);
	}

	public function getTotal()
	{
        $sql = '';
        $count = 0;

        switch ($this->taskName) {
            case 'expired_sessions':
                //$check = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "` WHERE Tables_in_" . DB_DATABASE . " LIKE '" . DB_PREFIX . "session'");
                $check = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "` LIKE '" . DB_PREFIX . "session'");
                if ($check->num_rows == 1) {
                    $sql = "SELECT COUNT(*) AS count FROM " . DB_PREFIX . 'session' . " WHERE `expire` < DATE_SUB(NOW(), INTERVAL 1 DAY)";
                }
                break;
        }

        if ($sql) {
            $query = $this->db->query($sql);
            $count = $query->row['count'];
        }

		return array('count' => $count);
	}

    public function getLastScan()
    {
        return '';
    }
}
