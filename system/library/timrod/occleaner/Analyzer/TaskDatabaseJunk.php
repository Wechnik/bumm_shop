<?php

namespace Timrod\Occleaner\Analyzer;

use Timrod\Occleaner\Utils;

class TaskDatabaseJunk extends Task
{
    /**
     *
     */
    public function scan()
    {
        switch ($this->task) {
            case 'unused_options':
                return $this->scanUnusedOptions();
            case 'unused_attributes':
                return $this->scanUnusedAttributes();
            case 'empty_attribute_groups':
                return $this->scanEmptyAttributeGroups();
            case 'empty_categories':
                return $this->scanEmptyCategories();
            case 'products_without_images':
                return $this->scanProductsWithoutImages();
            default:
                return array('status' => 'done',);
        }
    }

    /**
     *
     */
    public function delete(array $list)
    {
        $count = 0;

        if ($this->task === 'unused_options') {

            $this->load->model('catalog/option');

            foreach ($list as $id) {
                $item = $this->task_storage->get($id);
                $this->model_catalog_option->deleteOption($item['item_id']);
                if (empty($this->model_catalog_option->getOption($item['item_id']))) {
                    $this->task_storage->delete($id);
                    $count++;
                }
            }
        }

        if ($this->task === 'unused_attributes') {

            $this->load->model('catalog/attribute');

            foreach ($list as $id) {
                $item = $this->task_storage->get($id);
                $this->model_catalog_attribute->deleteAttribute($item['item_id']);
                if (empty($this->model_catalog_attribute->getAttribute($item['item_id']))) {
                    $this->task_storage->delete($id);
                    $count++;
                }
            }
        }

        if ($this->task === 'empty_attribute_groups') {

            $this->load->model('catalog/attribute_group');

            foreach ($list as $id) {
                $item = $this->task_storage->get($id);
                $this->model_catalog_attribute_group->deleteAttributeGroup($item['item_id']);
                if (empty($this->model_catalog_attribute_group->getAttributeGroup($item['item_id']))) {
                    $this->task_storage->delete($id);
                    $count++;
                }
            }
        }

        if ($this->task === 'empty_categories') {

            $this->load->model('catalog/category');

            foreach ($list as $id) {
                $item = $this->task_storage->get($id);
                $this->model_catalog_category->deleteCategory($item['item_id']);
                if (empty($this->model_catalog_category->getCategory($item['item_id']))) {
                    $this->task_storage->delete($id);
                    $count++;
                }
            }
        }

        if ($this->task === 'products_without_images') {

            $this->load->model('catalog/product');

            foreach ($list as $id) {
                $item = $this->task_storage->get($id);
                $this->model_catalog_product->deleteProduct($item['item_id']);
                if (empty($this->model_catalog_product->getProduct($item['item_id']))) {
                    $this->task_storage->delete($id);
                    $count++;
                }
            }
        }

        if ($this->task === 'expired_sessions') {

            foreach ($list as $id) {
                $this->db->query("DELETE FROM " . DB_PREFIX . "session WHERE `session_id` = '" . $this->db->escape($id) . "'");
            }
        }

        return $count;
    }

    /**
     * @return array
     */
    public function deleteAll()
    {
        $return = array('status' => 'next', 'count' => 0, 'size' => '');

        $limit = Utils::getPerfomanceValue(500, $this->config->get('module_timrod_occleaner_performance_request'));

        $this->task_storage->filter(['start' => 0, 'limit' => $limit]);

        $result = $this->task_storage->getList();

        $list = [];

        foreach ($result['list'] as $item) {
            if ($this->task === 'expired_sessions') {
                $list[] = $item['item_id'];
            } else {
                $list[] = $item['id'];
            }
        }

        if ($result['count_items'] > 0) {
            $this->delete($list);
        } else {
            $return['status'] = 'done';
        }

        return $return;
    }

    /**
     * Scan unused options
     * @return array
     */
    private function scanUnusedOptions()
    {
        $query = $this->db->query("SELECT DISTINCT option_id FROM `" . DB_PREFIX . "product_option`");

        $used = array();

        foreach ($query->rows as $result) {
            $used[] = $result['option_id'];
        }

        $query = $this->db->query("SELECT DISTINCT option_id FROM `" . DB_PREFIX . "option`");

        $all = array();

        foreach ($query->rows as $result) {
            $all[] = $result['option_id'];
        }

        $unused = array_diff($all, $used);

        $this->load->model('catalog/option');

        $this->task_storage->clear();

        $index = 1;

        foreach ($unused as $id) {

            $desc = $this->model_catalog_option->getOptionDescriptions($id);

            $info = array(
                'sort' => $index,
                'item_id' => $id,
                'name' => isset($desc[$this->config->get('config_language_id')]['name']) ? $desc[$this->config->get('config_language_id')]['name'] : 'empty',
            );

            if ($this->task_storage->add($info)) {
                $index++;
            }
        }

        $this->task_storage->updateLastScan();

        return array('status' => 'done',);
    }

