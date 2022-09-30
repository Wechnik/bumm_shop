<?php
class ControllerStartupSeoPro extends Controller {
	private $cache_data = null;

	public function __construct($registry) {
		parent::__construct($registry);
		$this->cache_data = $this->cache->get('seo_pro');

//        $this->cache->delete('seo_pro');
//        echo '<pre>'; var_dump($this->request->get); die;

        if (!$this->cache_data || isset($this->request->get['car'])) {

        $car = isset($this->request->get['car']) ? $this->request->get['car'] : false;
        $mark = isset($this->request->get['mark']) ? $this->request->get['mark'] : false;
        $model = isset($this->request->get['model']) ? $this->request->get['model'] : false;
        $generation = isset($this->request->get['generation']) ? $this->request->get['generation'] : false;

        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'car=" . (int)$car . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'mark=" . (int)$mark . "'");
        $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'model=" . (int)$model . "'");
        $this->load->model('extension/module/smart_filter');

        $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'car=" . (int)$car . "', keyword = '" . (int)$car . "'");

        $car_mark = $this->model_extension_module_smart_filter->getCarMark($mark);
        if(isset($car_mark['car_mark'])) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'mark=" . (int)$mark . "', keyword = '" . $this->db->escape($this->translate->getLat($car_mark['car_mark'])) . "'");
		}

        $car_model = $this->model_extension_module_smart_filter->getCarModel($model);
        if(isset($car_model['car_model'])) {
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'model=" . (int)$model . "', keyword = '" . $this->db->escape($this->translate->getLat($car_model['car_model'])) . "'");
        }

        if($generation) {
            $this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'generation=" . (int)$generation . "'");
            $this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'generation=" . (int)$generation . "', keyword = '" . $this->db->escape($this->translate->getLat($this->model_extension_module_smart_filter->getCarGeneration($generation)['car_generation'])) . "'");
        }
			$query = $this->db->query("SELECT LOWER(`keyword`) as 'keyword', `query` FROM " . DB_PREFIX . "url_alias ORDER BY url_alias_id");
			$this->cache_data = array();
			foreach ($query->rows as $row) {
				if (isset($this->cache_data['keywords'][$row['keyword']])){
					$this->cache_data['keywords'][$row['query']] = $this->cache_data['keywords'][$row['keyword']];
					continue;
				}
				$this->cache_data['keywords'][$row['keyword']] = $row['query'];
				$this->cache_data['queries'][$row['query']] = $row['keyword'];
			}
			$this->cache->set('seo_pro', $this->cache_data);
		}


	}

	public function index() {


		// Add rewrite to url class
		if ($this->config->get('config_seo_url')) {
			$this->url->addRewrite($this);
		} else {
			return;
		}


		// Decode URL
		if (!isset($this->request->get['_route_'])) {
			$this->validate();
		} else {
			$route_ = $route = $this->request->get['_route_'];
			unset($this->request->get['_route_']);

//            if($this->session->data['smartfilter']) {
//                $parts = explode('-', trim(utf8_strtolower($route), '/'));
//            } else if ($this->session->data['cat_smartfilter']) {
//
//                $cat_parts = explode('/', trim(utf8_strtolower($route), '/'));
//
//                $cat_last_part_arr = explode('-', (array_pop($cat_parts)));
//
//                $parts = array_merge($cat_parts, $cat_last_part_arr);
//            } else {
                $parts = explode('/', trim(utf8_strtolower($route), '/'));
//            }


            $smart_part = end($parts);

            if(is_numeric(substr($smart_part, 0, 4)) && substr($smart_part, 4, 1) == '-') {
                if($parts > 1){
                    array_pop($parts);
                    $parts = array_merge($parts, explode('-', trim(utf8_strtolower($smart_part), '/')));
                } else {
                    $parts = explode('-', trim(utf8_strtolower($route), '/'));
                }
            }

			list($last_part) = explode('.', array_pop($parts));
			array_push($parts, $last_part);

			$rows = array();
			foreach ($parts as $keyword) {
				if (isset($this->cache_data['keywords'][$keyword])) {
					$rows[] = array('keyword' => $keyword, 'query' => $this->cache_data['keywords'][$keyword]);
				}
			}


			if (isset($this->cache_data['keywords'][$route])){
				$keyword = $route;
				$parts = array($keyword);
				$rows = array(array('keyword' => $keyword, 'query' => $this->cache_data['keywords'][$keyword]));
			}

			if (count($rows) == sizeof($parts)) {
				$queries = array();
				foreach ($rows as $row) {
					$queries[utf8_strtolower($row['keyword'])] = $row['query'];
				}

				reset($parts);
				foreach ($parts as $part) {
					if(!isset($queries[$part])) return false;
					$url = explode('=', $queries[$part], 2);

					if ($url[0] == 'category_id') {
						if (!isset($this->request->get['path'])) {
							$this->request->get['path'] = $url[1];
						} else {
							$this->request->get['path'] .= '_' . $url[1];
						}
					} elseif (count($url) > 1) {
						$this->request->get[$url[0]] = $url[1];
					}
				}
			} else {
				$this->request->get['route'] = 'error/not_found';
			}

			if (isset($this->request->get['product_id'])) {
				$this->request->get['route'] = 'product/product';
				if (!isset($this->request->get['path'])) {
					$path = $this->getPathByProduct($this->request->get['product_id']);
					if ($path) $this->request->get['path'] = $path;
				}
			} elseif (isset($this->request->get['path']) && isset($this->request->get['car'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['path'])) {
				$this->request->get['route'] = 'product/category';
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$this->request->get['route'] = 'product/manufacturer/info';
			} elseif (isset($this->request->get['information_id'])) {
				$this->request->get['route'] = 'information/information';
			} elseif (isset($this->request->get['news_id'])) {
                $this->request->get['route'] = 'information/news/info';
			} elseif (isset($this->request->get['car'])) {
				$this->request->get['route'] = 'product/smartfilter';
			} elseif(isset($this->cache_data['queries'][$route_]) && isset($this->request->server['SERVER_PROTOCOL'])) {
					header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');
					$this->response->redirect($this->cache_data['queries'][$route_], 301);
			} else {
				if (isset($queries[$parts[0]])) {
					$this->request->get['route'] = $queries[$parts[0]];
				}
			}


			$this->validate();

			if (isset($this->request->get['route'])) {
				return new Action($this->request->get['route']);
			}
		}
	}

	public function rewrite($link) {

		if (!$this->config->get('config_seo_url')) return $link;

		$seo_url = '';

		$component = parse_url(str_replace('&amp;', '&', $link));

		$data = array();
		parse_str($component['query'], $data);

		$route = $data['route'];

		unset($data['route']);

		switch ($route) {
			case 'product/product':
				if (isset($data['product_id'])) {
					$tmp = $data;
					$data = array();
					if ($this->config->get('config_seo_url_include_path')) {
						$data['path'] = $this->getPathByProduct($tmp['product_id']);
						if (!$data['path']) return $link;
					}
					$data['product_id'] = $tmp['product_id'];
					$seo_pro_utm = preg_replace('~\r?\n~', "\n", $this->config->get('config_seo_pro_utm'));
					$allowed_parameters = explode("\n", $seo_pro_utm);
					foreach($allowed_parameters as $ap) {
						if (isset($tmp[trim($ap)])) {
							$data[trim($ap)] = $tmp[trim($ap)];
						}
					}
				}
				break;

			case 'product/smartfilter':
			case 'otaupdater/android':

			case 'product/category':
				if (isset($data['path'])) {
					$category = explode('_', $data['path']);
					$category = end($category);
					$data['path'] = $this->getPathByCategory($category);
					if (!$data['path']) return $link;
				}
				break;

			case 'product/product/review':
			case 'information/information/agree':
				return $link;
				break;

			default:
				break;
		}


		if ($component['scheme'] == 'https') {
			$link = $this->config->get('config_ssl');
		} else {
			$link = $this->config->get('config_url');
		}

		$link .= 'index.php?route=' . $route;

		if (count($data)) {
			$link .= '&amp;' . urldecode(http_build_query($data, '', '&amp;'));
		}

        $smart_query = false;
        $cat_smart_query = false;


		$queries = array();
		if(!in_array($route, array('product/search', 'product/stat_seo_page', 'otaupdater/android'))) {

            if(isset($data['car'])) {
                if(isset($data['path'])) {
                    $smart_query = false;
                    $cat_smart_query = true;
                } else {
                    $smart_query = true;
                }
            }

		foreach ($data as $key => $value) {
				switch ($key) {
					case 'product_id':
					case 'manufacturer_id':
					case 'category_id':
					case 'information_id':
                    case 'news_id':
					case 'order_id':
						$queries[] = $key . '=' . $value;
						unset($data[$key]);
						$postfix = 1;
						break;

					case 'path':
						$categories = explode('_', $value);
						foreach ($categories as $category) {
							$queries[] = 'category_id=' . $category;
						}
						unset($data[$key]);
						break;

					case 'car':
							$queries['car'] = 'car=' . $value;
						unset($data[$key]);
						break;

					case 'mark':
							$queries['mark'] = 'mark=' . $value;
						unset($data[$key]);
						break;

					case 'model':
							$queries['model'] = 'model=' . $value;
						unset($data[$key]);
						break;

					case 'generation':
							$queries['generation'] = 'generation=' . $value;
						unset($data[$key]);
						break;

					default:
						break;
				}
			}
		}

		if(empty($queries)) {
			$queries[] = $route;
		}
		$rows = array();

		foreach($queries as $query_k => $query) {
			if(isset($this->cache_data['queries'][$query])) {
				$rows[$query_k] = array('query' => $query, 'keyword' => $this->cache_data['queries'][$query]);
			}
		}


		if(count($rows) == count($queries)) {
			$aliases = array();
			foreach($rows as $row) {
				$aliases[$row['query']] = $row['keyword'];
			}
//

            if(($smart_query)) {
                foreach($queries as $q_k => $query) {
                    $seo_url .= ($q_k == 'car') ? '' . rawurlencode($this->translate->getLat($aliases[$query])) : '-' . rawurlencode($this->translate->getLat($aliases[$query]));
                }
            } else {

                if($cat_smart_query) {
                    foreach($queries as $q_k => $query) {
                        if(is_numeric($q_k)) {
                            $seo_url .= '/' . rawurlencode($this->translate->getLat($aliases[$query]));
                        } else {
                            $seo_url .= ($q_k == 'car') ? '/' . rawurlencode($this->translate->getLat($aliases[$query])) : '-' . rawurlencode($this->translate->getLat($aliases[$query]));
                        }
                    }
                } else {
                    foreach($queries as $query) {
                        $seo_url .= '/' . rawurlencode(($aliases[$query]));
                    }
                }
            }

		}



		if ($seo_url == '') return $link;

		$seo_url = trim($seo_url, '/');

		if ($component['scheme'] == 'https') {
			$seo_url = $this->config->get('config_ssl') . $seo_url;
		} else {
			$seo_url = $this->config->get('config_url') . $seo_url;
		}

		if (isset($postfix)) {
			$seo_url .= trim($this->config->get('config_seo_url_postfix'));
		} else {
			$seo_url .= '/';
		}

		if(substr($seo_url, -2) == '//') {
			$seo_url = substr($seo_url, 0, -1);
		}

		if (count($data)) {
			$seo_url .= '?' . urldecode(http_build_query($data, '', '&amp;'));
		}

		return $seo_url;
	}

	private function getPathByProduct($product_id) {
		$product_id = (int)$product_id;
		if ($product_id < 1) return false;

		static $path = null;
		if (!isset($path)) {
			$path = $this->cache->get('product.seopath');
			if (!isset($path)) $path = array();
		}

		if (!isset($path[$product_id])) {
			$query = $this->db->query("SELECT category_id FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "' ORDER BY main_category DESC LIMIT 1");

			$path[$product_id] = $this->getPathByCategory($query->num_rows ? (int)$query->row['category_id'] : 0);

			$this->cache->set('product.seopath', $path);
		}

		return $path[$product_id];
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

	private function validate() {



        if(isset($this->request->get['route']) && $this->request->get['route'] == 'product/smartfilter') {
            $this->session->data['smartfilter'] = true;
        } else {
            $this->session->data['smartfilter'] = false;
        }

        if(isset($this->request->get['route']) && $this->request->get['route'] == 'product/category') {
            $this->session->data['cat_smartfilter'] = true;
        } else {
            $this->session->data['cat_smartfilter'] = false;
        }


		if (isset($this->request->get['route']) && $this->request->get['route'] == 'error/not_found') {
			return;
		}
		if(empty($this->request->get['route'])) {
			$this->request->get['route'] = 'common/home';
		}

		if (isset($this->request->server['HTTP_X_REQUESTED_WITH']) && strtolower($this->request->server['HTTP_X_REQUESTED_WITH']) == 'xmlhttprequest') {
			return;
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$config_ssl = substr($this->config->get('config_ssl'), 0, $this->strpos_offset('/', $this->config->get('config_ssl'), 3) + 1);
			$url = str_replace('&amp;', '&', $config_ssl . ltrim($this->request->server['REQUEST_URI'], '/'));
			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), true));
		} else {
			$config_url = substr($this->config->get('config_url'), 0, $this->strpos_offset('/', $this->config->get('config_url'), 3) + 1);
			$url = str_replace('&amp;', '&', $config_url . ltrim($this->request->server['REQUEST_URI'], '/'));

			$seo = str_replace('&amp;', '&', $this->url->link($this->request->get['route'], $this->getQueryString(array('route')), false));

		}

		if (rawurldecode($url) != rawurldecode($seo) && isset($this->request->server['SERVER_PROTOCOL'])) {
			header($this->request->server['SERVER_PROTOCOL'] . ' 301 Moved Permanently');

			$this->response->redirect($seo, 301);
		}
	}

	private function strpos_offset($needle, $haystack, $occurrence) {
		// explode the haystack
		$arr = explode($needle, $haystack);
		// check the needle is not out of bounds
		switch($occurrence) {
			case $occurrence == 0:
				return false;
			case $occurrence > max(array_keys($arr)):
				return false;
			default:
				return strlen(implode($needle, array_slice($arr, 0, $occurrence)));
		}
	}

	private function getQueryString($exclude = array()) {
		if (!is_array($exclude)) {
			$exclude = array();
			}

		return urldecode(http_build_query(array_diff_key($this->request->get, array_flip($exclude))));
		}
	}
?>
