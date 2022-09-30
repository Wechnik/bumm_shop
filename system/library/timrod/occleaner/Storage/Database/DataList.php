<?php

namespace Timrod\Occleaner\Storage\Database;

use Timrod\Occleaner\Engine\Library;

class DataList extends Library
{
    const DB_TABLE_DATA_LIST = 'timrod_occleaner_data_list';

    public function __construct($registry)
    {
        parent::__construct($registry);
        $this->resetAutoIncrement();
    }

    public function add($code, $value)
    {
        $this->db->query(
            "INSERT IGNORE INTO " . DB_PREFIX . self::DB_TABLE_DATA_LIST . " SET " .
            "`code` = '" . $this->db->escape($code) . "'," .
            "`value` = '" . $this->db->escape($value) . "'"
        );

        return $this->db->getLastId();
    }

    public function search($code, $needle)
    {
        $query = $this->db->query(
            "SELECT `id` FROM " . DB_PREFIX . self::DB_TABLE_DATA_LIST .
            " WHERE `code` = '" . $this->db->escape($code) . "'" .
            " AND `value` LIKE '" . $this->db->escape($needle) . "%'"
        );

        return $query->rows;
    }

    public function delete($id)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . self::DB_TABLE_DATA_LIST . " WHERE `id` = '" . (int)$id . "'");
    }

    public function deleteList($code)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . self::DB_TABLE_DATA_LIST . " WHERE `code` = '" . $this->db->escape($code) . "'");
    }

    public function clear()
    {
        $this->db->query("TRUNCATE TABLE " . DB_PREFIX . self::DB_TABLE_DATA_LIST);
    }

    public function getList($code, $filter)
    {
        $sql =
            "SELECT * FROM " . DB_PREFIX . self::DB_TABLE_DATA_LIST .
            " WHERE `code` = '" . $this->db->escape($code) . "'" .
            " ORDER BY `id` ASC";

        if ($filter['start'] < 0) {
            $filter['start'] = 0;
        }

        if ($filter['limit'] < 1) {
            $filter['limit'] = 20;
        }

        $sql .= " LIMIT " . (int)$filter['start'] . "," . (int)$filter['limit'];

        $query = $this->db->query($sql);

        return $query->rows;
    }

    private function resetAutoIncrement()
    {
        $query = $this->db->query("SELECT 1 FROM " . DB_PREFIX . self::DB_TABLE_DATA_LIST . " LIMIT 1");

        if ($query->num_rows === 0) {
            $this->clear();
        }
    }
}
