<?php
/*
    @Author: Parfenov A.V. <dziro@mail.ru> Skype: dziroo | Telegram: @Dzirosh
*/

error_reporting(E_ALL);
ini_set('display_errors', 'on');
set_time_limit(0);

class ControllerExtensionFeedYandexTurbo extends Controller {
	protected
		$ymlLimit = 30000,
		$rssPackLimit = 1000;

	public function index()
	{
		if (!$this->config->get('yandex_turbo_status')) return false;

		$this->load->model('extension/feed/yandex_turbo');

		if (isset($this->request->get['rss'])) {
			$this->rss();
		} else {
			$this->yml();
		}
	}

	public function rss()
	{
		$page = isset($this->request->get['page']) ? (int)$this->request->get['page'] : 1;

		$filter = array(
			'offset' => ($page - 1) * $this->rssPackLimit,
			'limit'  => $this->rssPackLimit
		);

		$link = rtrim(HTTPS_SERVER, '/');
		$lang = $this->config->get('config_language');
		$analytics = '';

		$data = $this->model_extension_feed_yandex_turbo->articles($filter);

		$out =<<<__END
<rss
	xmlns:yandex="http://news.yandex.ru"
	xmlns:media="http://search.yahoo.com/mrss/"
	xmlns:turbo="http://turbo.yandex.ru"
	version="2.0">
	<channel>
		<title>{$this->config->get('config_title')}</title>
		<link>$link</link>
		<description>{$this->config->get('config_meta_description')}</description>
		<language>$lang</language>
		$analytics
__END;

		foreach ($data as $item) {
			$source = '';//"\n<turbo:source></turbo:source>\n";
			$link = $this->url->link('information/information', 'information_id=' .  $item['information_id']);
			$content = html_entity_decode($item['description']);

			$out .=<<<__END
		<item turbo="true">
			<link>$link</link>
			$source
			<turbo:topic>{$item['title']}</turbo:topic>
			<turbo:content><![CDATA[
				<h1>{$item['seo_h1']}</h1>
				$content
			]]></turbo:content>
__END;

			$out .=<<<__END
		</item>            
__END;
		}

		$out .=<<<__END
	</channel>
</rss>
__END;

		$this->response->addHeader('Content-type: text/html; charset=utf-8');
		$this->response->setOutput($out);
	}

