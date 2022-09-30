<?php
// All rights reserved ART&PR studio -> https://store.pe-art.ru
class ModelExtensionModuleArtcmessage extends Model {
    private $pname           = 'artcmessage';
    private $extclass        = 'module';
    private $ext_name        = 'extension_'; // ''
    private $ext_folder      = 'extension/'; // ''
    private $pnameplus       = ''; // 'payment_'
    private $token_name      = 'token'; // user_token
    private $clone_name      = 'clone';
    private $clone_lang1     = 'ru-ru'; //ru-ru, russian, en-gb, english, false
    private $clone_lang2     = false; //ru-ru, russian, en-gb, english, false
	private $key;


    public function getSettings() {
        $setpro = array('license', 'status', 'messenger', 'apikey');
        return $setpro;
    }

    public function getLangSettings() {
        $setpro = array();
        return $setpro;
    }

    public function getErrSettings() {
        $setpro = array('license');
        return $setpro;
    }

    public function getErrLangSettings() {
        $setpro = array();
        return $setpro;
    }

    public function getSettingsExtended() {
        $setpro = array();
        return $setpro;
    }

    public function getPoles() {
        $pt = array();
        $pt['messenger'] = array('whatsapp', 'viber', 'telegram', 'skype');
        return $pt;
    }

    public function getInstalled($type) {
        $extension_data = array();

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "extension` WHERE `type` = '" . $this->db->escape($type) . "' ORDER BY `code`");

        foreach ($query->rows as $result) {
            $extension_data[] = $result['code'];
        }

