<?php
class ModelExtensionModuleProductStickers extends Model {



    function getProductStickers() {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_stickers");

        if($query->rows) {
            return $query->rows;
        }

    }

    function getProductSticker($id = 0) {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_stickers WHERE id='" . (int)$id . "'");

        if($query->row) {
            return $query->row;
        }

    }

    function editProductSticker($product_sticker_id = 0, $data = []) {

        $this->db->query("UPDATE " . DB_PREFIX . "product_stickers SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "' WHERE id = '" . (int)$product_sticker_id . "'");

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "product_stickers SET image = '" . $this->db->escape($data['image']) . "' WHERE id = '" . (int)$product_sticker_id . "'");
        }


    }

    function addProductSticker($data = []) {

        $this->db->query("INSERT INTO " . DB_PREFIX . "product_stickers SET name = '" . $this->db->escape($data['name']) . "', description = '" . $this->db->escape($data['description']) . "', sort_order = '" . (int)$data['sort_order'] . "', status = '" . (int)$data['status'] . "'");

        $product_sticker_id = $this->db->getLastId();

        if (isset($data['image'])) {
            $this->db->query("UPDATE " . DB_PREFIX . "product_stickers SET image = '" . $this->db->escape($data['image']) . "' WHERE id = '" . (int)$product_sticker_id . "'");
        }

    }

    function deleteProductStickers($product_sticker_id = 0) {

        $this->db->query("DELETE FROM " . DB_PREFIX . "product_stickers WHERE id = '" . (int)$product_sticker_id . "'");

    }


}
