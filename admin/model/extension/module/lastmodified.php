<?php
class ModelExtensionModuleLastModified extends Model {
  
    public function formproduct($product) {		
        if (isset($product['product_category'])) {
            foreach ($product['product_category'] as $categ) {          
            $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) LEFT JOIN " . DB_PREFIX . "product_to_category p2c ON (p.product_id = p2c.product_id) WHERE pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p2c.category_id = '" . (int)$categ . "' ORDER BY pd.name ASC");  
				foreach ($query->rows as $prod_id) {
            mt_srand(time()+(double)microtime()*1000000);
            $timemod = date('H:i:s', strtotime(date("00:00:00",time())) + rand((int)$product['timemin']*60*60, (int)$product['timemax']*60*60));
            $this->db->query("UPDATE " . DB_PREFIX . "product SET date_modified = '" .$product['datemod']." ".$timemod."' WHERE product_id = '" . (int)$prod_id['product_id'] . "'"); 
                }
            }
        }
	}
// category
    public function formcategory($category) {
		if (isset($category['category'])){
            foreach ($category['category'] as $category_id){
			mt_srand(time()+(double)microtime()*1000000);
            $timemodcategory= date('H:i:s', strtotime(date("00:00:00",time())) + rand((int)$category['timemincategory']*60*60, (int)$category['timemaxcategory']*60*60));
      		$this->db->query("UPDATE " . DB_PREFIX . "category SET date_modified = '" .$category['datemodcategory']." ".$timemodcategory."' WHERE category_id = '" . (int)$category_id . "'");
            }
          }
	}
// info
	public function forminfo($info) {
		$queryhome = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . "information LIKE  'date_modified'" );
		
		if(!$queryhome->num_rows) {
			$this->db->query("ALTER TABLE "  . DB_PREFIX . "information ADD date_modified DATETIME ");
		}	
		
		if (isset($info['information'])){
			mt_srand(time()+(double)microtime()*1000000);
            foreach ($info['information'] as $information_id){
            $timemodinfo= date('H:i:s', strtotime(date("00:00:00",time())) + rand((int)$info['timemininfo']*60*60, (int)$info['timemaxinfo']*60*60));
      		$this->db->query("UPDATE " . DB_PREFIX . "information SET date_modified = '" .$info['datemodinfo']." ".$timemodinfo."' WHERE information_id = '" . (int)$information_id . "'");
            }
          }
    }
// home	
    public function formhome($home) {
		$query = $this->db->query('SHOW TABLES LIKE "' . DB_PREFIX . 'homemod"');
		
			if(!$query->num_rows) {
				$this->db->query("CREATE TABLE " . DB_PREFIX . "homemod ( date_modified DATETIME NOT NULL DEFAULT  '0000-00-00 00:00:00' )"); 
			}
				
		$timemodhome= date('H:i:s', strtotime(date("00:00:00",time())) + rand((int)$home['timeminhome']*60*60, (int)$home['timemaxhome']*60*60));

		$queryhome = $this->db->query("SELECT * FROM " . DB_PREFIX . "homemod");
		
		if ($queryhome->num_rows){
			$this->db->query("UPDATE " . DB_PREFIX . "homemod SET date_modified = '" .$home['datemodhome']." ".$timemodhome. "'");
		}
		else{
			$this->db->query("INSERT INTO " . DB_PREFIX . "homemod SET date_modified = '" .$home['datemodhome']." ".$timemodhome. "'");
		}
  	}
// echo home	
public function homemod() {
	
		$date_modified = $this->db->query("SELECT * FROM " . DB_PREFIX . "homemod WHERE date_modified");
		
		return $date_modified->row;
	}	
    public function getAllCategories($categories, $parent_id = 0, $parent_name = '') {
        $output = array();
        if (array_key_exists($parent_id, $categories)) {
            if ($parent_name != '') {
                $parent_name .= $this->language->get('text_separator');
            }
            foreach ($categories[$parent_id] as $category) {
                $output[$category['category_id']] = array(
                    'category_id' => $category['category_id'],
                    'name'        => $parent_name . $category['name']
                );
                $output += $this->getAllCategories($categories, $category['category_id'], $parent_name . $category['name']);
            }
        }
        return $output;
    }          
}
?>