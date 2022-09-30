<?php

header('Content-type: text/html; charset=utf8');
set_time_limit(0);
ini_set('max_execution_time', 0);
ini_set( 'display_errors', '1' );
ini_set("memory_limit", "-1");

class ControllerCommonParser extends Controller {
    public function index()
    {

        if(file_exists(DIR_UPLOADING . 'goods.xml'))
        {

            $xml = simplexml_load_file(DIR_UPLOADING . 'goods.xml');


            foreach ($xml->ДанныеТовара as $prod_data)
            {

                $product_code = isset($prod_data->Код->string) ? $prod_data->Код->string : false;
                $product_name = isset($prod_data->Наименование->string) ? $prod_data->Наименование->string : false;
                $product_availability_moscow = isset($prod_data->Наличие->Москва->boolean) && $prod_data->Наличие->Москва->boolean == 'true' ? 1 : 0;
                $product_availability_novosibirsk = isset($prod_data->Наличие->Новосибирск->boolean) && $prod_data->Наличие->Новосибирск->boolean == 'true' ? 1 : 0;

                $query = $this->db->query("SELECT shop_code FROM " . DB_PREFIX . "sync_1c_products WHERE 1c_code = '" . $this->db->escape($product_code) . "'");

                if($query->num_rows)
                {
                    foreach ($query->rows as $value) {

                        $this->db->query("UPDATE " . DB_PREFIX . "product SET availability_moscow = '" . (int)$product_availability_moscow . "', availability_novosibirsk = '" . (int)$product_availability_novosibirsk . "' WHERE product_id = '" . (int)$value['shop_code'] . "'");

                        $this->db->query("UPDATE `" . DB_PREFIX . "option_value`  SET `availability_moscow` = '" . (int)$product_availability_moscow . "', `availability_novosibirsk` = '" . (int)$product_availability_novosibirsk . "' WHERE `sync_code` = '" . $this->db->escape($product_code) . "'");

                    }
                    
                }

            }
        }
    }

}