	public function yml()
	{
		$this->load->model('extension/feed/yandex_turbo');
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('catalog/manufacturer');
		$this->load->model('tool/image');
        $this->load->model('setting/setting');

        $settings = $this->model_setting_setting->getSetting('yandex_turbo');

        if (!$settings['yandex_turbo_status']) return false;

		$page = !empty($this->request->get['page']) ? (int) $this->request->get['page'] : 1;
		$start = ($page - 1) * $this->ymlLimit;

		$currencyCode = $this->config->get('config_currency');
		$currencyValue = $this->currency->getValue($currencyCode);

        $yandexTurboCategories = $this->model_extension_feed_yandex_turbo->getYaCategories();

		$cids = array(); 
		foreach ($yandexTurboCategories as $category) $cids[] = $category['category_id'];

		$filter = array(
			'filter_category_id' => $cids,
			'start'              => $start,
			'limit'              => $this->ymlLimit
		);

		$products = $this->model_extension_feed_yandex_turbo->getProducts($filter);

		$date = date('Y-m-d H:i');
		$shopURL = rtrim(HTTPS_SERVER, '/');

		$out = "<?xml version=\"1.0\" encoding=\"UTF-8\"?><!DOCTYPE yml_catalog SYSTEM \"shops.dtd\">\n";
		$out .=<<<__END
<yml_catalog date="$date">
  <shop>
	<name>{$this->config->get('config_name')}</name>
	<company>{$this->config->get('config_owner')}</company>
	<url>$shopURL</url>

	<currencies>
	  <currency id="$currencyCode" rate="1"/>
	</currencies>
	<categories>
__END;

        $allcategories = $this->model_extension_feed_yandex_turbo->getCategories();

        foreach ($allcategories as $category) {
			if ($category['parent_id']) $out .= "\n      ".'<category id="'.$category['category_id'].'" parentId="'.$category['parent_id'].'">'.$category['name'].'</category>';
			else $out .= "\n      ".'<category id="'.$category['category_id'].'">'.$category['name'].'</category>';
		}

		$out .= "\n    </categories>\n<offers>";

        unset($allcategories);

		$existsIds = array();
		$nomf = $nocat = 0;
		foreach ($products as $product) {
            if (!$product['status']) continue;
            if (!$this->config->get('yandex_turbo_qty0') && $product['quantity'] <= 0) continue;
			if (in_array($product['product_id'], $existsIds)) continue;

            $model = $product['name'];
            if (!$model) $model = $product['model'];
            if (!$model) $model = $product['sku'];

            if (!$model) continue;

            $model = cleanStr($model);

			$categories = $this->model_catalog_product->getCategories($product['product_id']);

			if (!$categories) {
				$nocat++;
				continue;
			}

			$category = $this->model_extension_feed_yandex_turbo->getProductCategory($product['product_id']);
			$category = $category[count($category)-1];

            if (!empty($settings['yandex_turbo_vendor'])) $vendor = $settings['yandex_turbo_vendor'];
            else {
                if (!$product['manufacturer_id']) {
                    $nomf++;
                    continue;
                }

                $manufacturer = $this->model_catalog_manufacturer->getManufacturer($product['manufacturer_id']);
                $vendor = $manufacturer['name'];
            }

			$categoriesStr = '';
			foreach ($categories as $item) {
				$categoriesStr .= "<categoryId>".$item['category_id']."</categoryId>\n";
			}

			$url = $this->url->link('product/product', 'product_id=' . $product['product_id']);

			$oldprice = '';
			if ($product['special']) {
				$price = $this->tax->calculate($product['special'], $product['tax_class_id']);
				$oldprice = '<oldprice>'.$this->tax->calculate($product['price'], $product['tax_class_id']).'</oldprice>';
			} else {
				$price = $this->tax->calculate($product['price'], $product['tax_class_id']);
			}

            $weight = '';
/*
			if ((float)$product['weight']) $weight = '<weight unit="'.$product['weight_unit'].'">'.(float)$product['weight'].'</weight>';
			else $weight = '';
*/

			if ((float)$product['length'] && (float)$product['width'] && (float)$product['height']) {
                $length = (float)$product['length'];
                $width  = (float)$product['width'];
                $height = (float)$product['height'];

                switch (mb_strtolower($product['length_unit'])) {
                    case 'мм':
                    case 'мм.':
                        $length = round($length / 10, 3);
                        $width = round($width / 10, 3);
                        $height = round($height / 10, 3);
                        break;
                    case 'м':
                    case 'м.':
                        $length = round($length * 100, 3);
                        $width = round($width * 100, 3);
                        $height = round($height * 100, 3);
                        break;
                }

				$dimensions = "<dimensions>$length/$width/$height</dimensions>";

			} else $dimensions = '';

			$params = '';
			$options = $this->model_extension_feed_yandex_turbo->getProductOptions($product['product_id']);

			foreach ($options as $option) {
				$optionName = $option['name'];
                $unit = '';

                if (in_array(mb_strtolower($optionName), array('ширина', 'width', 'глубина', 'depth', 'высота', 'height', 'диаметр', 'diameter'))) {
                    $unit = ' unit="'.$product['length_unit'].'"';
                }

                if (is_array($option['option_value'])) {
                    foreach ($option['option_value'] as $oval) {
                        $optionVal = cleanStr(htmlentities($oval['name'], ENT_IGNORE|ENT_DISALLOWED|ENT_SUBSTITUTE, 'UTF-8'));

                        $params .= "\n      <param name=\"$optionName\"$unit>$optionVal</param>";
                    }
                } else {
                    $optionVal = cleanStr(htmlentities($option['option_value'], ENT_IGNORE|ENT_DISALLOWED|ENT_SUBSTITUTE, 'UTF-8'));

                    $params .= "\n      <param name=\"$optionName\"$unit>$optionVal</param>";
                }
            }

            if ((float)$product['weight']) $params .= "\n      <param name=\"Вес\" unit=\"{$product['weight_unit']}\">".(float)$product['weight']."</param>";

            if (!empty($settings['yandex_turbo_attributes']) || !isset($settings['yandex_turbo_attributes'])) {
                $attributes = $this->model_catalog_product->getProductAttributes($product['product_id']);

                foreach ($attributes as $attr) {
                    foreach ($attr['attribute'] as $item) {
                        $params .= "\n      <param name=\"{$attr['name']} ({$item['name']})\">".cleanStr(htmlentities($item['text'], ENT_IGNORE|ENT_DISALLOWED|ENT_SUBSTITUTE, 'UTF-8'))."</param>";
                    }
                }
            }

            $image = '';
            if ($product['image']) {
                $image = $this->getImageUrl($product['image']);
                $image = "<picture>$image</picture>";
            }

            $images = $this->model_extension_feed_yandex_turbo->productImages($product['product_id']);
            foreach ($images as $img) $image .= '<picture>'.$this->getImageUrl($img).'</picture>';

            $description = cleanStr(htmlentities(html_entity_decode($product['description'])));
            if (!empty($settings['yandex_turbo_striptags'])) $description = strip_tags(html_entity_decode(cleanStr($description)));

            if ($description) $description = "
      <description>
      <![CDATA[$description]]>
      </description>
";

            $typePrefix = $delivery = $pickup = $manufacturer_warranty = $adult = '';

            if (!empty($settings['yandex_turbo_typePrefix']) && !empty($category['name'])) $typePrefix = '<typePrefix>'.$category['name'].'</typePrefix>';
            if (!empty($settings['yandex_turbo_delivery'])) $delivery = '<delivery>true</delivery>';
            if (!empty($settings['yandex_turbo_pickup'])) $pickup = '<pickup>true</pickup>';
            if (!empty($settings['yandex_turbo_manufacturer_warranty'])) $manufacturer_warranty = '<manufacturer_warranty>true</manufacturer_warranty>';
            if (!empty($settings['yandex_turbo_adult'])) $adult = '<adult>true</adult>';

            if ($delivery && !$pickup) $pickup = '<pickup>false</pickup>';
            elseif (!$delivery && $pickup) $delivery = '<delivery>false</delivery>';
            elseif (!($delivery || $pickup)) $pickup = $delivery = '<delivery>false</delivery>';

			$out .=<<<__END
	<offer id="{$product['product_id']}" type="vendor.model">
	  $typePrefix
      <vendor>$vendor</vendor>
	  <model>$model</model>
	  <url>$url</url>
	  <price>$price</price>$oldprice
	  <currencyId>$currencyCode</currencyId>
	  $categoriesStr
      $image
	  $description
	  $weight$dimensions$params
      $delivery
      $pickup
      $manufacturer_warranty
      $adult
	</offer>
__END;
		}

		$out .= "</offers>\n  </shop>\n</yml_catalog>";
		//$out .= "<!--\nБез категорий: $nocat\nБез производителя $nomf\n-->";

        file_put_contents($_SERVER['DOCUMENT_ROOT'].'/yandex-turbo'.($page > 1 ? $page : '').'.xml', $out);

        if ($this->config->get('yandex_turbo_echo')) {
		    $this->response->addHeader('Content-type: text/xml; charset=utf-8');
		    $this->response->setOutput($out);
        }
	}

