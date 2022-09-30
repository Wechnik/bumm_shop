<?php
class ControllerExtensionModuleCustomBanner extends Controller {
	public function index() {

        $data['banner_images'] = [];

        foreach ($this->config->get('custom_banner_banner_image') as $data_banner_k => $data_banner) {

            if(is_numeric($data_banner_k)) {

                if ($data_banner['image']) {
                    $image = $this->model_tool_image->myResize($data_banner['image'], (int)$data_banner['width'], (int)$data_banner['height']);
                } else {
                    $image = $this->model_tool_image->myResize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                $data['banner_images'][$data_banner['sort_order']] = [
                    'image' => $image,
                    'width' => (int)$data_banner['width'],
                    'height' => (int)$data_banner['height'],
                ];

            }

            else
            {
                $data['image_style'] = $data_banner['image_style'];
            }

        }

        ksort($data['banner_images']);

        $data['banner_images'] = array_values($data['banner_images']);



//        echo '<pre>'; print_r($image); die;

		return $this->load->view('extension/module/custom_banner', $data);
	}
}