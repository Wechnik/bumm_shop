<?php
class ModelExtensionModuleSmartFilter extends Model {


	public function getAllCarYears($parent_id = 0) {

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sf_car_year ORDER BY car_year DESC");

		return $query->rows;
	}




    public function getMarkByYear($car_year_id) {

        $query = $this->db->query("SELECT cp.car_mark_id, cm.car_mark FROM " . DB_PREFIX . "sf_car_products cp
        LEFT JOIN " . DB_PREFIX . "sf_car_mark cm ON (cp.car_mark_id = cm.id)
        WHERE cp.start_year_id <= '" . (int)$car_year_id . "' AND cp.end_year_id >= '" . (int)$car_year_id . "' GROUP BY cp.car_mark_id ORDER BY cm.car_mark ASC ");

        return $query->rows;

    }


    public function getModelByYearMark($car_year_id, $car_mark_id) {

        $query = $this->db->query("SELECT cp.car_model_id, cmd.car_model FROM " . DB_PREFIX . "sf_car_products cp
        LEFT JOIN " . DB_PREFIX . "sf_car_model cmd ON (cp.car_model_id = cmd.id)
        WHERE cp.start_year_id <= '" . (int)$car_year_id . "' AND cp.end_year_id >= '" . (int)$car_year_id . "'
        AND cp.car_mark_id = '" . (int)$car_mark_id . "' AND cmd.car_model IS NOT NULL GROUP BY cp.car_model_id ORDER BY cmd.car_model ASC ");

        return $query->rows;

    }

    public function getGenerationByYearMarkModel($car_year_id, $car_mark_id, $car_model_id) {

        $query = $this->db->query("SELECT cp.car_generation_id, cg.car_generation FROM " . DB_PREFIX . "sf_car_products cp
        LEFT JOIN " . DB_PREFIX . "sf_car_generation cg ON (cp.car_generation_id = cg.id)
        WHERE cp.start_year_id <= '" . (int)$car_year_id . "' AND cp.end_year_id >= '" . (int)$car_year_id . "'
        AND cp.car_mark_id = '" . (int)$car_mark_id . "'  AND cp.car_model_id = '" . (int)$car_model_id . "'
        AND cg.car_generation IS NOT NULL GROUP BY cp.car_generation_id ORDER BY cg.car_generation ASC ");

        return $query->rows;

    }



    public function getFilteredProducts($car_year_id, $car_mark_id, $car_model_id, $car_generation_id = false) {

        $sql = "SELECT product_id FROM " . DB_PREFIX . "sf_car_products
        WHERE start_year_id <= '" . (int)$car_year_id . "' AND end_year_id >= '" . (int)$car_year_id . "'
        AND car_mark_id = '" . (int)$car_mark_id . "' AND car_model_id = '" . (int)$car_model_id . "'";

        if($car_generation_id) {
            $sql .= " AND car_generation_id='" . (int)$car_generation_id . "'";
        }

        $query = $this->db->query($sql);


        return $query->rows;
    }


    public function getProductCategories($product_id) {
        $product_category_data = array();

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

        if($query->num_rows > 1) {
            foreach ($query->rows as $result) {
                if($result['main_category'] == 0) {
                    $product_category_data[] = $result['category_id'];
                }

            }
        } else {
            foreach ($query->rows as $result) {
                $product_category_data[] = $result['category_id'];
            }
        }

        return $product_category_data;
    }

    public function getProductMainCategories($product_id) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "' AND main_category = 1");
	
//	    $query = $this->db->query("SELECT ptc.*, c.image AS cat_image FROM " . DB_PREFIX . "product_to_category ptc
//         LEFT JOIN " . DB_PREFIX . "category c ON (ptc.category_id = c.category_id)
//         WHERE product_id = '" . (int)$product_id . "' AND main_category = 1");
        
        return $query->row;
    }


    public function getUniversalProducts() {

        $query = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "product WHERE universal_product = '1'");

        if($query->num_rows) {

            foreach ($query->rows as $pro_id) {

                $prod_ids[] = $pro_id['product_id'];

            }
        }

        return $prod_ids;
    }

    public function getCarYear($car_year) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_year` WHERE car_year = '" . (int)$car_year . "'");

        return $query->row;
    }

    public function getCarMark($car_mark_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_mark` WHERE id = '" . (int)$car_mark_id . "'");

        return $query->row;
    }

    public function getCarModel($car_model_id) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_model` WHERE id = '" . (int)$car_model_id . "'");

        return $query->row;
    }

    public function getCarGeneration($car_generation_id = 0) {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "sf_car_generation` WHERE id = '" . (int)$car_generation_id . "'");

        if($query->num_rows) {
            return $query->row;
        } else {

        }


    }

    public function getProductFilters ($product_id) {

        $query = $this->db->query("SELECT scp.start_year_id, scp.end_year_id,  scmrk.car_mark, scmdl.car_model, scg.car_generation
FROM " . DB_PREFIX . "sf_car_products scp
        LEFT JOIN " . DB_PREFIX . "sf_car_mark scmrk ON (scp.car_mark_id = scmrk.id)
        LEFT JOIN " . DB_PREFIX . "sf_car_model scmdl ON (scp.car_model_id = scmdl.id)
        LEFT JOIN " . DB_PREFIX . "sf_car_generation scg ON (scp.car_generation_id = scg.id) WHERE scp.product_id = '" . (int)$product_id . "'");

        return $query->rows;

    }


}