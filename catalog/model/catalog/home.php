<?php
class ModelCatalogHome extends Model {

public function homemod() {
	
		$date_modified = $this->db->query("SELECT * FROM " . DB_PREFIX . "homemod WHERE date_modified");
		
		return $date_modified->row;
	}
}
?>