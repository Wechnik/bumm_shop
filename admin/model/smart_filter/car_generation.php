<?php
class ModelSmartFilterCarGeneration extends Model {
	public function addCarGeneration($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "sf_car_generation` SET car_generation = '" . $this->db->escape($data['car_generation']) . "', car_sort = '" . (int)$data['car_sort'] . "'");

		$car_generation_id = $this->db->getLastId();

		return $car_generation_id;
	}

	public function editCarGeneration($car_generation_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "sf_car_generation` SET car_generation = '" . $this->db->escape($data['car_generation']) . "', car_sort = '" . (int)$data['car_sort'] . "' WHERE id = '" . (int)$car_generation_id . "'");
	}

	public function deleteCarGeneration($car_generation_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "sf_car_generation` WHERE id = '" . (int)$car_generation_id . "'");
	}

	public function getCarGeneration($car_generation_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_generation` WHERE id = '" . (int)$car_generation_id . "'");

		return $query->row;
	}

	public function getCarGenerations($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "sf_car_generation` ";

        $sort_data = array(
            'car_generation',
            'car_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY car_generation";
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


	public function getTotalCarGenerations() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_car_generation`");

		return $query->row['total'];
	}
}