        return $extension_data;
    }

    public function getEventByCode($code) {
        $query = $this->db->query("SELECT DISTINCT * FROM `" . DB_PREFIX . "event` WHERE `code` = '" . $this->db->escape($code) . "' LIMIT 1");

        return $query->row;
    }

    public function install() {

        $query = $this->db->query("
            CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . $this->pname . "` (
                `field_id` INT(11) NOT NULL AUTO_INCREMENT,
                `name` varchar(64) NOT NULL,
                `description` TEXT NOT NULL,
                `sort_field` INT(15) NOT NULL DEFAULT 0,
                `user_id` INT(15) NOT NULL DEFAULT 0,
                `ostatus` varchar(64) NOT NULL DEFAULT 0,
                PRIMARY KEY `field_id` (`field_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ");

    }

    public function uninstall() {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "artcmessage`;");
    }

	public function getCustomFields($order_info, $varabliesd) {
            $instros = explode('~', $varabliesd);
            $instroz = "";

            foreach ($instros as $instro) {
                $instro_other = ''; 

                if ($instro == 'phone') {
                    $instro_other = preg_replace('/[^0-9]/', '', $order_info['telephone']);
                }

                else if ($instro == 'dateNumOrder') {
                    $instro_other = date($this->language->get('date_format_short'), strtotime($order_info['date_added']));
                }

                else if ($instro == 'totals') {
                    $instro_other = $this->currency->format($order_info['total'], $order_info['currency_code'], $order_info['currency_value'], true);
                }

                else if ($instro == 'products') {

                    $text = '';
                    $order_voucher_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_voucher WHERE order_id = '" . (int)$order_info['order_id'] . "'");
                    $order_product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product WHERE order_id = '" . (int)$order_info['order_id'] . "'");
                    $order_total_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_total` WHERE order_id = '" . (int)$order_info['order_id'] . "' ORDER BY sort_order ASC");

                    foreach ($order_product_query->rows as $product) {
                        $text .= $product['quantity'] . 'x ' . str_replace("'", '', htmlspecialchars_decode($product['name'])) . ' (' . str_replace("'", '', htmlspecialchars_decode($product['model'])) . ') ' . html_entity_decode($this->currency->format($product['total'] + ($this->config->get('config_tax') ? ($product['tax'] * $product['quantity']) : 0), $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . "\n";

                        $order_option_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$order_info['order_id'] . "' AND order_product_id = '" . $product['order_product_id'] . "'");

                        foreach ($order_option_query->rows as $option) {
                            if ($option['type'] != 'file') {
                                $value = $option['value'];
                            } else {
                                $value = utf8_substr($option['value'], 0, utf8_strrpos($option['value'], '.'));
                            }

                            $text .= chr(9) . '-' . str_replace("'", '', htmlspecialchars_decode($option['name'])) . ' ' . (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value) . PHP_EOL;
                        }
                    }


                    foreach ($order_voucher_query->rows as $voucher) {
                        $text .= '1x ' . $voucher['description'] . ' ' . $this->currency->format($voucher['amount'], $order_info['currency_code'], $order_info['currency_value']);
                    }

                    $text .= PHP_EOL;


                    foreach ($order_total_query->rows as $total) {
                        $text .= $total['title'] . ': ' . html_entity_decode($this->currency->format($total['value'], $order_info['currency_code'], $order_info['currency_value']), ENT_NOQUOTES, 'UTF-8') . PHP_EOL;
                    }

                    if ($text){
                        $instro_other = $text;
                    }
                }

                else if ($instro == 'paylink') {
                    if (strpos($order_info['payment_code'], 'sbacuiring') !== false) {
                        $this->load->model('extension/payment/sbacuiring');
                        $instro_other = $this->model_extension_payment_sbacuiring->getCustomFields($order_info, 'href');
                    }

                    else if (strpos($order_info['payment_code'], 'tcsacquiring') !== false) {
                        $this->load->model('extension/payment/tcsacquiring');
                        $instro_other = $this->model_extension_payment_tcsacquiring->getCustomFields($order_info, 'href');
                    }

                    else if (strpos($order_info['payment_code'], 'yandexur') !== false) {
                        $this->load->model('extension/payment/yandexur');
                        $instro_other = $this->model_extension_payment_yandexur->getCustomFields($order_info, 'href');
                    }

                    else if (strpos($order_info['payment_code'], 'liqpayplus') !== false) {
                        $this->load->model('extension/payment/liqpayplus');
                        $instro_other = $this->model_extension_payment_liqpayplus->getCustomFields($order_info, 'href');
                    }

                    else if (strpos($order_info['payment_code'], 'abacquiring') !== false) {
                        $this->load->model('extension/payment/abacquiring');
                        $instro_other = $this->model_extension_payment_abacquiring->getCustomFields($order_info, 'href');
                    }

                    else if (strpos($order_info['payment_code'], 'tcssbp') !== false) {
                        $this->load->model('extension/payment/tcssbp');
                        $instro_other = $this->model_extension_payment_tcssbp->getCustomFields($order_info, 'href');
                    }

                    else if (strpos($order_info['payment_code'], 'paymasterplus') !== false) {
                        $this->load->model('extension/payment/paymasterplus');
                        $instro_other = $this->model_extension_payment_paymasterplus->getCustomFields($order_info, 'href');
                    }

                    else if (strpos($order_info['payment_code'], 'artsbppaym') !== false) {
                        $this->load->model('extension/payment/artsbppaym');
                        $instro_other = $this->model_extension_payment_artsbppaym->getCustomFields($order_info, 'href');
                    }
                }

                else if ($instro == 'novaCNUM') {
                    $query = $this->db->query("SELECT `novaposhta_cn_number` FROM " . DB_PREFIX . "order WHERE order_id = '" . (int) $order_info['order_id'] . "' ");
                    if (isset($query->row) && $query->row)  {
                        $instro_other = $query->row;
                    }
                }

                else if (isset($order_info[$instro])) {
                    $instro_other = $order_info[$instro];
                }

                else if (substr_count($instro, "shipAddrCustom_")) {
                    $instro = ltrim($instro, 'shipAddrCustom_');
                    if (isset($order_info['shipping_custom_field'][$instro])) {
                        $customx = $order_info['shipping_custom_field'][$instro];
                        if ($customx) {
                            $instro_other = $customx;
                        }

                    }
                }
                else if (substr_count($instro, "payAddrCustom_")) {
                    $instro = ltrim($instro, 'payAddrCustom_');
                    if (isset($order_info['payment_custom_field'][$instro])) {
                        $customx = $order_info['payment_custom_field'][$instro];
                        if ($customx) {
                            $instro_other = $customx;
                        }

                    }
                }
                else if (substr_count($instro, "accCustom_")) {
                    $instro = ltrim($instro, 'accCustom_');
                    if (isset($order_info['custom_field'][$instro])) {
                        $customx = $order_info['custom_field'][$instro];
                        if ($customx) {
                            $instro_other = $customx;
                        }

                    }
                }

                else if (substr_count($instro, "paymentsimple4_")) {
                    $this->load->model('module/simplecustom');
                    $customx = $this->model_module_simplecustom->getCustomFields('order', $order_info['order_id']);
                    $pole = ltrim($instro, 'paymentsimple4');
                    $pole = substr($pole, 1);
                    if (array_key_exists($pole, $customx) == true) {
                        $instro_other = $customx[$pole];
                    }
                    if (array_key_exists('payment_' . $pole, $customx) == true) {
                        $instro_other = $customx['payment_' . $pole];
                    }
                }
                else if (substr_count($instro, "shippingsimple4_")) {
                    $this->load->model('module/simplecustom');
                    $customx = $this->model_module_simplecustom->getCustomFields('order', $order_info['order_id']);
                    $pole = ltrim($instro, 'shippingsimple4');
                    $pole = substr($pole, 1);
                    if (array_key_exists($pole, $customx) == true) {
                        $instro_other = $customx[$pole];
                    }
                    if (array_key_exists('shipping_' . $pole, $customx) == true) {
                        $instro_other = $customx['shipping_' . $pole];
                    }
                }
                else if (substr_count($instro, "simple4_")) {
                    $this->load->model('module/simplecustom');
                    $customx = $this->model_module_simplecustom->getCustomFields('order', $order_info['order_id']);
                    $pole = ltrim($instro, 'simple4');
                    $pole = substr($pole, 1);
                    if (array_key_exists($pole, $customx) == true) {
                        $instro_other = $customx[$pole];
                    }
                }

                else {
                    $instro_other = htmlspecialchars_decode($instro);
                }

                $instroz .= $instro_other;
            }
            return $instroz;
    }

    public function getTotalFields() {
        $query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . $this->pname);

        return $query->row['total'];
    }

    public function getFields($data = array()) {

        $sql = "SELECT field_id, name, sort_field FROM " . DB_PREFIX . $this->pname;



        if (!empty($data['filter_name'])) {
            $sql .= " AND name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sort_data = array(
            'name',
            'sort_field'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY name";
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

    public function getFieldDescriptions($field_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->pname . " WHERE field_id = '" . (int)$field_id . "'");

        $field_description_data = array(
            'name'             => $query->row['name'],
            'description'      => $query->row['description'],
            'sort_field'       => $query->row['sort_field'],
        );
        
        return $field_description_data;
    }

    public function addField($data) {

        $data = $data['art_description'];

        $this->db->query("INSERT INTO " . DB_PREFIX . $this->pname . " SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', sort_field = '" . (int)$data['sort_field'] . "'");

    }

    public function editField($field_id, $data) {
        
        $data = $data['art_description'];

        $this->db->query("UPDATE " . DB_PREFIX . $this->pname . " SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', sort_field = '" . (int)$data['sort_field'] . "' WHERE field_id = '" . (int)$field_id . "'");

    }

    public function deleteField($field_id) {
        $this->db->query("DELETE FROM " . DB_PREFIX . $this->pname . " WHERE field_id = '" . (int)$field_id . "'");
    }

    public function getFormNameFields() {

        $query = $this->db->query("SELECT field_id, name FROM " . DB_PREFIX . $this->pname . " ORDER BY sort_field ASC");

        return $query->rows;
    }

    public function getFormDescriptionFields($field_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . $this->pname . " WHERE field_id = '" . (int)$field_id . "'");
        
        return $query->row['description'];
    }

}