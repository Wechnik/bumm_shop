<?php
class ModelSmartFilterCarModel extends Model {
	public function addCarModel($data) {
		$this->db->query("INSERT INTO `" . DB_PREFIX . "sf_car_model` SET car_model = '" . $this->db->escape($data['car_model']) . "', car_sort = '" . (int)$data['car_sort'] . "'");

		$car_model_id = $this->db->getLastId();

        if(isset($data['model_generation']) && is_array($data['model_generation'])) {

            foreach ($data['model_generation'] as $model_generation) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_generation_to_model` SET generation_id = '" . (int)$model_generation . "', model_id = '" . (int)$car_model_id . "'");
            }

        }

		return $car_model_id;
	}

	public function editCarModel($car_model_id, $data) {
		$this->db->query("UPDATE `" . DB_PREFIX . "sf_car_model` SET car_model = '" . $this->db->escape($data['car_model']) . "', car_sort = '" . (int)$data['car_sort'] . "' WHERE id = '" . (int)$car_model_id . "'");

        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_generation_to_model` WHERE model_id = '" . (int)$car_model_id . "'");

        if(isset($data['model_generation']) && is_array($data['model_generation'])) {

            foreach ($data['model_generation'] as $model_generation) {
                $this->db->query("INSERT INTO `" . DB_PREFIX . "sf_generation_to_model` SET generation_id = '" . (int)$model_generation . "', model_id = '" . (int)$car_model_id . "'");
            }

        }

	}

	public function deleteCarModel($car_model_id) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "sf_car_model` WHERE id = '" . (int)$car_model_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "sf_model_to_mark` WHERE model_id = '" . (int)$car_model_id . "'");
	}

	public function getCarModel($car_model_id) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_model` WHERE id = '" . (int)$car_model_id . "'");

		return $query->row;
	}

	public function getCarModels($data = array()) {
		$sql = "SELECT * FROM `" . DB_PREFIX . "sf_car_model` ";

        $sort_data = array(
            'car_model',
            'car_sort'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY car_model";
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


	public function getTotalCarModels() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "sf_car_model`");

		return $query->row['total'];
	}

    public function getModelGenerations($car_model_id) {

        $model_generations = [];

        $query = $this->db->query("SELECT generation_id FROM `" . DB_PREFIX . "sf_generation_to_model` WHERE model_id = '" . (int)$car_model_id . "'");

        if($query->num_rows) {
            foreach ($query->rows as $model) {
                $model_generations[] = $model['generation_id'];
            }
        }

        return $model_generations;
    }

}
