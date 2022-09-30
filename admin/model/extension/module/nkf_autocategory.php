<?php

class ModelExtensionModuleNkfAutoCategory extends Model {

    public function edit($category_id, $data) {
        $this->db->query("DELETE FROM `" . DB_PREFIX . "nkf_autocategory` WHERE category_id='" . (int)$category_id . "'");
        $autocategory_group_id=1;
        if (isset($data['nkf_autocategory']) && is_array($data['nkf_autocategory'])) {
            foreach ($data['nkf_autocategory'] as $nkf_line) {
                foreach ($nkf_line as $nkf_autocategory) {
                    $this->db->query("INSERT INTO `" . DB_PREFIX . "nkf_autocategory` SET
                    `category_id` ='" . (int)$category_id . "',
                    `attribute_id` = '" . (int)$nkf_autocategory['attribute_id'] . "',
                    `autocategory_group_id` = '" . (int)$autocategory_group_id . "',
                    `attribute_not` = '" . (int)$nkf_autocategory['attribute_not'] . "',
                    `attribute_use_from_to` = '" . (int)$nkf_autocategory['attribute_use_from_to'] . "',
                    `attribute_value_from` = '" . (float)$nkf_autocategory['attribute_value_from'] . "',
                    `attribute_value_to` = '" . (float)$nkf_autocategory['attribute_value_to'] . "',
                    `attribute_value` = '" . $this->db->escape($nkf_autocategory['attribute_value']) . "',
                    `price_from` = " . (($nkf_autocategory['price_from'] == '') ? 'NULL' : (float)$nkf_autocategory['price_from']) . ",
                    `price_to` = " . (($nkf_autocategory['price_to'] == '') ? 'NULL' : (float)$nkf_autocategory['price_to']) . ",
                    `is_special` = '" . (int)$nkf_autocategory['is_special'] . "',
                    `manufacturer_id` = '" . (int)$nkf_autocategory['manufacturer_id'] . "',
                    `fcategory_id` = '" . (int)$nkf_autocategory['fcategory_id'] . "',
                    `in_name` = '" . $this->db->escape($nkf_autocategory['in_name']) . "'
                ");
                }
                $autocategory_group_id++;
            }
        }
    }

    public function getAutoCategory($category_id) {
        $a = $this->db->query("SELECT na.*, ad.name attribute_name, m.name manufacturer_name, cd.name fcategory_name FROM `" . DB_PREFIX . "nkf_autocategory` na
            LEFT JOIN " . DB_PREFIX . "attribute_description ad on ad.attribute_id=na.attribute_id AND ad.language_id='" . (int)$this->config->get('config_language_id') . "'
            LEFT JOIN " . DB_PREFIX . "manufacturer m on m.manufacturer_id=na.manufacturer_id
            LEFT JOIN " . DB_PREFIX . "category_description cd on cd.category_id=na.fcategory_id AND cd.language_id= '" . (int)$this->config->get('config_language_id') . "'
            WHERE na.category_id ='" . (int)$category_id . "'
        ");
        $result=array();
        foreach ($a->rows as $b) {
            $result[$b['autocategory_group_id']][]=$b;
        }
        return $result;
    }

    public function run($cid=0) {
        $use_main_category=$this->testUseMainCategory();

        $d = $this->config->get('nkf_autocategory_attr_delimiter');
        $use_like = $this->config->get('nkf_autocategory_use_like');
        $like='';
        if ($use_like)
            $like='%';
        $i = 0;

        if ($cid>0) {
            $cat = $this->db->query("SELECT distinct category_id FROM `" . DB_PREFIX . "nkf_autocategory` WHERE category_id='".(int)$cid."'");
        } else {
            $cat = $this->db->query("SELECT distinct category_id FROM `" . DB_PREFIX . "nkf_autocategory`");
        }


        foreach ($cat->rows as $cat2) {
            if ($use_main_category)
                $this->db->query("delete from " . DB_PREFIX . "product_to_category where main_category=0 AND category_id=" . $cat2['category_id'] . "");
            else
                $this->db->query("delete from " . DB_PREFIX . "product_to_category where category_id=" . $cat2['category_id'] . "");
            $groups = $this->db->query("SELECT distinct autocategory_group_id FROM `" . DB_PREFIX . "nkf_autocategory` WHERE category_id='" . $cat2['category_id'] . "'");;
            foreach ($groups->rows as $group) {
                $products = array();
                $na = $this->db->query("SELECT * FROM `" . DB_PREFIX . "nkf_autocategory` WHERE autocategory_group_id='".$group['autocategory_group_id']."' AND category_id='" . $cat2['category_id'] . "'");
                foreach ($na->rows as $i2 => $r) {
                    $products[$i2]=array();
                    if ($r['category_id'] > 0) {
                        $aq = ' 1=1 ';
                        if ($r['attribute_id'] > 0) {
                            if ($r['attribute_id'] > 0) {
                                if ($r['attribute_use_from_to'] == 1) {
                                    $aq = " (attribute_id='" . (int)$r['attribute_id'] . "' AND (cast(text as DECIMAL(15,4))>=" . (float)$r['attribute_value_from'] . ") AND (cast(text as DECIMAL(15,4))<=" . (float)$r['attribute_value_to'] . ")) ";
                                } else {
                                    $v2=explode($d,$r['attribute_value']);
                                    $or=array();
                                    foreach ($v2 as $v) {
                                        $v=trim($v);
                                        $or2="((text LIKE '%". $like . $this->db->escape($v) . $like. "%') OR 
                                                (text LIKE '%" . $d . $like . $this->db->escape($v) . $like . "') OR 
                                                (text LIKE '" . $like . $this->db->escape($v) . $like . $d . "%" . "'))";
                                        $or2=str_replace('%%','%',$or2);
                                        $or[]=$or2;
                                    }
                                    $or=implode(' OR ',$or);
                                    $aq = " (attribute_id='" . (int)$r['attribute_id'] . "' AND ( ".$or." )) ";
                                }
                            }
                        }
                        $pq = ' 1=1 ';
                        $pq1 = array();
                        if ($r['price_from']!='' || $r['price_to']!='') {
                            if ($r['price_from']!='')
                                $pq1[]="(p.price>=" . (float)$r['price_from'] . ")";
                            if ($r['price_to']!='')
                                $pq1[]="(p.price<=" . (float)$r['price_to'] . ")";
                            $pq = " ( ".implode(' AND', $pq1)." ) ";
                        }
                        $pn = ' 1=1 ';
                        if ($r['in_name'] != '') {
                            $pn = " pd.name like '%" . $this->db->escape($r['in_name']) . "%'";
                        }
                        $ps = ' 1=1 ';
                        if ($r['is_special'] == 1) {
                            $ps = " (exists(select * from " . DB_PREFIX . "product_special ps WHERE product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())))) ";
                        }
                        if ($r['is_special'] == 2) {
                            $ps = " (not exists(select * from " . DB_PREFIX . "product_special ps WHERE product_id = p.product_id AND ((ps.date_start = '0000-00-00' OR ps.date_start < NOW()) AND (ps.date_end = '0000-00-00' OR ps.date_end > NOW())))) ";
                        }
                        $pm = ' 1=1 ';
                        if ($r['manufacturer_id'] > 0) {
                            $pm = " (p.manufacturer_id=" . (int)$r['manufacturer_id'] . ") ";
                        }
                        $pc = ' 1=1 ';
                        if ($r['fcategory_id'] > 0) {
                            $pc = " (cp.path_id = '" . (int)$r['fcategory_id'] . "') ";
                        }
                        $not='';
                        if ($r['attribute_not'] == 1) {
                            $not = " NOT ";
                        }
                        $sql2="
                        select distinct p2.product_id from " . DB_PREFIX . "product p2 WHERE p2.product_id ".$not." IN (
                        select p.product_id from " . DB_PREFIX . "product p
                        LEFT JOIN " . DB_PREFIX . "product_attribute pa on p.product_id=pa.product_id
                        LEFT JOIN " . DB_PREFIX . "product_to_category p2c on (p2c.product_id=p.product_id)
                        LEFT JOIN " . DB_PREFIX . "category_path cp  ON (cp.category_id = p2c.category_id)
                        JOIN " . DB_PREFIX . "product_description pd on pd.product_id=p.product_id  
                        WHERE (
                            " . $aq . " AND
                            " . $pq . " AND
                            " . $pn . " AND
                            " . $pm . " AND
                            " . $pc . " AND
                            " . $ps . "
                            )
                        )    
                        ";
                        $p = $this->db->query($sql2);
                        foreach ($p->rows as $p1) {
                            $products[$i2][] = $p1['product_id'];
                        }
                    }
                }
                $c = count($products);
                if ($c > 0) {
                    if ($c>1) {
                        $products2 = $products[0];
                        for ($j = 1; $j < $c; $j++) {
                            $products2 = array_intersect($products2, $products[$j]);
                        }
                    } else {
                        $products2 = $products[0];
                    }
                    foreach ($products2 as $p1) {
                        $a=$this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE
                            product_id='" . $p1 . "' AND
                            category_id='" . $r['category_id'] . "'
                        ");
                        if ($a->num_rows==0) {
                            $this->db->query("REPLACE INTO " . DB_PREFIX . "product_to_category SET
                                product_id='" . $p1 . "',
                                category_id='" . $r['category_id'] . "'
                            ");
                        }
                        $i++;
                    }
                }
            }
        }
        return $i;
    }

    public function getManufacturers($data = array()) {
        $sql = "SELECT c.manufacturer_id, md.name, c.sort_order FROM " . DB_PREFIX . "manufacturer c LEFT JOIN " . DB_PREFIX . "manufacturer_description md ON (c.manufacturer_id = md.manufacturer_id) WHERE md.language_id = '" . (int)$this->config->get('config_language_id') . "'";



        if (!empty($data['filter_name'])) {
            $sql .= " AND md.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
        }

        $sort_data = array(
            'md.name',
            'sort_order'
        );

        if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
            $sql .= " ORDER BY " . $data['sort'];
        } else {
            $sql .= " ORDER BY name";
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

    public function testUseMainCategory() {
        $res = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_to_category` LIKE 'main_category'");
        if($res->num_rows != 0) {
            return true;
        } else {
            return false;
        }
    }


}