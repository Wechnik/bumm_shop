<?php
class ModelExtensionModuleCurrencyPlus extends Model {
    public function addCurrency($data) {
        $this->create_fields();

        $this->db->query("INSERT INTO " . DB_PREFIX . "currency
        SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', realcode = '" . $this->db->escape($data['realcode']) . "',
        symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "',
        decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "',
        nominal = '" . $this->db->escape($data['nominal']) . "', correction_prefix = '" . $this->db->escape($data['correction_prefix']) . "',
        correction = '" . $this->db->escape($data['correction']) . "', value_official = '" . $this->db->escape($data['value_official']) . "',
        auto_update_course = '" . $this->db->escape($data['auto_update_course']) . "', status = '" . (int)$data['status'] . "', date_modified = NOW()");

        $this->cache->delete('currency');
    }


    public function editCurrency($currency_id, $data) {
        $this->create_fields();

        $this->db->query("UPDATE " . DB_PREFIX . "currency
        SET title = '" . $this->db->escape($data['title']) . "', code = '" . $this->db->escape($data['code']) . "', realcode = '" . $this->db->escape($data['realcode']) . "',
        symbol_left = '" . $this->db->escape($data['symbol_left']) . "', symbol_right = '" . $this->db->escape($data['symbol_right']) . "',
        decimal_place = '" . $this->db->escape($data['decimal_place']) . "', value = '" . $this->db->escape($data['value']) . "',
        nominal = '" . $this->db->escape($data['nominal']) . "', correction_prefix = '" . $this->db->escape($data['correction_prefix']) . "',
        correction = '" . $this->db->escape($data['correction']) . "', value_official = '" . $this->db->escape($data['value_official']) . "',
        auto_update_course = '" . $this->db->escape($data['auto_update_course']) . "', status = '" . (int)$data['status'] . "',
        date_modified = NOW() WHERE currency_id = '" . (int)$currency_id . "'");

        $this->cache->delete('currency');
    }


    public function deleteCurrency($currency_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");

        $this->cache->delete('currency');
    }


    public function getCurrency($currency_id) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "currency WHERE currency_id = '" . (int)$currency_id . "'");

        return $query->row;
    }


    public function getCurrencyByCode($currency) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "currency WHERE code = '" . $this->db->escape($currency) . "'");

        return $query->row;
    }


    public function getCurrencyByRealCode($currency) {
        $query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "currency WHERE realcode = '" . $this->db->escape($currency) . "'");

        return $query->row;
    }


    public function getTotalProductByCurrencyCode($currency) {
        $query = $this->db->query("SELECT COUNT(product_id) as total FROM " . DB_PREFIX . "product
        WHERE base_currency_code = '" . $this->db->escape($currency) . "' ");

        return $query->row['total'];
    }

    public function getCurrencies($data = array()) {
        if ($data) {
            $sql = "SELECT * FROM " . DB_PREFIX . "currency";

            $sort_data = array(
                'title',
                'code',
                'realcode',
                'value',
                'date_modified'
            );

            if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
                $sql .= " ORDER BY " . $data['sort'];
            } else {
                $sql .= " ORDER BY title";
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
        else {
            $currency_data = $this->cache->get('currency');

            if (!$currency_data) {
                $currency_data = array();

                $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "currency ORDER BY title ASC");

                foreach ($query->rows as $result) {
                    $currency_data[$result['code']] = array(
                        'currency_id'   => $result['currency_id'],
                        'title'         => $result['title'],
                        'code'          => $result['code'],
                        'realcode'      => $result['realcode'],
                        'symbol_left'   => $result['symbol_left'],
                        'symbol_right'  => $result['symbol_right'],
                        'decimal_place' => $result['decimal_place'],
                        'value'         => $result['value'],
                        'value_official' => $result['value_official'],
                        'status'        => $result['status'],
                        'date_modified' => $result['date_modified']
                    );
                }

                $this->cache->set('currency', $currency_data);
            }

            return $currency_data;
        }
    }


    public function getTotalCurrencies() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "currency");

        return $query->row['total'];
    }


    public function create_fields() {

        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product WHERE field = 'base_price'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD COLUMN `base_price` decimal(15,4) NOT NULL;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "currency WHERE field = 'value_official'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "currency` ADD COLUMN `value_official` float(15,8) NULL;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "currency WHERE field = 'nominal'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "currency` ADD COLUMN `nominal` smallint NULL;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product WHERE field = 'base_currency_code'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD COLUMN `base_currency_code` varchar(3) NOT NULL DEFAULT '".$this->config->get('config_currency')."' AFTER `base_price`;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_option_value WHERE field = 'base_price'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD COLUMN `base_price` decimal(15,4) NOT NULL AFTER `price`;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_discount WHERE field = 'base_price'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_discount` ADD COLUMN `base_price` decimal(15,4) NOT NULL AFTER `price`;");
        }

        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_special WHERE field = 'base_price'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_special` ADD COLUMN `base_price` decimal(15,4) NOT NULL AFTER `price`;");
        }

        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product WHERE field = 'extra_charge'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD COLUMN `extra_charge` decimal(15,4) NOT NULL DEFAULT 0 AFTER `price`;");
        }
        else {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` MODIFY COLUMN `extra_charge` decimal(15,4) NOT NULL DEFAULT 0 AFTER `price`;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product WHERE field = 'cost'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product` ADD `cost` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price`;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "product_option_value WHERE field = 'cost'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "product_option_value` ADD `cost` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price`;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "order_product WHERE field = 'cost'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "order_product` ADD `cost` decimal(15,4) NOT NULL DEFAULT '0.0000' AFTER `price`;");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "order_option WHERE field = 'cost'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "order_option` ADD `cost` decimal(15,4) NOT NULL DEFAULT '0.0000';");
        }

        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "currency WHERE field = 'correction_prefix'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "currency` ADD `correction_prefix` varchar(1) NOT NULL DEFAULT '+';");
        }


        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "currency WHERE field = 'correction'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "currency` ADD `correction` float(15,8) NOT NULL DEFAULT '0.0000';");
        }

        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "currency WHERE field = 'realcode'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "currency` ADD `realcode` varchar(3) NOT NULL DEFAULT 'USD';");
        }

        $query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "currency WHERE field = 'auto_update_course'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "currency` ADD `auto_update_course` int(1) NOT NULL DEFAULT 1;");
        }

        $query = $this->db->query("SHOW INDEX FROM " . DB_PREFIX . "currency WHERE Key_name='code' and Column_name='code'");
        if (count($query->rows) == 0) {
            $this->db->query("ALTER TABLE `" . DB_PREFIX . "currency` ADD UNIQUE INDEX `code` (`code`) ;");
        }
    }


    public function isFrontEnd() {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "modification WHERE `code` = 'LouiseCurrencyPlusFrontEnd' AND `status` = 1 ");
        if (count($query->rows) > 0) {
            return true;
        }
        else {
            return false;
        }
    }

}
?>