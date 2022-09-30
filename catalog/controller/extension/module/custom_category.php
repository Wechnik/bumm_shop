<?php
class ControllerExtensionModuleCustomCategory extends Controller {
	public function index($module_settings) {

		$this->load->model('tool/image');
		$this->load->model('setting/setting');
		$this->load->model('catalog/category');

		$data['custom_categories'] = array();

		if($module_settings['status'] == 1) {

		    foreach ($module_settings['custom_category'] as $custom_category) {

		        if((int)$custom_category['width'] > 0 && (int)$custom_category['height'] > 0 && (int)$custom_category['status'] == 1) {
                    if (is_file(DIR_IMAGE . $custom_category['image'])) {
                        $image = $this->model_tool_image->resize($custom_category['image'], (int)$custom_category['width'], (int)$custom_category['height']);
                    } else {
                        $image = $this->model_tool_image->resize('no_image.jpg', (int)$custom_category['width'], (int)$custom_category['height']);
                    }
                } else {
		            $image = false;
                }

                $category_info = $this->model_catalog_category->getCategory($custom_category['category_id']);


                $data['custom_categories'][] = [
                    'name' => !empty($custom_category['name']) ? $custom_category['name'] : $category_info['name'],
                    'sort' => $custom_category['sort'],
                    'image' => $image,
                    'href' => $this->url->link('product/category', 'path=' . $this->getPathByCategory($custom_category['category_id']))
                ];


            }

            $data['quantity'] = $module_settings['quantity'];

		    if(count($data['custom_categories']) < 3) {
                $data['quantity'] = 6;
            } else if(count($data['custom_categories']) == 3 ) {
                $data['quantity'] = 4;
            } else if(count($data['custom_categories']) == 4 ) {
                $data['quantity'] = 3;
		    }

            $sort_order = [];

            foreach ($data['custom_categories'] as $key => $value) {
                $sort_order[$key] = $value['sort'];
            }

            array_multisort($sort_order, SORT_ASC, $data['custom_categories']);

            return $this->load->view('extension/module/custom_category', $data);

        }

	}




    private function getPathByCategory($category_id) {
        $category_id = (int)$category_id;
        if ($category_id < 1) return false;

        static $path = null;
        if (!isset($path)) {
            $path = $this->cache->get('category.seopath');
            if (!isset($path)) $path = array();
        }

        if (!isset($path[$category_id])) {
            $max_level = 10;

            $sql = "SELECT CONCAT_WS('_'";
            for ($i = $max_level-1; $i >= 0; --$i) {
                $sql .= ",t$i.category_id";
            }
            $sql .= ") AS path FROM " . DB_PREFIX . "category t0";
            for ($i = 1; $i < $max_level; ++$i) {
                $sql .= " LEFT JOIN " . DB_PREFIX . "category t$i ON (t$i.category_id = t" . ($i-1) . ".parent_id)";
            }
            $sql .= " WHERE t0.category_id = '" . $category_id . "'";

            $query = $this->db->query($sql);

            $path[$category_id] = $query->num_rows ? $query->row['path'] : false;

            $this->cache->set('category.seopath', $path);
        }

        return $path[$category_id];
    }

}