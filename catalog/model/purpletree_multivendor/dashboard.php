<?php
class ModelPurpletreeMultivendorDashboard extends Model{
		public function getTotalSellerOrders($data= array()){
			$sql = "SELECT COUNT(pvo.order_id) AS total FROM `" . DB_PREFIX . "order` o JOIN " . DB_PREFIX . "purpletree_vendor_orders pvo ON(pvo.order_id=o.order_id)";
			$sql.="WHERE pvo.seller_id='".(int)$data['seller_id']."' ";
			$query = $this->db->query($sql);
			
			return $query->row['total'];
		}
		
		public function getTotalsale($data = array()) {
			$sql = "SELECT SUM(total_price) AS total FROM `" . DB_PREFIX . "purpletree_vendor_orders` pvo LEFT JOIN `" . DB_PREFIX . "order` o ON (o.order_id=pvo.order_id) WHERE seller_id ='".(int)$data['seller_id']."' AND o.order_status_id != 0";
			$query = $this->db->query($sql);
			
			return $query->row['total'];
		}
		
		public function getSellerOrders($data = array()) {
			$sql = "SELECT pvo.order_status_id AS seller_order_status_id,o.order_status_id AS admin_order_status_id,o.order_id, CONCAT(o.firstname, ' ', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = pvo.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS order_status, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = '" . (int)$this->config->get('config_language_id') . "') AS admin_order_status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o JOIN " . DB_PREFIX . "purpletree_vendor_orders pvo ON(pvo.order_id=o.order_id) ";
			
			$sql .= " WHERE pvo.order_status_id > 0";
			if(!empty($data['seller_id'])){
				$sql .= " AND pvo.seller_id ='".(int)$data['seller_id']."'";
			}
			$sql .= " group by o.order_id ORDER BY o.order_id DESC LIMIT 5";
			$query = $this->db->query($sql);
			
			return $query->rows;
		}
		
		public function getCommissions($data=array()){
			$config_status=$this->config->get('purpletree_multivendor_commission_status');
			$sql = "SELECT pvc.*,pd.name,pvo.total_price,o.currency_code, o.currency_value FROM " . DB_PREFIX . "purpletree_vendor_commissions pvc JOIN " .DB_PREFIX. "product_description pd ON(pd.product_id=pvc.product_id) JOIN " .DB_PREFIX. "purpletree_vendor_orders pvo ON(pvo.product_id=pvc.product_id AND pvo.order_id=pvc.order_id) JOIN `" .DB_PREFIX. "order` o ON(o.order_id=pvo.order_id)";
			
			if(!empty($data['seller_id'])){
				$sql .= " WHERE pvc.seller_id ='".(int)$data['seller_id']."' AND o.order_status_id='".(int)$config_status."' AND pvo.order_status_id='".(int)$config_status."'";
			}
			
			$sql .= " GROUP BY pvc.id ORDER BY id DESC LIMIT 5";
			
			$query  = $this->db->query($sql);
			return $query->rows;
		}
		
		public function getPayments($data=array()){
			
			$sql  = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_payments ";
			if(!empty($data['seller_id'])){
				$sql .= " WHERE seller_id ='".(int)$data['seller_id']."'";
			}
			
			$sql .= " GROUP BY id ORDER BY id DESC LIMIT 5 ";
			
			$query  = $this->db->query($sql);
			return $query->rows;
		}
		
		
		public function getTotalPayments($data=array()){
			
			$sql  = "SELECT SUM(amount) AS total FROM " . DB_PREFIX . "purpletree_vendor_payments";
			if(!empty($data['seller_id'])){
				$sql .= " WHERE seller_id ='".(int)$data['seller_id']."'";
			}
			$query  = $this->db->query($sql);
			
			if($query->num_rows >0){
				return $query->row['total'];
				} else {
				return 0;
			}
		}
		
