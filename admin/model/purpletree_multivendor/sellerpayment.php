<?php
class ModelPurpletreeMultivendorSellerpayment extends Model{
		
		public function getPayments($data=array()){
			
			$sql  = "SELECT * FROM " . DB_PREFIX . "purpletree_vendor_payments ";
			if(!empty($data['seller_id'])){
				$sql .= " WHERE seller_id ='".(int)$data['seller_id']."'";
			}
			
			if (!empty($data['filter_date_from'])) {
				$sql .= " AND DATE(created_at) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
			}
			
			if (!empty($data['filter_date_to'])) {
				$sql .= " AND DATE(created_at) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
			}
			if(!isset($data['filter_date_from']) && !isset($data['filter_date_to'])){
				$end_date = date('Y-m-d', strtotime("-30 days"));
				$sql .= " AND DATE(created_at) >= '".$this->db->escape($end_date)."'";
				$sql .= " AND DATE(created_at) <= '".$this->db->escape(date('Y-m-d'))."'";
			}
			
			$sql .= " GROUP BY id ORDER BY id DESC";
			
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}
				
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}
				
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}
			
			$query  = $this->db->query($sql);
			return $query->rows;
		}
		
		public function getTotalPayments($data=array()){
			
			$sql  = "SELECT count(*) AS total FROM " . DB_PREFIX . "purpletree_vendor_payments";
			if(!empty($data['seller_id'])){
				$sql .= " WHERE seller_id ='".(int)$data['seller_id']."'";
			}
			
			if (!empty($data['filter_date_from'])) {
				$sql .= " AND DATE(created_at) >= DATE('" . $this->db->escape($data['filter_date_from']) . "')";
			}
			
			if (!empty($data['filter_date_to'])) {
				$sql .= " AND DATE(created_at) <= DATE('" . $this->db->escape($data['filter_date_to']) . "')";
			}
			if(!isset($data['filter_date_from']) && !isset($data['filter_date_to'])){
				$end_date = date('Y-m-d', strtotime("-30 days"));
				$sql .= " AND DATE(created_at) >= '".$this->db->escape($end_date)."'";
				$sql .= " AND DATE(created_at) <= '".$this->db->escape(date('Y-m-d'))."'";
			}
			//only in 2.x
			if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}
				
				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}
				
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
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
}
?>