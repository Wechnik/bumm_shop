<?php
class ModelCatalogSync1c extends Model {


	public function getProducts($data = []) {

        if(file_exists(DIR_UPLOADING . 'goods.xml'))
        {

            $data_products = [];

            $tmp_xml = simplexml_load_file(DIR_UPLOADING . 'goods.xml');

            $xml = json_decode(json_encode($tmp_xml), TRUE);

            $xml = array_values($xml);


            foreach ($xml[0] as $prod_data_k => $prod_data_v)
            {

                $product_code = isset($prod_data_v['Код']['string']) ? $prod_data_v['Код']['string'] : false;
                $product_name = isset($prod_data_v['Наименование']['string']) ? $prod_data_v['Наименование']['string'] : false;

                $availability_moscow = isset($prod_data_v['Наличие']['Москва']['boolean']) && $prod_data_v['Наличие']['Москва']['boolean'] == 'true' ? 1 : 0;
                $availability_novosibirsk = isset($prod_data_v['Наличие']['Новосибирск']['boolean']) && $prod_data_v['Наличие']['Новосибирск']['boolean'] == 'true' ? 1 : 0;

                if(!isset($data['limit']) && !isset($data['start']))
                {
                    $data_products[$prod_data_v['Наименование']['string']] = [
                        'code' => $product_code,
                        'name' => $product_name,
                        'availability_moscow' => $availability_moscow,
                        'availability_novosibirsk' => $availability_novosibirsk,
                    ];
                }
                else if($prod_data_k >= $data['start'] && $prod_data_k < $data['start'] + $data['limit'])
                {
                    $data_products[$prod_data_v['Код']['string']] = [
                        'code' => $product_code,
                        'name' => $product_name,
                        'availability_moscow' => $availability_moscow,
                        'availability_novosibirsk' => $availability_novosibirsk,
                    ];
                }

            }

            ksort($data_products);

            return $data_products;

        }

	}

	public function getShopProducts($sync_product_code) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sync_1c_products WHERE 1c_code = '" . $this->db->escape($sync_product_code) . "'");

		return $query->rows;
	}


	public function getTotalProducts() {

        if(file_exists(DIR_UPLOADING . 'goods.xml'))
        {
            $xml = simplexml_load_file(DIR_UPLOADING . 'goods.xml');

            return count($xml->ДанныеТовара);

        }

	}

	public function editProducts($data = []) {

        if(isset($data['sync_shop_product'])) {

            foreach ($data['sync_shop_product'] as $sync_data_k => $sync_data)
       {

                $this->db->query("DELETE FROM " . DB_PREFIX . "sync_1c_products WHERE 1c_code = '" . $this->db->escape($sync_data_k) . "'");

                foreach ($sync_data as $data_v) {

                    $this->db->query("INSERT INTO " . DB_PREFIX . "sync_1c_products SET 1c_code = '" . $this->db->escape($data_v['sync_product_code']) . "', 1c_name = '" .  $this->db->escape($data_v['sync_product_name']) . "', shop_code = '" . (int)$data_v['shop_product_code'] . "', shop_name = '" .  $this->db->escape($data_v['shop_product_name']) . "'");

                }

            }

        }



	}

}
