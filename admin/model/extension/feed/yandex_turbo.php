<?php
class ModelExtensionFeedYandexTurbo extends Model {
	public function install() {
		$this->db->query("
			CREATE TABLE `" . DB_PREFIX . "yandex_turbo_category_to_category` (
				`yandex_turbo_category_id` INT(11) NOT NULL,
				`category_id` INT(11) NOT NULL,
				PRIMARY KEY (`yandex_turbo_category_id`, `category_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
		");

        $this->db->query(sprintf(
            'INSERT INTO '.DB_PREFIX.'setting SET store_id = %d, `code` = "yandex_turbo", `key` = "yandex_turbo_status", `value` = 1',
            (int)$this->config->get('config_store_id') 
        ));
        $this->db->query(sprintf(
            'INSERT INTO '.DB_PREFIX.'setting SET store_id = %d, `code` = "yandex_turbo", `key` = "yandex_turbo_delivery", `value` = 1',
            (int)$this->config->get('config_store_id') 
        ));
        $this->db->query(sprintf(
            'INSERT INTO '.DB_PREFIX.'setting SET store_id = %d, `code` = "yandex_turbo", `key` = "yandex_turbo_pickup", `value` = 1',
            (int)$this->config->get('config_store_id') 
        ));
	}

	public function uninstall() {
		$this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "yandex_turbo_category_to_category`");
	}

	public function getYandexTurboCategories($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "yandex_turbo_category` WHERE name LIKE '%" . $this->db->escape($data['filter_name']) . "%' ORDER BY name ASC";

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

	public function addCategory($data) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "yandex_turbo_category_to_category WHERE category_id = '" . (int)$data['category_id'] . "'");

		$this->db->query("INSERT INTO " . DB_PREFIX . "yandex_turbo_category_to_category SET category_id = '" . (int)$data['category_id'] . "'");
	}

	public function deleteCategory($category_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "yandex_turbo_category_to_category WHERE category_id = '" . (int)$category_id . "'");
	}

	public function deleteCategories() {
		$this->db->query("TRUNCATE TABLE " . DB_PREFIX . "yandex_turbo_category_to_category");
	}

	public function getCategories($data = array()) {
		$sql = "
			SELECT 
				category_id, 
				(
				SELECT name 
				FROM `" . DB_PREFIX . "category_description` cd 
				WHERE 
					cd.category_id = gbc2c.category_id AND 
					cd.language_id = '" . (int)$this->config->get('config_language_id') . "'
				) AS category 
			FROM `" . DB_PREFIX . "yandex_turbo_category_to_category` gbc2c 
			ORDER BY yandex_turbo_category_id ASC
		";

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

	public function getTotalCategories() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "yandex_turbo_category_to_category`");

		return $query->row['total'];
	}

	public function totalProducts($data = array())
	{
		$total = 0;

		$customer_group_id = $this->config->get('config_customer_group_id');

		$cache = md5(http_build_query($data));

		$total = $this->cache->get('ytproducts.total.' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache);

		if (!$total) {
			$sql = "
				SELECT 
					COUNT(DISTINCT p.product_id) total 
				FROM " . DB_PREFIX . "product p 
				LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) 
				LEFT JOIN " . DB_PREFIX . "product_to_store p2s ON (p.product_id = p2s.product_id)
			"; 

			if (!empty($data['filter_category_id'])) {
				$sql .= " INNER JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id)";            
			}
			
			$sql .= " WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.status = '1' AND p.date_available <= NOW() AND p2s.store_id = '" . (int)$this->config->get('config_store_id') . "'"; 

			if (!empty($data['filter_category_id'])) {
				if (!empty($data['filter_sub_category'])) {
					$implode_data = array();
					
					$implode_data[] = (int)$data['filter_category_id'];
					
					$this->load->model('catalog/category');
					
					$categories = $this->model_catalog_category->getCategoriesByParentId($data['filter_category_id']);
										
					foreach ($categories as $category_id) {
						$implode_data[] = (int)$category_id;
					}
								
					$sql .= " AND p2c.category_id IN (" . implode(', ', $implode_data) . ")";            
				} else {
					if (is_array($data['filter_category_id']))
						$sql .= " AND p2c.category_id IN (" . implode(',', $data['filter_category_id']) . ")";
					else 
						$sql .= " AND p2c.category_id = '" . (int)$data['filter_category_id'] . "'";
				}
			}              
	  
			if (!empty($data['filter_name']) || !empty($data['filter_tag'])) {
				$sql .= " AND (";
				
				if (!empty($data['filter_name'])) {                    
					if (!empty($data['filter_description'])) {
						$sql .= "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%' OR MATCH(pd.description) AGAINST('" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "')";
					} else {
						$sql .= "LCASE(pd.name) LIKE '%" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "%'";
					}
				}
				
				if (!empty($data['filter_name']) && !empty($data['filter_tag'])) {
					$sql .= " OR ";
				}
				
				if (!empty($data['filter_tag'])) {
					$sql .= "MATCH(pd.tag) AGAINST('" . $this->db->escape(utf8_strtolower($data['filter_tag'])) . "')";
				}
			
				$sql .= ")";
		
				if (!empty($data['filter_name'])) {
					$sql .= " OR LCASE(p.model) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}
				
				if (!empty($data['filter_name'])) {
					$sql .= " OR LCASE(p.sku) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}    
				
				if (!empty($data['filter_name'])) {
					$sql .= " OR LCASE(p.upc) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}        

				if (!empty($data['filter_name'])) {
					$sql .= " OR LCASE(p.ean) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}

				if (!empty($data['filter_name'])) {
					$sql .= " OR LCASE(p.jan) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}
				
				if (!empty($data['filter_name'])) {
					$sql .= " OR LCASE(p.isbn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}        
				
				if (!empty($data['filter_name'])) {
					$sql .= " OR LCASE(p.mpn) = '" . $this->db->escape(utf8_strtolower($data['filter_name'])) . "'";
				}                    
			}

			if (!empty($data['filter_manufacturer_id'])) {
				$sql .= " AND p.manufacturer_id = '" . (int)$data['filter_manufacturer_id'] . "'";
			}

			$query = $this->db->query($sql);
			$total = $query->row['total'];

			$this->cache->set('ytproducts.total' . (int)$this->config->get('config_language_id') . '.' . (int)$this->config->get('config_store_id') . '.' . (int)$customer_group_id . '.' . $cache, $total);
		}
		
		return $total;
	}

	public function totalArticles()
	{
		$res = $this->db->query('SELECT COUNT(information_id) total FROM '.DB_PREFIX.'information_description');

		return $res->row['total'];
	}

    // Возвращает случайный товар
    public function product()
    {
        $sql = '
            SELECT cd.name typePrefix, m.name vendor, pd.name model
            FROM '.DB_PREFIX.'product p
            INNER JOIN '.DB_PREFIX.'product_description pd ON pd.product_id = p.product_id AND pd.language_id = ' . (int)$this->config->get('config_language_id') . '
            INNER JOIN '.DB_PREFIX.'product_to_category pc ON pc.product_id = p.product_id AND pc.main_category = 1
            INNER JOIN '.DB_PREFIX.'category_description cd ON cd.category_id = pc.category_id
            INNER JOIN '.DB_PREFIX.'manufacturer m ON m.manufacturer_id = p.manufacturer_id
            ORDER BY RAND()
            LIMIT 1
        ';
        $res = $this->db->query($sql);

        return $res->row;
    }
}
