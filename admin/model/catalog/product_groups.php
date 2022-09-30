<?php
class ModelCatalogCustomTabs extends Model {


	public function getProducts($data = []) {

        $query = $this->db->query("SELECT product_id, `name`  FROM " . DB_PREFIX . "product_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");

        return $query->rows;

	}

	public function getTabProductsByCategory($category_id = 0) {

	    if($category_id == 0) {
            $query = $this->db->query("SELECT product_id, `name`  FROM " . DB_PREFIX . "product_description WHERE language_id = '" . (int)$this->config->get('config_language_id') . "'");
        } else {
            $query = $this->db->query("SELECT pd.product_id, `name`  FROM " . DB_PREFIX . "product_description pd LEFT JOIN " . DB_PREFIX . "product_to_category ptc ON (pd.product_id = ptc.product_id) WHERE ptc.category_id = '" . (int)$category_id . "' aND language_id = '" . (int)$this->config->get('config_language_id') . "'");
        }

        return $query->rows;

	}


	public function editCustomTabs($data = []) {


	    $all_prod_descr = [];

        $this->db->query("DELETE FROM " . DB_PREFIX . "custom_product_tab");
        $this->db->query("DELETE FROM " . DB_PREFIX . "custom_product_tab_description");

        if (isset($data['product_product_description'])) {

            foreach ($data['product_product_description'] as $tab_descr) {

                foreach ($tab_descr['product_product_description_description'] as $text_key => $text_value) {

                    $query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "product_tab_description WHERE id = '" . (int)$tab_descr['product_description_id'] . "' AND `language_id` = '" . (int)$text_key . "'");

                    if ($query->num_rows) {

                        $this->db->query("UPDATE " . DB_PREFIX . "product_tab_description SET name = '" . $this->db->escape($tab_descr['name']) . "',  text = '" . $this->db->escape($text_value['text']) . "' WHERE id = '" . (int)$tab_descr['product_description_id'] . "' AND `language_id` = '" . (int)$text_key . "'");

                        $selected_products = 'product_tab_select' . $tab_descr['product_description_id'];
                        $selected_products_name = 'product_tab_front_name' . $tab_descr['product_description_id'];

                        foreach ($data[$selected_products] as $prod_tab) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "custom_product_tab SET `product_description_id` = '" . (int)$tab_descr['product_description_id'] . "', `front_name` = '" . $this->db->escape($data[$selected_products_name]) . "', product_id = '" . (int)$prod_tab . "'");

                        }

                        $selected_products_descr = 'product_tab_select_description' . $tab_descr['product_description_id'];

                        foreach ($data[$selected_products_descr] as $prod_tab) {
                            $this->db->query("INSERT INTO " . DB_PREFIX . "custom_product_tab_description SET `product_description_id` = '" . (int)$tab_descr['product_description_id'] . "', product_id = '" . (int)$prod_tab . "'");

                        }

                        $all_prod_descr[] = $tab_descr['product_description_id'];

                    } else {

                        $this->db->query("INSERT INTO " . DB_PREFIX . "product_tab_description SET `name` = '" . $this->db->escape($tab_descr['name']) . "', `language_id` = '" . (int)$text_key . "', text = '" . $this->db->escape($text_value['text']) . "'");

                        $last_ins_id = $this->db->getLastId();

                        $all_prod_descr[] = $last_ins_id;

                    }

                }

            }

        }


        $ids = implode(',', $all_prod_descr);

        if($all_prod_descr) {
            $this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_description WHERE id NOT IN (" . $ids . ") OR id < " . $all_prod_descr[0]);
        } else {
            $this->db->query("DELETE FROM " . DB_PREFIX . "product_tab_description");
        }



	}

	public function getCustomTabs($data = []) {

        $query = $this->db->query("SELECT *  FROM " . DB_PREFIX . "product_tab_description");

        return $query->rows;

	}


	public function getTabProductsChecked() {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_product_tab");

        return $query->rows;

	}

	public function getTabProductsCheckedDescription() {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "custom_product_tab_description");

        return $query->rows;

	}

}