	public function addtocart()
	{
		$this->language->load('checkout/cart');
		
		$json = array();
		
		if (isset($this->request->request['id'])) {
			$product_id = $this->request->request['id'];
		} else {
			$product_id = 0;
		}
		
		$this->load->model('catalog/product');
						
		$product_info = $this->model_catalog_product->getProduct($product_id);
		
		if ($product_info) {
			$currencyCode = $this->config->get('config_currency');
			
			if (isset($this->request->request['quantity'])) {
				$quantity = $this->request->request['quantity'];
			} else {
				$quantity = 1;
			}
														
			if (isset($this->request->request['option'])) {
				$option = array_filter($this->request->request['option']);
			} else {
				$option = array();    
			}
			
			$product_options = $this->model_catalog_product->getProductOptions($product_id);
			
			foreach ($product_options as $product_option) {
				if ($product_option['required'] && empty($option[$product_option['product_option_id']])) {
					$json['error']['option'][$product_option['product_option_id']] = sprintf($this->language->get('error_required'), $product_option['name']);
				}
			}
			
			if (!$json) {
				$this->cart->add($product_id, $quantity, $option);

				$json['success'] = sprintf($this->language->get('text_success'), $this->url->link('product/product', 'product_id=' . $product_id), $product_info['name'], $this->url->link('checkout/cart'));
				
				unset($this->session->data['shipping_method']);
				unset($this->session->data['shipping_methods']);
				unset($this->session->data['payment_method']);
				unset($this->session->data['payment_methods']);
				
				// Totals
				$this->load->model('extension/extension');
				
				$total_data = array();                    
				$total = 0;
				$taxes = $this->cart->getTaxes();
				
				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$sort_order = array(); 
					
					$results = $this->model_extension_extension->getExtensions('total');
					
					foreach ($results as $key => $value) {
						$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
					}
					
					array_multisort($sort_order, SORT_ASC, $results);
					
					foreach ($results as $result) {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('extension/total/' . $result['code']);
				
							@$this->{'model_extension_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
						}
						
						$sort_order = array(); 
					  
						foreach ($total_data as $key => $value) {
							$sort_order[$key] = $value['sort_order'];
						}
			
						array_multisort($sort_order, SORT_ASC, $total_data);            
					}
				}

				$json['total'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total, $currencyCode));

				$this->response->redirect($this->url->link('checkout/checkout'));
			}
		}

		$this->response->redirect(str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $product_id)));
	}

	protected function getPath($parent_id, $current_path = '')
	{
		$category_info = $this->model_catalog_category->getCategory($parent_id);

		if ($category_info) {
			if (!$current_path) {
				$new_path = $category_info['category_id'];
			} else {
				$new_path = $category_info['category_id'] . '_' . $current_path;
			}

			$path = $this->getPath($category_info['parent_id'], $new_path);

			if ($path) {
				return $path;
			} else {
				return $new_path;
			}
		}
	}

	protected function getImageUrl($file) {
		$parts = explode('/', $file);

		$url = implode('/', array_map('rawurlencode', $parts));

		return HTTPS_SERVER . 'image/' . $url;
	}
}

function cleanStr($str) {
    $rtags = [
        'deg', 'plusmn', 'Phi', 'times', 'Omega', 'rdquo', 'hellip', 'laquo', 
        'raquo', 'ge', 'Ntilde', 'ETH', 'frac14', 'micro', 'frac12', 'cedil',
        'ordm', 'ndash', 'Oslash', 'rsquo', 'le', 'trade'
    ];

    $str = trim(preg_replace('#[\x00-\x08\x0B-\x0C\x0E-\x1F]+#imsu', '', $str));
    $str = trim(preg_replace('#&([^;\#]*[\s\n\r\z]+)#imsu', '&amp;$1', $str));
    $str = trim(preg_replace('#&([^;\#]*)$#imsu', '&amp;$1', $str));
    $str = str_replace('&mdash;', '-', $str);

    foreach ($rtags as $tag) $str = str_replace('&'.$tag.';', '', $str);

    return $str;
}
