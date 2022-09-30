<?php
class ModelSmartFilterCarMark extends Model {
	public function addCarMark($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "sf_car_mark` SET car_mark = '" . $this->db->escape($data['car_mark']) . "', car_sort = '" . (int)$data['car_sort'] . "'");

		$car_mark_id = $this->db->getLastId();

        if(isset($data['mark_model']) && is_array($data['mark_model'])) {

            foreach ($data['mark_model'] as $mark_model) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_model_to_mark` SET model_id = '" . (int)$mark_model . "', mark_id = '" . (int)$car_mark_id . "'");
            }

        }

		return $car_mark_id;
	}

	public function editCarMark($car_mark_id, $data) {

		$this->db->query("UPDATE `" . DB_PREFIX . "sf_car_mark` SET car_mark = '" . $this->db->escape($data['car_mark']) . "', car_sort = '" . (int)$data['car_sort'] . "' WHERE id = '" . (int)$car_mark_id . "'");

        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_model_to_mark` WHERE mark_id = '" . (int)$car_mark_id . "'");

        if(isset($data['mark_model']) && is_array($data['mark_model'])) {

            foreach ($data['mark_model'] as $mark_model) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_model_to_mark` SET model_id = '" . (int)$mark_model . "', mark_id = '" . (int)$car_mark_id . "'");
            }

        }

	}

	public function deleteCarMark($car_mark_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "sf_car_mark` WHERE id = '" . (int)$car_mark_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_model_to_mark` WHERE mark_id = '" . (int)$car_mark_id . "'");
	}

	public function getCarMark($car_mark_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_mark` WHERE id = '" . (int)$car_mark_id . "'");

		return $query->row;
	}

	public function getCarMarks($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "sf_car_mark` ";

        $sort_data = array(
            'car_mark',
            'car_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY car_mark";
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


	public function getTotalCarMarks() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_car_mark`");

		return $query->row['total'];
	}

	public function getMarkModels($car_mark_id) {

	    $mark_models = [];

		$query = $this->db->query("SELECT model_id FROM `" . DB_PREFIX . "sf_model_to_mark` WHERE mark_id = '" . (int)$car_mark_id . "'");

		if($query->num_rows) {
		    foreach ($query->rows as $model) {
                $mark_models[] = $model['model_id'];
            }
        }

		return $mark_models;
	}
}
