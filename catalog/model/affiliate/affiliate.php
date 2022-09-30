<?php
class ModelAffiliateAffiliate extends Model {
	public function addAffiliate($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "affiliate SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($data['password'])))) . "', company = '" . $this->db->escape($data['company']) . "', website = '" . $this->db->escape($data['website']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "', code = '" . $this->db->escape(uniqid()) . "', commission = '" . (float)$this->config->get('config_affiliate_commission') . "', tax = '" . $this->db->escape($data['tax']) . "', payment = '" . $this->db->escape($data['payment']) . "', cheque = '" . $this->db->escape($data['cheque']) . "', paypal = '" . $this->db->escape($data['paypal']) . "', bank_name = '" . $this->db->escape($data['bank_name']) . "', bank_branch_number = '" . $this->db->escape($data['bank_branch_number']) . "', bank_swift_code = '" . $this->db->escape($data['bank_swift_code']) . "', bank_account_name = '" . $this->db->escape($data['bank_account_name']) . "', bank_account_number = '" . $this->db->escape($data['bank_account_number']) . "', status = '0', approved = '" . (int)!$this->config->get('config_affiliate_approval') . "', date_added = NOW()");

		$affiliate_id = $this->db->getLastId();

		$this->load->language('mail/affiliate');

		$subject = sprintf($this->language->get('text_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));

		$message  = sprintf($this->language->get('text_welcome'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')) . "\n\n";

		if (!$this->config->get('config_affiliate_approval')) {
			$message .= $this->language->get('text_login') . "\n";
		} else {
			$message .= $this->language->get('text_approval') . "\n";
		}

		$message .= $this->url->link('affiliate/login', '', true) . "\n\n";
		$message .= $this->language->get('text_services') . "\n\n";
		$message .= $this->language->get('text_thanks') . "\n";
		$message .= html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8');

		$mail = new Mail();
		$mail->protocol = $this->config->get('config_mail_protocol');
		$mail->parameter = $this->config->get('config_mail_parameter');
		$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
		$mail->smtp_username = $this->config->get('config_mail_smtp_username');
		$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
		$mail->smtp_port = $this->config->get('config_mail_smtp_port');
		$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

		$mail->setTo($this->request->post['email']);
		$mail->setFrom($this->config->get('config_email'));
		$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
		$mail->setSubject($subject);
		$mail->setText($message);
		$mail->send();

		// Send to main admin email if new affiliate email is enabled
		if (in_array('affiliate', (array)$this->config->get('config_mail_alert'))) {
			$message  = $this->language->get('text_signup') . "\n\n";
			$message .= $this->language->get('text_store') . ' ' . html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8') . "\n";
			$message .= $this->language->get('text_firstname') . ' ' . $data['firstname'] . "\n";
			$message .= $this->language->get('text_lastname') . ' ' . $data['lastname'] . "\n";

			if ($data['website']) {
				$message .= $this->language->get('text_website') . ' ' . $data['website'] . "\n";
			}

			if ($data['company']) {
				$message .= $this->language->get('text_company') . ' '  . $data['company'] . "\n";
			}

			$message .= $this->language->get('text_email') . ' '  .  $data['email'] . "\n";
			$message .= $this->language->get('text_telephone') . ' ' . $data['telephone'] . "\n";

			$mail->setTo($this->config->get('config_email'));
			$mail->setSubject(html_entity_decode($this->language->get('text_new_affiliate'), ENT_QUOTES, 'UTF-8'));
			$mail->setText($message);
			$mail->send();

			// Send to additional alert emails if new affiliate email is enabled
			$emails = explode(',', $this->config->get('config_alert_email'));

			foreach ($emails as $email) {
				if (utf8_strlen($email) > 0 && preg_match($this->config->get('config_mail_regexp'), $email)) {
					$mail->setTo($email);
					$mail->send();
				}
			}
		}

		return $affiliate_id;
	}

	public function editAffiliate($data) {
		$affiliate_id = $this->affiliate->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET firstname = '" . $this->db->escape($data['firstname']) . "', lastname = '" . $this->db->escape($data['lastname']) . "', email = '" . $this->db->escape($data['email']) . "', telephone = '" . $this->db->escape($data['telephone']) . "', fax = '" . $this->db->escape($data['fax']) . "', company = '" . $this->db->escape($data['company']) . "', website = '" . $this->db->escape($data['website']) . "', address_1 = '" . $this->db->escape($data['address_1']) . "', address_2 = '" . $this->db->escape($data['address_2']) . "', city = '" . $this->db->escape($data['city']) . "', postcode = '" . $this->db->escape($data['postcode']) . "', country_id = '" . (int)$data['country_id'] . "', zone_id = '" . (int)$data['zone_id'] . "' WHERE affiliate_id = '" . (int)$affiliate_id . "'");
	}

	public function editPayment($data) {
		$affiliate_id = $this->affiliate->getId();

		$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET tax = '" . $this->db->escape($data['tax']) . "', payment = '" . $this->db->escape($data['payment']) . "', cheque = '" . $this->db->escape($data['cheque']) . "', paypal = '" . $this->db->escape($data['paypal']) . "', bank_name = '" . $this->db->escape($data['bank_name']) . "', bank_branch_number = '" . $this->db->escape($data['bank_branch_number']) . "', bank_swift_code = '" . $this->db->escape($data['bank_swift_code']) . "', bank_account_name = '" . $this->db->escape($data['bank_account_name']) . "', bank_account_number = '" . $this->db->escape($data['bank_account_number']) . "' WHERE affiliate_id = '" . (int)$affiliate_id . "'");
	}

	public function editPassword($email, $password) {
		$this->db->query("UPDATE " . DB_PREFIX . "affiliate SET salt = '" . $this->db->escape($salt = token(9)) . "', password = '" . $this->db->escape(sha1($salt . sha1($salt . sha1($password)))) . "' WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}

	public function getAffiliate($affiliate_id) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE affiliate_id = '" . (int)$affiliate_id . "'");

		return $query->row;
	}

	public function getAffiliateByEmail($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function getAffiliateByCode($code) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate WHERE code = '" . $this->db->escape($code) . "'");

		return $query->row;
	}

	public function getTotalAffiliatesByEmail($email) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "affiliate WHERE LOWER(email) = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row['total'];
	}

	public function addTransaction($affiliate_id, $amount = '', $order_id = 0) {
		$affiliate_info = $this->getAffiliate($affiliate_id);

		if ($affiliate_info) {
			$this->load->language('mail/affiliate');

			$this->db->query("INSERT INTO " . DB_PREFIX . "affiliate_transaction SET affiliate_id = '" . (int)$affiliate_id . "', order_id = '" . (float)$order_id . "', description = '" . $this->db->escape($this->language->get('text_order_id') . ' #' . $order_id) . "', amount = '" . (float)$amount . "', date_added = NOW()");

			$affiliate_transaction_id = $this->db->getLastId();

			$message  = sprintf($this->language->get('text_transaction_received'), $this->currency->format($amount, $this->config->get('config_currency'))) . "\n\n";
			$message .= sprintf($this->language->get('text_transaction_total'), $this->currency->format($this->getTransactionTotal($affiliate_id), $this->config->get('config_currency')));

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
			$mail->smtp_username = $this->config->get('config_mail_smtp_username');
			$mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
			$mail->smtp_port = $this->config->get('config_mail_smtp_port');
			$mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

			$mail->setTo($affiliate_info['email']);
			$mail->setFrom($this->config->get('config_email'));
			$mail->setSender(html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8'));
			$mail->setSubject(sprintf($this->language->get('text_transaction_subject'), html_entity_decode($this->config->get('config_name'), ENT_QUOTES, 'UTF-8')));
			$mail->setText($message);
			$mail->send();

			return $affiliate_transaction_id;
		}
	}

	public function deleteTransaction($order_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "affiliate_transaction WHERE order_id = '" . (int)$order_id . "'");
	}

	public function getTransactionTotal($affiliate_id) {
		$query = $this->db->query("SELECT SUM(amount) AS total FROM " . DB_PREFIX . "affiliate_transaction WHERE affiliate_id = '" . (int)$affiliate_id . "'");

		return $query->row['total'];
	}

	public function addLoginAttempt($email) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_login WHERE email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "' AND ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "'");

		if (!$query->num_rows) {
			$this->db->query("INSERT INTO " . DB_PREFIX . "affiliate_login SET email = '" . $this->db->escape(utf8_strtolower((string)$email)) . "', ip = '" . $this->db->escape($this->request->server['REMOTE_ADDR']) . "', total = 1, date_added = '" . $this->db->escape(date('Y-m-d H:i:s')) . "', date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "'");
		} else {
			$this->db->query("UPDATE " . DB_PREFIX . "affiliate_login SET total = (total + 1), date_modified = '" . $this->db->escape(date('Y-m-d H:i:s')) . "' WHERE affiliate_login_id = '" . (int)$query->row['affiliate_login_id'] . "'");
		}
	}

	public function getLoginAttempts($email) {
		$query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "affiliate_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");

		return $query->row;
	}

	public function deleteLoginAttempts($email) {
		$this->db->query("DELETE FROM `" . DB_PREFIX . "affiliate_login` WHERE email = '" . $this->db->escape(utf8_strtolower($email)) . "'");
	}
    public function editCentr($data) {
        $affiliate_id = $this->affiliate->getId();
		$this->db->query("DELETE FROM `" . DB_PREFIX . "affiliate_centr`");
        foreach ($data as $values) {
        $a='0';
         foreach ($values as $value) {
        $a++;
       if (empty($value['affiliate_centr_id']) || $value['affiliate_centr_id'] == '0') $affiliate_centr_id = $a; else $affiliate_centr_id = $value['affiliate_centr_id'];
    $category = implode(",",$value['category']);
    $this->db->query("INSERT INTO " . DB_PREFIX . "affiliate_centr SET affiliate_centr_id = '" . (int)$affiliate_centr_id . "',  affiliate_id = '" . (int)$affiliate_id . "', category = '". $category ."', zone = '". $this->db->escape($value['zone']) ."',  city = '". $this->db->escape($value['city']) ."',  adres = '". $this->db->escape($value['adres']) ."',  rabota = '". $this->db->escape($value['rabota']) ."',  telefon = '". $this->db->escape($value['telefon']) ."',  usluga = '". $this->db->escape($value['usluga']) ."'");
        }
      }
	}
  public function getCentr() {
   $affiliate_id = $this->affiliate->getId();

   $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "affiliate_centr` WHERE affiliate_id = '" . (int)$affiliate_id . "'");
   	return $query->rows;
	}

  public function getMaps($data_query, $city) {
    $query = array();
    //    $prod_cats_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "'")->rows;
        foreach ($data_query as $prod_cat_id) {
        $affiliate_centr_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_centr WHERE centr_id = '" . $prod_cat_id['centr_id'] . "' and city = '".$city."'")->rows;
         foreach ($affiliate_centr_id as $affiliate_centr) {
            $query[] = array(
                    'geocode' => $affiliate_centr['city'].', '.$affiliate_centr['adres'],
				    'header' => $this->db->query("SELECT company FROM " . DB_PREFIX . "affiliate where affiliate_id = '".$affiliate_centr['affiliate_id']."'")->row['company'],
                    'body'   =>  $affiliate_centr['city'].', '.$affiliate_centr['adres'].'<br>'.$affiliate_centr['usluga'].'<br>'.$affiliate_centr['rabota'],
                    'city'   =>  $affiliate_centr['city'],
                    'street'   =>  $affiliate_centr['adres'],
					'footer'    => $affiliate_centr['telefon'],
                    'centr_id' => $affiliate_centr['centr_id']
				);
         }
        }
    //    print_r($affiliate_centr_id); exit;
    	return $query;
	}

 public function getCityCentrs($data_query, $city) {
    $query = array();
      //  $prod_cats_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . $product_id . "'")->rows;
        foreach ($data_query as $prod_cat_id) {
        $aff_centr_id = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_centr WHERE centr_id = '" . $prod_cat_id['centr_id'] . "' and city = '".$city."'")->rows;
         foreach ($aff_centr_id as $aff_centr) {
            $query[] = array(
                    'centr_id' => $aff_centr['centr_id'],
					'adres'   =>  $aff_centr['city'].', '.$aff_centr['adres']
			  );
         }
        }
    	return $query;
	}

  public function getCity() {

        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_centr GROUP BY city")->rows;

    	return $query;
	}

  public function order() {

    $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_order WHERE affiliate_id = '" . (int)$this->affiliate->getId() . "'")->rows;

        	return $query;
	}

   public function getOrder($data) {
    $query = array();
    foreach ($data as $order) {
    $centr = $this->db->query("SELECT * FROM " . DB_PREFIX . "affiliate_centr WHERE affiliate_centr_id = '" . (int)$order['affiliate_centr_id'] . "'")->row;
    $product = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_description WHERE product_id = '" . (int)$order['order_product_id'] . "'")->row;
    $customer = $this->db->query("SELECT * FROM " . DB_PREFIX . "order WHERE order_id = '" . (int)$order['order_id'] . "'")->row;
     $query[] = array(
                    'order_id'  => $order['order_id'],
                    'centr'     => $centr['city'].", ".$centr['adres'],
					'name'      => $product['name'],
					'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id']),
                    'customer'  => $customer['firstname']."<br>".$customer['telephone']."<br>".$customer['email'],
                    'shipping'  => $customer['shipping_city'].", ".$customer['shipping_address_1'],
                    'date_added' => date($this->language->get('date_format_short'), strtotime($customer['date_added']))
			  );
	}
    return $query;
}

public function getAffCategories() {
    $query = array();
    $categorys = $this->db->query("SELECT * FROM " . DB_PREFIX . "category WHERE acentr = '1'")->rows;
    foreach ($categorys as $category) {
     $name = $this->db->query("SELECT * FROM " . DB_PREFIX . "category_description WHERE category_id = '".$category['category_id']."'")->row['name'];
     $query[] = array(
                    'category_id'  => $category['category_id'],
                    'name'      => $name
					 );
    }
    return $query;
}
}