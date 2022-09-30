<?php

namespace Timrod\Occleaner\Storage\Database;

use Timrod\Occleaner\Engine\Library;

class Data extends Library
{
    const DB_TABLE_DATA = 'timrod_occleaner_data';

    public function __construct($registry)
    {
        parent::__construct($registry);
    }

    public function get($code, $key) {
        $result = null;

        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . self::DB_TABLE_DATA . " WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "'");

        if (isset($query->row['value'])) {
            $result = $query->row['serialized'] ? json_decode($query->row['value'], true) : $query->row['value'];
        }

        return $result;
    }

    public function getByCode($code) {
        $data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . self::DB_TABLE_DATA . " WHERE `code` = '" . $this->db->escape($code) . "'");

        foreach ($query->rows as $result) {
            if (!$result['serialized']) {
                $data[$result['key']] = $result['value'];
            } else {
                $data[$result['key']] = json_decode($result['value'], true);
            }
        }

        return $data;
    }

    public function set($code, $key, $value) {
        $this->delete($code, $key);

        if (!is_array($value)) {
            $this->db->query("INSERT INTO " . DB_PREFIX . self::DB_TABLE_DATA . " SET `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape($value) . "'");
        } else {
            $this->db->query("INSERT INTO " . DB_PREFIX . self::DB_TABLE_DATA . " SET `code` = '" . $this->db->escape($code) . "', `key` = '" . $this->db->escape($key) . "', `value` = '" . $this->db->escape(json_encode($value, true)) . "', `serialized` = '1'");
        }
    }

    public function delete($code, $key)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . self::DB_TABLE_DATA . " WHERE `code` = '" . $this->db->escape($code) . "' AND `key` = '" . $this->db->escape($key) . "'");
    }

    public function deleteByCode($code)
    {
        $this->db->query("DELETE FROM " . DB_PREFIX . self::DB_TABLE_DATA . " WHERE `code` = '" . $this->db->escape($code) . "' ");
    }
}
