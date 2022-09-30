<?php
class ModelSmartFilterCarYear extends Model {
	public function addCarYear($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "sf_car_year` SET car_year = '" . $this->db->escape($data['car_year']) . "', car_sort = '" . (int)$data['car_sort'] . "'");

		$car_year_id = $this->db->getLastId();

		return $car_year_id;
	}

	public function editCarYear($car_year_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "sf_car_year` SET car_year = '" . $this->db->escape($data['car_year']) . "', car_sort = '" . (int)$data['car_sort'] . "' WHERE id = '" . (int)$car_year_id . "'");
	}

	public function deleteCarYear($car_year_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "sf_car_year` WHERE id = '" . (int)$car_year_id . "'");
	}

	public function getCarYear($car_year_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_year` WHERE id = '" . (int)$car_year_id . "'");

		return $query->row;
	}

	public function getCarYears($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "sf_car_year` ";

        $sort_data = array(
            'car_year',
            'car_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY car_year";
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


	public function getTotalCarYears() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_car_year`");

		return $query->row['total'];
	}
}