    /**
     * Scan unused attributes
     * @return array
     */
    private function scanUnusedAttributes()
    {
        $query = $this->db->query("SELECT DISTINCT attribute_id FROM `" . DB_PREFIX . "product_attribute`");

        $used = array();

        foreach ($query->rows as $result) {
            $used[] = $result['attribute_id'];
        }

        $query = $this->db->query("SELECT DISTINCT attribute_id FROM `" . DB_PREFIX . "attribute`");

        $all = array();

        foreach ($query->rows as $result) {
            $all[] = $result['attribute_id'];
        }

        $unused = array_diff($all, $used);

        $this->load->model('catalog/attribute');
        $this->load->model('catalog/attribute_group');

        $this->task_storage->clear();

        $index = 1;

        foreach ($unused as $id) {

            $attribute = $this->model_catalog_attribute->getAttribute($id);

            $info = array(
                'sort' => $index,
                'item_id' => $id,
                'name' => isset($attribute['name']) ? $attribute['name'] : 'empty',
            );

            if ($this->task_storage->add($info)) {
                $index++;
            }
        }

        $this->task_storage->updateLastScan();

        return array('status' => 'done',);
    }

    /**
     * Scan empty attribute groups
     * @return array
     */
    private function scanEmptyAttributeGroups()
    {
        $query = $this->db->query("SELECT DISTINCT attribute_group_id FROM `" . DB_PREFIX . "attribute`");

        $used = array();

        foreach ($query->rows as $result) {
            $used[] = $result['attribute_group_id'];
        }

        $query = $this->db->query("SELECT DISTINCT attribute_group_id FROM `" . DB_PREFIX . "attribute_group`");

        $all = array();

        foreach ($query->rows as $result) {
            $all[] = $result['attribute_group_id'];
        }

        $empty = array_diff($all, $used);

        $this->load->model('catalog/attribute_group');

        $this->task_storage->clear();

        $index = 1;

        foreach ($empty as $id) {

            $group = $this->model_catalog_attribute_group->getAttributeGroup($id);
            $desc_group = $this->model_catalog_attribute_group->getAttributeGroupDescriptions($id);

            $info = array(
                'index' => $index,
                'item_id' => $id,
                'name' => isset($desc_group[$this->config->get('config_language_id')]['name']) ? $desc_group[$this->config->get('config_language_id')]['name'] : 'empty',
            );

            if ($this->task_storage->add($info)) {
                $index++;
            }
        }

        $this->task_storage->updateLastScan();

        return array('status' => 'done',);
    }

    /**
     * Scan empty categories
     * @return array
     */
    private function scanEmptyCategories()
    {
        $query = $this->db->query("SELECT DISTINCT category_id FROM `" . DB_PREFIX . "product_to_category`");

        $used = array();
        foreach ($query->rows as $result) {
            $used[] = $result['category_id'];
        }

        $query = $this->db->query("SELECT DISTINCT category_id FROM `" . DB_PREFIX . "category`");

        $all = array();
        foreach ($query->rows as $result) {
            $all[] = $result['category_id'];
        }

        $query = $this->db->query("SELECT DISTINCT parent_id FROM `" . DB_PREFIX . "category`");

        $is_parent = array();
        foreach ($query->rows as $result) {
            $is_parent[] = $result['parent_id'];
        }

        $empty = array_diff($all, $used);
        $empty = array_diff($empty, $is_parent);

        $this->load->model('catalog/category');

        $this->task_storage->clear();

        $index = 1;

        foreach ($empty as $id) {

            $category = $this->model_catalog_category->getCategory($id);
            $desc = $this->model_catalog_category->getCategoryDescriptions($id);

            $info = array(
                'sort' => $index,
                'item_id' => $id,
                'name' => isset($desc[$this->config->get('config_language_id')]['name']) ? $desc[$this->config->get('config_language_id')]['name'] : 'empty',
            );

            if ($this->task_storage->add($info)) {
                $index++;
            }
        }

        $this->task_storage->updateLastScan();

        return array('status' => 'done',);
    }

    /**
     * Scan products without images
     * @return array
     */
    private function scanProductsWithoutImages()
    {
        $query = $this->db->query("SELECT DISTINCT product_id FROM `" . DB_PREFIX . "product`" . "WHERE image=''");

        $without_main_image = array();
        foreach ($query->rows as $result) {
            $without_main_image[] = $result['product_id'];
        }

        $query = $this->db->query("SELECT DISTINCT product_id FROM `" . DB_PREFIX . "product_image`");

        $all_with_add_image = array();
        foreach ($query->rows as $result) {
            $all_with_add_image[] = $result['product_id'];
        }

        $without_image = array_diff($without_main_image, $all_with_add_image);

        $this->load->model('catalog/product');

        $this->task_storage->clear();

        $index = 1;

        foreach ($without_image as $id) {

            $product = $this->model_catalog_product->getProduct($id);

            $info = array(
                'sort' => $index,
                'item_id' => $id,
                'name' => isset($product['name']) ? $product['name'] : 'empty',
            );

            if ($this->task_storage->add($info)) {
                $index++;
            }
        }

        $this->task_storage->updateLastScan();

        return array('status' => 'done',);
    }
}