		public function getCurrencySymbol($currency_code){
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX. "currency WHERE code='".$this->db->escape($currency_code)."'");
			return $query->row;
		}
		public function getSellerOrdersTotal($seller_id,$order_id){
			$query = $this->db->query("SELECT value AS total  FROM " . DB_PREFIX . "purpletree_order_total WHERE seller_id = '".(int)$seller_id."' AND order_id = '".(int)$order_id."' AND code='total'");
			return $query->row;
		}
		
		public function getSellerOrdersCommissionTotal($order_id,$seller_id=NULL){
			
			$sql = "SELECT SUM(commission) AS total_commission  FROM " . DB_PREFIX . "purpletree_vendor_commissions WHERE order_id = '".(int)$order_id."'";
			
			if(!empty($seller_id)){
				$sql .= " AND seller_id = '".(int)$seller_id."'";
			}
			
			$query = $this->db->query($sql);
			
			return $query->row;
		}
		public function getTotalSellerOrderscommission($seller_id='',$statusid = 5){
			
			$sql = "SELECT pvc.commission FROM " . DB_PREFIX . "purpletree_vendor_commissions pvc JOIN " . DB_PREFIX . "purpletree_vendor_orders pvo ON(pvo.order_id=pvc.order_id AND pvo.seller_id=pvc.seller_id) JOIN `" . DB_PREFIX . "order` o ON(o.order_id=pvc.order_id AND o.order_id=pvo.order_id) WHERE pvc.seller_id = '".(int)$seller_id."' AND o.order_status_id =".$statusid." AND pvo.order_status_id = ".(int)$statusid." GROUP By pvc.id";
			$query = $this->db->query($sql);
			return $query->rows;
		}
		public function pendingPayments($filter_data = array()){
			
			$sql = "SELECT pvo.order_id as `order_id`,pvo.total_price, pvo.order_status_id as `seller_order_status`,o.order_status_id AS `admin_order_status` FROM `" . DB_PREFIX . "purpletree_vendor_orders` pvo JOIN `". DB_PREFIX ."order` o ON(pvo.order_id=o.order_id) WHERE pvo.seller_id = '".(int)$filter_data['seller_id']."' GROUP BY pvo.id";
			
			$query = $this->db->query($sql);
			return $query->rows;
		}
		public function getCountSeen1($seller_id){
			$store_id=(int)$this->config->get('config_store_id');
			$query = $this->db->query("SELECT COUNT(seen) as totalenquries FROM " . DB_PREFIX . "purpletree_vendor_contact pvc JOIN ". DB_PREFIX ."purpletree_vendor_stores pvs ON(pvc.seller_id=pvs.seller_id)  WHERE pvc.seller_id='".(int)$seller_id. "' AND pvc.seen = '1' AND FIND_IN_SET('".$store_id."',pvs.multi_store_id)"); 			
			if($query->num_rows){
				return $query->row['totalenquries'];
				} else { 
				return 0;
			}
		}	
		public function getCountSeen($seller_id){
			$store_id=(int)$this->config->get('config_store_id');
			$query = $this->db->query("SELECT pvo.seen,pvo.order_status_id FROM " . DB_PREFIX . "purpletree_vendor_orders pvo JOIN ". DB_PREFIX ."purpletree_vendor_stores pvs ON(pvo.seller_id=pvs.seller_id) WHERE pvo.seller_id='".(int)$seller_id. "' AND pvo.seen = '1' AND pvo.order_status_id!=0 AND FIND_IN_SET('".$store_id."',pvs.multi_store_id) GROUP BY pvo.order_id"); 			
			if($query->num_rows){
				return $query->num_rows;
				} else { 
				return 0;
			}
		}
		public function getCountAdminMessageSeen($seller_id){
			$store_id=(int)$this->config->get('config_store_id');
			$query = $this->db->query("SELECT COUNT(seen) as totaladminemessages FROM " . DB_PREFIX . "purpletree_vendor_enquiries pve JOIN ". DB_PREFIX ."purpletree_vendor_stores pvs ON(pve.seller_id=pvs.seller_id)  WHERE pve.seller_id='".(int)$seller_id. "' AND pve.seen = '1' AND pve.contact_from = '1' AND FIND_IN_SET('".$store_id."',pvs.multi_store_id)"); 			
			if($query->num_rows){
				return $query->row['totaladminemessages'];
				} else { 
				return 0;
			}
		}
		public function checkSellerApproval(){
			$checkSeller = $this->db->query("SELECT store_status FROM " . DB_PREFIX . "purpletree_vendor_stores WHERE seller_id = '".(int)$this->customer->getId(). "' AND store_status = 0");
			if($checkSeller->num_rows>=1){
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerstore/becomeseller','', true));
			}
		}
	
	
		public function getCustomTabs($data = []) {
			
			$query = $this->db->query("SELECT * , cpt.front_name as front_name FROM " . DB_PREFIX . "product_tab_description ptd LEFT JOIN " . DB_PREFIX . "custom_product_tab cpt ON (cpt.product_description_id = ptd.id) GROUP BY ptd.id");
			
			return $query->rows;
			
		}
	
	
		public function getCheckedTabProducts($product_id = 0) {
			
			$query = $this->db->query("SELECT ptd.id FROM " . DB_PREFIX . "product_tab_description ptd
	        LEFT JOIN " . DB_PREFIX . "custom_product_tab cpt ON (cpt.product_description_id = ptd.id)
	        WHERE cpt.product_id = '" . (int)$product_id . "'
	        AND ptd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
			
			return $query->rows;
			
		}
		
		public function getCheckedTabProductsDescription($product_id = 0) {
			
			$query = $this->db->query("SELECT ptd.id FROM " . DB_PREFIX . "product_tab_description ptd
	        LEFT JOIN " . DB_PREFIX . "custom_product_tab_description cpt ON (cpt.product_description_id = ptd.id)
	        WHERE cpt.product_id = '" . (int)$product_id . "'
	        AND ptd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
			
			return $query->rows;
			
		}
		
		
}
?>