<?php
class ControllerAccountPurpletreeMultivendorSellerproduct extends Controller{
		private $error = array();
		
		public function index(){
			if (!$this->customer->isLogged()) {
				
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){	
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->load->language('purpletree_multivendor/metals_spot_price');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellerproduct');
			$img_mag_status = $this->model_purpletree_multivendor_sellerproduct->getModifications();
			
			$this->getList();
		}
		////////Start Image manager/////////
		public function imgUrlMove($url,$movePath,$size){
			$imgUrl=file_get_contents($url);
			$im=imagecreatefromstring($imgUrl);
			$im_w=imagesx($im);
			$im_h=imagesy($im);
			if($im_h>$size){
				$im_w=$im_w*$size/$im_h;
				$im_h=$size;
			}
			$thumb=imagecreatetruecolor($im_w,$im_h);
			imagealphablending($thumb,false);
			imagesavealpha($thumb,true);
			imagefill($thumb,0,0,imagecolorallocatealpha($thumb,0,0,0,127));
			imagecopyresized($thumb,$im,0,0,0,0,$im_w,$im_h,imagesx($im),imagesy($im));
			if(preg_match("/gif|png/i",$url))imagepng($thumb,$movePath,1);else imagejpeg($thumb,$movePath,100);imagedestroy($thumb);imagedestroy($im);
		}
		public function wmjson(){
			$wmArr = $_POST;
			$wmArr["wmStatus"] = ($wmArr["wmStatus"]==='true'?true:false);
			$dir = rtrim(DIR_APPLICATION."view/javascript/simple_store/watermark");
			if(!is_dir($dir)){
				mkdir($dir,0755,true);
			}
			$fp = fopen($dir.'/wmJson.json','w');
			fwrite($fp,json_encode($wmArr));
			fclose($fp);
			if($wmArr["imgMove"]=== 'true') {
				$this->imgUrlMove($wmArr["wmData"],$dir.'/wmImg.png',500);
			}
		}
		public function uploadNewImage(){
			if($_SERVER['REQUEST_METHOD']=='POST'){
				$seller_id = $this->customer->getId();
				$dir=rtrim(DIR_IMAGE.'catalog/Seller_'.$seller_id.'/');
				//echo"<pre>";print_r($dir);die;
				if(!is_dir($dir)){
					mkdir($dir,0755,true);
				}
				if(!empty($_POST)){
					if(!empty($_POST["dels"])){
						$this->delProductImage($_POST["dels"]);
					}
					if(!empty($_POST["urls"])){
						foreach($_POST["urls"]as $url){
							$this->imgUrlMove($url["value"],$dir.$url["name"],1080);
						}
					}
				}
				if(!empty($_FILES)){foreach($_FILES as $file){
					move_uploaded_file($file["tmp_name"],$dir.$file["name"]);
				}
				}
			}
		}
		public function existImage() {
			if (isset($_POST)) {
				header('Content-Type: application/json');
				$imgpath = rtrim($_POST["name"]);
				$namearr = preg_split('/\.(?=[^.]*$)/i', $imgpath);
				$nIdx = 0;
				do {
					$filepath = $nIdx != 0 ? $namearr[0].
					'-'.$nIdx.
					'.'.$namearr[1]: $imgpath;
					if (!is_file(DIR_IMAGE.$filepath)) {
						echo json_encode(array("newname" => preg_replace("/\S*\/(?=\S*$)/i", "", $filepath), "status" => $nIdx));
						break;
					}
				} while (++$nIdx);
			}
			die();
		}
		public function delProductImage($delInfo){
			$this->load->model('purpletree_multivendor/sellerproduct');
			if(!is_array($delInfo)){
				$unlikUrls=array();
				$parsedProductImage=$this->model_purpletree_multivendor_sellerproduct->parseProductImage($delInfo);
				foreach($parsedProductImage as $key=>$value){
					if(isset($value["description"])){
						$search=preg_replace('/\S*(?=(\\\\)\/\S*\/\S*\/$)/i',"",preg_replace("/\\\|\//","\/",DIR_IMAGE));preg_match_all("/(?<=".$search.")\S*(?=&quot;)/im",$value["description"],$newUrls);$unlikUrls=array_merge($newUrls[0],$unlikUrls);
					}
					else{$unlikUrls[]=$value["image"];
					}
				}
				$delInfo=array('id'=>$delInfo,'value'=>array_unique($unlikUrls));
			}
			foreach($delInfo["value"]as $value){
				$imgIs=$this->model_purpletree_multivendor_sellerproduct->getUnlikUrls($delInfo["id"],$value)->rows["0"]["result"];if($imgIs==0&&file_exists(DIR_IMAGE.$value))unlink(DIR_IMAGE.$value);
			}
		}
		public function getsmollsize($thumb){		
			if(@is_array($sml_img=getimagesize(DIR_IMAGE.$thumb))){
				if($sml_img[0]>300||$sml_img[1]>200){$sml_img[1]=200;$sml_img[0]=300;};
				return $this->model_tool_image->resize($thumb,$sml_img[0],$sml_img[1]);
			}
			else 
			return $this->model_tool_image->resize("no_image.png",300,200);
		}
		////////End Image manager//////////		
		
		public function add() {
			
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->document->addScript('catalog/view/javascript/purpletree_style.js');
			$this->load->model('purpletree_multivendor/sellerproduct');
			$img_mag_status = $this->model_purpletree_multivendor_sellerproduct->getModifications();///img status
			if($this->config->get('purpletree_multivendor_subscription_plans')){
				$getSsellerplanStatus = $this->model_purpletree_multivendor_sellerproduct->getSsellerplanStatus($this->customer->getId());
				if(!$getSsellerplanStatus) {
					$this->session->data['error_warning']=$this->language->get('error_subscription_plan');
					$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
				}	
				$plan_status=array();
				$total_store_Product=array();
				$total_plan_Product=array();
				
				$plan_status = $this->model_purpletree_multivendor_sellerproduct->sellerTotalPlanStatus($this->customer->getId());
				
				$total_store_Product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalProduct($this->customer->getId());
				
				if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
					$total_plan_Product = $this->model_purpletree_multivendor_sellerproduct->getNoOfProductForMultiplePlan($this->customer->getId());
					}else{	
					$total_plan_Product = $this->model_purpletree_multivendor_sellerproduct->getNoOfProduct($this->customer->getId());
				}
			if(!empty($plan_status['status_id'])){	
				if($plan_status['status_id']==0){
					
					$this->session->data['error_warning']= $this->language->get('error_subscription_plan_status');
					
					$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));			
				} 
			}
				
				if($total_store_Product['total_product']>0){
					$store_product=$total_store_Product['total_product'];			
					} else {
					$store_product=0;	
				}
			if(!empty($total_plan_Product['no_of_product'])){	
				if($total_plan_Product['no_of_product']>0){
					$plan_product=$total_plan_Product['no_of_product'];			
					} else {
					$plan_product=0;	
				}
			}
				
				if(isset($plan_product)){
					
					if($plan_product > $store_product){
						
						} else {
						
						$this->session->data['error_warning']=$this->language->get('error_subscription_plan_limit');
						
						$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));	
					}
					} else {
					
					$this->session->data['error_warning']=$this->language->get('error_subscription_plan');
					$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
				}
				
			}
			$total_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalFeaturedProduct($this->customer->getId());
			
			if($total_featured_product==NULL){
				$total_featured_product =0;	
			}
			
			if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
				$allowed_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedFeaturedProductForMultiplePlan($this->customer->getId());
				} else {
				$allowed_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedFeaturedProduct($this->customer->getId());	
			}
			
			if($allowed_featured_product==NULL){
				$allowed_featured_product=0;			
			}
			
			$total_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalCategpryFeaturedProduct($this->customer->getId());
			if($total_featured_product==NULL){
				$total_featured_product =0;	
			}
			if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
				$allowed_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedCategoryFeaturedProductForMultiplePlan($this->customer->getId());
				} else {
				$allowed_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedCategoryFeaturedProduct($this->customer->getId());
			}
			
			
			if($allowed_featured_product==NULL){
				$allowed_featured_product=0;			
			}
			$alloedadd = 0;
			if (($this->request->server['REQUEST_METHOD'] == 'POST')) { 
				$img_mag_status = $this->model_purpletree_multivendor_sellerproduct->getModifications();
				//////Image manager Extension code///////
				if(isset($img_mag_status)){
					if(isset($this->request->post['product_image'])) {
						if(!empty($this->request->post['product_image'])) {
							foreach($this->request->post['product_image'] as $keyyy => $imaggee) {
								//echo "a";
								$rrr = explode('/',$imaggee['image']);
								//echo "b";
								$rrre = end($rrr);
								//echo "c";
								$seller_iddd = $this->customer->getId();
								$this->request->post['product_image'][$keyyy]['image'] = 'catalog/Seller_'.$seller_iddd.'/'.$rrre;
							}
						}
					}
					if(isset($this->request->post['image'])) {
						if($this->request->post['image'] != '') {
							//echo "a";
							$rrr = explode('/',$this->request->post['image']);
							//echo "b";
							
							$rrre = end($rrr);
							//echo "c";
							$seller_iddd = $this->customer->getId();
							$this->request->post['image'] = 'catalog/Seller_'.$seller_iddd.'/'.$rrre;
							
						}	
					}
				}	
				if($this->validateForm()) {
					
					if($this->config->get('purpletree_multivendor_subscription_plans')){
						if(isset($this->request->post['is_featured'])){
							if($this->request->post['is_featured']==1){
								if( $allowed_featured_product > $total_featured_product){} else {
									
									$this->session->data['error_warning']=$this->language->get('error_featured_product');
									
									$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct/add', '', true));
								}
							}
						}
						//////////////
						
						
						if(isset($this->request->post['is_category_featured'])){
							if($this->request->post['is_category_featured']==1){
								if( $allowed_category_featured_product > $total_category_featured_product){ } else {	
									$this->session->data['error_warning']=$this->language->get('error_category_featured_product');
									
									$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct/add', '', true));
								}
							}
						}
						///////////////////////
					}
					$checkSellerVacation = $this->model_purpletree_multivendor_sellerproduct->checkSellerVacationProduct($this->customer->getId());
					if($checkSellerVacation>=1){	
						$this->request->post['status'] = 0;
					}
					
					$this->request->post['seller_id'] = $this->customer->getId();
					$this->request->post['product_store'] = array($this->config->get('config_store_id'));
					$this->model_purpletree_multivendor_sellerproduct->addProduct($this->request->post);
					$this->session->data['success'] = $this->language->get('text_success');
					$url = '';
					
					if (isset($this->request->get['filter_name'])) {
						$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
					}
					
					if (isset($this->request->get['filter_model'])) {
						$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
					}
					
					if (isset($this->request->get['filter_price'])) {
						$url .= '&filter_price=' . $this->request->get['filter_price'];
					}
					
					if (isset($this->request->get['filter_quantity'])) {
						$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
					}
					
					if (isset($this->request->get['filter_status'])) {
						$url .= '&filter_status=' . $this->request->get['filter_status'];
					}
					
					if (isset($this->request->get['sort'])) {
						$url .= '&sort=' . $this->request->get['sort'];
					}
					
					if (isset($this->request->get['order'])) {
						$url .= '&order=' . $this->request->get['order'];
					}
					
					if (isset($this->request->get['page'])) {
						$url .= '&page=' . $this->request->get['page'];
					}
					$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct',$url, true));
				}
			}
			$this->getForm();
		}
		
		public function edit() {
			
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->document->addScript('catalog/view/javascript/purpletree_style.js');
			$this->load->model('purpletree_multivendor/sellerproduct');
			$seller_id = $this->customer->getId();	
			$product_info = $this->model_purpletree_multivendor_sellerproduct->getProduct($this->request->get['product_id'],$seller_id);
			if(($this->config->get('purpletree_multivendor_featured_enabled_hide_edit') && $product_info['is_featured']==1) || ($this->config->get('purpletree_multivendor_featured_enabled_hide_edit') && $product_info['is_category_featured']==1)){
				$this->response->addHeader($this->request->server['SERVER_PROTOCOL'] . ' 404 Not Found');
				$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
				$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/home','',true)
				);
				
				$this->document->setTitle($this->language->get('text_error'));
				
				$data['heading_title'] = $this->language->get('text_error');
				
				$data['text_error'] = $this->language->get('text_error');
				
				$data['button_continue'] = $this->language->get('button_continue');
				
				$data['continue'] = $this->url->link('common/home');
				
				
				$this->response->setOutput($this->load->view('error/not_found', $data));
				//die;
				} else {
				
				$plan_status=array();
				$plan_status = $this->model_purpletree_multivendor_sellerproduct->sellerTotalPlanStatus($this->customer->getId());
				
				
				if($this->config->get('purpletree_multivendor_subscription_plans')){
					if(!empty($plan_status['status_id'])){	
					if($plan_status['status_id']==0){
						
						$this->session->data['error_warning']= $this->language->get('error_subscription_plan_status');
						
						$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct','',true));			
					}
				}
				}		
				
				if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
					
					if($this->request->post['keyword'] == ''){
						foreach($this->request->post['product_description'] as $language_id=>$value){
							$value['name']=strtolower(implode('_',explode(' ',trim($value['name']))));
							$this->request->post['keyword']= 
							$value['name'].'_'.$this->request->get['product_id'];
							break;
						}
					}		
					$img_mag_status = $this->model_purpletree_multivendor_sellerproduct->getModifications();		
					if(isset($img_mag_status)) {					
						if(isset($this->request->post['product_image'])) {
							if(!empty($this->request->post['product_image'])) {
								foreach($this->request->post['product_image'] as $keyyy => $imaggee) {
									//echo "a";
									$rrr1 = explode('catalog//',$imaggee['image']);
									if(array_key_exists('1',$rrr1)) {
										$imaggee['image'] = 'catalog/'.$rrr1[1];
									}
									$rrr = explode('/',$imaggee['image']);
									//echo "b";
									$rrre = end($rrr);
									//echo "c";
									$seller_iddd = $this->customer->getId();
									$this->request->post['product_image'][$keyyy]['image'] = 'catalog/Seller_'.$seller_iddd.'/'.$rrre;
								}
							}
						}
						if(isset($this->request->post['image'])) {
							if($this->request->post['image'] != '') {
								//echo "a";
								$rrr = explode('/',$this->request->post['image']);
								//echo "b";
								
								$rrre = end($rrr);
								//echo "c";
								$seller_iddd = $this->customer->getId();
								$this->request->post['image'] = 'catalog/Seller_'.$seller_iddd.'/'.$rrre;
								
								
							}
						}
					}
					
					$checkSellerVacation = $this->model_purpletree_multivendor_sellerproduct->checkSellerVacationProduct($this->customer->getId());
					if($checkSellerVacation>=1){	
						$this->request->post['status'] = 0;
					}
					if($this->validateForm()) {
						if($this->config->get('purpletree_multivendor_subscription_plans')){
							$total_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalFeaturedProduct($this->customer->getId(),$this->request->get['product_id']);
							if($total_featured_product==NULL){
								$total_featured_product =0;	
							}
							
							if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
								$allowed_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedFeaturedProductForMultiplePlan($this->customer->getId());
								} else {
								$allowed_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedFeaturedProduct($this->customer->getId());	
							}
							
							if($allowed_featured_product==NULL){
								$allowed_featured_product=0;			
							}
							
							$total_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalCategpryFeaturedProduct($this->customer->getId(),$this->request->get['product_id']);
							if($total_featured_product==NULL){
								$total_featured_product =0;	
							}
							
							if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
								$allowed_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedCategoryFeaturedProductForMultiplePlan($this->customer->getId());
								} else {
								$allowed_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedCategoryFeaturedProduct($this->customer->getId());
							}
							
							if($allowed_featured_product==NULL){
								$allowed_featured_product=0;			
							}
							$is_featuredproduct = 0;
							$is_category_featuredproduct = 0;
							//Get Value of featured for edit
							if (isset($this->request->get['product_id'])) {
								$product_info = $this->model_purpletree_multivendor_sellerproduct->getProduct($this->request->get['product_id'],$this->customer->getId());
								
								$is_featuredproduct = (isset($product_info['is_featured'])?$product_info['is_featured']:0);
								
								$is_category_featuredproduct = (isset($product_info['is_category_featured'])?$product_info['is_category_featured']:0);
								
							}
							
							//Get Value of featured for edit
							if(isset($this->request->post['is_featured'])){
								if($this->request->post['is_featured']==1 && $is_featuredproduct != 1){
									if( $allowed_featured_product > $total_featured_product){  } else {
										
										$this->session->data['error_warning']=$this->language->get('error_featured_product');
										
										$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct/edit', '&product_id='.$this->request->get['product_id'], true));
									}
								} 
							}
							////////////
							
							if(isset($this->request->post['is_category_featured'])){
								if($this->request->post['is_category_featured']==1 && $is_category_featuredproduct != 1){
									if( $allowed_category_featured_product > $total_category_featured_product){ } else {
										
										$this->session->data['error_warning']= $this->language->get('error_category_featured_product');
										
										$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
									}
								}
							}
							
							///////////
						}
						$this->request->post['seller_id'] = $this->customer->getId();
						$product_infoq = $this->model_purpletree_multivendor_sellerproduct->getProduct($this->request->get['product_id'],$this->request->post['seller_id']);
						$this->request->post['is_approved'] = (isset($product_infoq['is_approved'])?$product_infoq['is_approved']:0);
						if($this->config->get('purpletree_multivendor_subscription_plans')){
							$plans=array();
							$plans= $this->model_purpletree_multivendor_sellerproduct->sellerActiveProduct($this->request->post['seller_id'],$this->request->post['product_plan_id'],$this->request->get['product_id']);
							
							if($plans){
								$this->request->post['product_store'] = $this->model_purpletree_multivendor_sellerproduct->getProductStores($this->request->get['product_id']);
								$this->model_purpletree_multivendor_sellerproduct->editProduct($this->request->get['product_id'],$this->request->post);
								$this->session->data['success'] = $this->language->get('text_success');
								$url = '';
								
								if (isset($this->request->get['filter_name'])) {
									$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
								}
								
								if (isset($this->request->get['filter_model'])) {
									$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
								}
								
								if (isset($this->request->get['filter_price'])) {
									$url .= '&filter_price=' . $this->request->get['filter_price'];
								}
								
								if (isset($this->request->get['filter_quantity'])) {
									$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
								}
								
								if (isset($this->request->get['filter_status'])) {
									$url .= '&filter_status=' . $this->request->get['filter_status'];
								}
								
								if (isset($this->request->get['sort'])) {
									$url .= '&sort=' . $this->request->get['sort'];
								}
								
								if (isset($this->request->get['order'])) {
									$url .= '&order=' . $this->request->get['order'];
								}
								
								if (isset($this->request->get['page'])) {
									$url .= '&page=' . $this->request->get['page'];
								}
								$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct',$url, true));
								} else {
								$this->session->data['error_warning']= 'Product not Allowed';	
								$this->response->redirect($this->url->link('
								account/purpletree_multivendor/sellerproduct/edit','&product_id=' .$this->request->get['product_id'], true));
							}
							
							}else{
							$this->request->post['product_store'] = $this->model_purpletree_multivendor_sellerproduct->getProductStores($this->request->get['product_id']);
							$this->model_purpletree_multivendor_sellerproduct->editProduct($this->request->get['product_id'],$this->request->post);
							$this->session->data['success'] = $this->language->get('text_success');
							$url = '';
							
							if (isset($this->request->get['filter_name'])) {
								$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
							}
							
							if (isset($this->request->get['filter_model'])) {
								$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
							}
							
							if (isset($this->request->get['filter_price'])) {
								$url .= '&filter_price=' . $this->request->get['filter_price'];
							}
							
							if (isset($this->request->get['filter_quantity'])) {
								$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
							}
							
							if (isset($this->request->get['filter_status'])) {
								$url .= '&filter_status=' . $this->request->get['filter_status'];
							}
							
							if (isset($this->request->get['sort'])) {
								$url .= '&sort=' . $this->request->get['sort'];
							}
							
							if (isset($this->request->get['order'])) {
								$url .= '&order=' . $this->request->get['order'];
							}
							
							if (isset($this->request->get['page'])) {
								$url .= '&page=' . $this->request->get['page'];
							}
							$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct',$url, true));
						}
					}
				}
				$this->getForm();
			}
			
		}
		
		
		public function copy() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {	
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/metals_spot_price');
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellerproduct');
			if (isset($this->request->post['selected1'])) {
				$this->request->post['selected'] = $this->request->post['selected1'];
			}
			if (isset($this->request->post['selected'])) {
				foreach ($this->request->post['selected'] as $product_id) { 
					
					if($this->config->get('purpletree_multivendor_subscription_plans')){
						$getSsellerplanStatus = $this->model_purpletree_multivendor_sellerproduct->getSsellerplanStatus($this->customer->getId());
						if(!$getSsellerplanStatus) {
							$this->session->data['error_warning']=$this->language->get('error_subscription_plan');
							$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
						}	
						$plan_status=array();
						$total_store_Product=array();
						$total_plan_Product=array();
						
						$plan_status = $this->model_purpletree_multivendor_sellerproduct->sellerTotalPlanStatus($this->customer->getId());
						
						$total_store_Product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalProduct($this->customer->getId());
						
						if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
							$total_plan_Product = $this->model_purpletree_multivendor_sellerproduct->getNoOfProductForMultiplePlan($this->customer->getId());
							} else {
							$total_plan_Product = $this->model_purpletree_multivendor_sellerproduct->getNoOfProduct($this->customer->getId());
							
						}
					if(!empty($plan_status['status_id'])){		
						if($plan_status['status_id']==0){
							
							$this->session->data['error_warning']= $this->language->get('error_subscription_plan_status');
							
							$this->response->redirect($this->url->link('extension/account/purpletree_multivendor/sellerproduct', '', true));			
						} 
					}
						
						if($total_store_Product['total_product']>0){
							$store_product=$total_store_Product['total_product'];			
							} else {
							$store_product=0;	
						}
					if(!empty($total_plan_Product['no_of_product'])){
						if($total_plan_Product['no_of_product']>0){
							$plan_product=$total_plan_Product['no_of_product'];			
							} else {
							$plan_product=0;	
						}
					}
						
						if(isset($plan_product)){
							
							if($plan_product <= $store_product){
								$this->session->data['error_warning']=$this->language->get('error_subscription_plan_limit');
								
								$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));	
								} else {
								
								
							}
							} else {
							
							$this->session->data['error_warning']=$this->language->get('error_subscription_plan');
							$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
						}
						
					}
					$seller_id = $this->customer->getId();
					$this->model_purpletree_multivendor_sellerproduct->copyProduct($product_id, $seller_id);
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['filter_name'])) {
					$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_model'])) {
					$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_price'])) {
					$url .= '&filter_price=' . $this->request->get['filter_price'];
				}
				
				if (isset($this->request->get['filter_quantity'])) {
					$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
				}
				
				if (isset($this->request->get['filter_status'])) {
					$url .= '&filter_status=' . $this->request->get['filter_status'];
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->getList();
		}
		
		protected function getForm() {
			$img_mag_status = $this->model_purpletree_multivendor_sellerproduct->getModifications();
			//////Image manager Extension code///////
			if(isset($img_mag_status)){
				//simpleStore viweData 
				$this->document->addStyle('catalog/view/javascript/simple_store/css/im_style.css');
				$this->document->addScript('catalog/view/javascript/simple_store/js/jquery-ui.js');
				$this->document->addScript('catalog/view/javascript/simple_store/js/iim.js');
				$data['pathImg'] = HTTPS_SERVER . 'image/';
				$data['proId'] = !isset($this->request->get['product_id']) ? 0 : $this->request->get['product_id'];
				$wmJson = DIR_APPLICATION."catalog/view/javascript/simple_store/watermark/wmJson.json";
				$data["wmJson"] = is_file($wmJson)?file_get_contents($wmJson):json_encode(array("wmStatus"=>false,"wmSize"=>50,"wmOpc" =>50,"wmPos"=>"lt","wmFont"=>array("Cl"=>"#fff")));
				
				$ss_lang = array('max_f','upl_ser','max_i','drop','drop_or','zoom','upl_pc','upl_link','upl_save','exist','keep_old','keep_both','replace','remove_all','ignor','mAdd');
				foreach ($ss_lang  as $key) {
					$data['ss_lang'][$key] = $this->language->get($key);
				}
				
				$wm_lang = array('lt','rt','lb','rb','cn','mt','posi','wm_label','siz','switch','opc');
				foreach ($wm_lang  as $key) {
					$data[$key] = $this->language->get($key);
				}
				$data['ok'] = $this->language->get('ok');
				$data['wm'] = $this->language->get('wm');
				//simpleStore viweData end
			}
			////// End Image manager Extension code///////
			$data['heading_title'] = $this->language->get('heading_title');
			
			$data['text_form'] = !isset($this->request->get['product_id']) ? $this->language->get('text_add') : $this->language->get('text_edit');
			$data['img_mag_status'] = $img_mag_status;///image
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_none'] = $this->language->get('text_none');
			$data['text_yes'] = $this->language->get('text_yes');
			$data['text_no'] = $this->language->get('text_no');
			$data['text_plus'] = $this->language->get('text_plus');
			$data['text_minus'] = $this->language->get('text_minus');
			$data['text_default'] = $this->language->get('text_default');
			$data['text_option'] = $this->language->get('text_option');
			$data['text_option_value'] = $this->language->get('text_option_value');
			$data['text_select'] = $this->language->get('text_select');
			$data['text_percent'] = $this->language->get('text_percent');
			$data['text_amount'] = $this->language->get('text_amount');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_assign_sub_plan'] = $this->language->get('text_assign_sub_plan');
			
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_description'] = $this->language->get('entry_description');
			$data['entry_meta_title'] = $this->language->get('entry_meta_title');
			$data['entry_meta_description'] = $this->language->get('entry_meta_description');
			$data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
			$data['entry_keyword'] = $this->language->get('entry_keyword');
			$data['entry_model'] = $this->language->get('entry_model');
			$data['entry_sku'] = $this->language->get('entry_sku');
			$data['entry_upc'] = $this->language->get('entry_upc');
			$data['entry_ean'] = $this->language->get('entry_ean');
			$data['entry_jan'] = $this->language->get('entry_jan');
			$data['entry_isbn'] = $this->language->get('entry_isbn');
			$data['entry_mpn'] = $this->language->get('entry_mpn');
			$data['entry_location'] = $this->language->get('entry_location');
			$data['entry_minimum'] = $this->language->get('entry_minimum');
			$data['entry_shipping'] = $this->language->get('entry_shipping');
			$data['entry_date_available'] = $this->language->get('entry_date_available');
			$data['entry_quantity'] = $this->language->get('entry_quantity');
			$data['entry_stock_status'] = $this->language->get('entry_stock_status');
			$data['entry_price'] = $this->language->get('entry_price');
			$data['entry_tax_class'] = $this->language->get('entry_tax_class');
			$data['entry_points'] = $this->language->get('entry_points');
			$data['entry_option_points'] = $this->language->get('entry_option_points');
			$data['entry_subtract'] = $this->language->get('entry_subtract');
			$data['entry_weight_class'] = $this->language->get('entry_weight_class');
			$data['entry_weight'] = $this->language->get('entry_weight');
			$data['entry_dimension'] = $this->language->get('entry_dimension');
			$data['entry_length_class'] = $this->language->get('entry_length_class');
			$data['entry_length'] = $this->language->get('entry_length');
			$data['entry_width'] = $this->language->get('entry_width');
			$data['entry_height'] = $this->language->get('entry_height');
			$data['entry_image'] = $this->language->get('entry_image');
			$data['entry_additional_image'] = $this->language->get('entry_additional_image');
			$data['entry_store'] = $this->language->get('entry_store');
			$data['entry_manufacturer'] = $this->language->get('entry_manufacturer');
			$data['entry_download'] = $this->language->get('entry_download');
			////////////
			$data['entry_featured_product'] = $this->language->get('entry_featured_product');
			$data['entry_category_featured_product'] = $this->language->get('entry_category_featured_product');
			
			$data['entry_filter'] = $this->language->get('entry_filter');
			$data['entry_related'] = $this->language->get('entry_related');
			$data['entry_attribute'] = $this->language->get('entry_attribute');
			$data['entry_text'] = $this->language->get('entry_text');
			$data['entry_option'] = $this->language->get('entry_option');
			$data['entry_option_value'] = $this->language->get('entry_option_value');
			$data['entry_required'] = $this->language->get('entry_required');
			$data['entry_sort_order'] = $this->language->get('entry_sort_order');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_date_start'] = $this->language->get('entry_date_start');
			$data['entry_date_end'] = $this->language->get('entry_date_end');
			$data['entry_priority'] = $this->language->get('entry_priority');
			$data['entry_tag'] = $this->language->get('entry_tag');
			$data['entry_customer_group'] = $this->language->get('entry_customer_group');
			$data['entry_reward'] = $this->language->get('entry_reward');
			$data['entry_layout'] = $this->language->get('entry_layout');
			$data['entry_recurring'] = $this->language->get('entry_recurring');
			
			$data['help_keyword'] = $this->language->get('help_keyword');
			$data['help_sku'] = $this->language->get('help_sku');
			$data['help_upc'] = $this->language->get('help_upc');
			$data['help_ean'] = $this->language->get('help_ean');
			$data['help_jan'] = $this->language->get('help_jan');
			$data['help_isbn'] = $this->language->get('help_isbn');
			$data['help_mpn'] = $this->language->get('help_mpn');
			$data['help_minimum'] = $this->language->get('help_minimum');
			$data['help_manufacturer'] = $this->language->get('help_manufacturer');
			$data['help_stock_status'] = $this->language->get('help_stock_status');
			$data['help_points'] = $this->language->get('help_points');
			$data['help_category'] = $this->language->get('help_category');
			$data['help_filter'] = $this->language->get('help_filter');
			$data['help_download'] = $this->language->get('help_download');
			$data['help_related'] = $this->language->get('help_related');
			$data['help_tag'] = $this->language->get('help_tag');
			
			$data['button_save'] = $this->language->get('button_save');
			$data['button_cancel'] = $this->language->get('button_cancel');
			$data['button_attribute_add'] = $this->language->get('button_attribute_add');
			$data['button_option_add'] = $this->language->get('button_option_add');
			$data['button_option_value_add'] = $this->language->get('button_option_value_add');
			$data['button_discount_add'] = $this->language->get('button_discount_add');
			$data['button_special_add'] = $this->language->get('button_special_add');
			$data['button_image_add'] = $this->language->get('button_image_add');
			$data['button_remove'] = $this->language->get('button_remove');
			$data['button_recurring_add'] = $this->language->get('button_recurring_add');
			$data['button_continue'] = $this->language->get('button_continue');
			$data['button_back'] = $this->language->get('button_back');
			
			$data['tab_general'] = $this->language->get('tab_general');
			$data['tab_data'] = $this->language->get('tab_data');
			$data['tab_attribute'] = $this->language->get('tab_attribute');
			$data['tab_option'] = $this->language->get('tab_option');
			$data['tab_recurring'] = $this->language->get('tab_recurring');
			$data['tab_discount'] = $this->language->get('tab_discount');
			$data['tab_special'] = $this->language->get('tab_special');
			$data['tab_image'] = $this->language->get('tab_image');
			$data['tab_links'] = $this->language->get('tab_links');
			$data['tab_reward'] = $this->language->get('tab_reward');
			$data['tab_design'] = $this->language->get('tab_design');
			$data['tab_openbay'] = $this->language->get('tab_openbay');
			$data['text_not_applicable'] = $this->language->get('text_not_applicable');
			$data['entry_subscription_featured_product'] = $this->language->get('entry_subscription_featured_product');
			$data['entry_subscription_category_featured_product'] = $this->language->get('entry_subscription_category_featured_product');
			$data['purpletree_multivendor_seller_category_featured'] = $this->config->get('purpletree_multivendor_seller_category_featured');
			$data['purpletree_multivendor_seller_featured_products'] = $this->config->get('purpletree_multivendor_seller_featured_products');
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} elseif(isset($this->session->data['error_warning'])) {
				$data['error_warning'] = $this->session->data['error_warning'];
				unset($this->session->data['error_warning']);
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->error['name'])) {
				$data['error_name'] = $this->error['name'];
				} else {
				$data['error_name'] = array();
			}
			if($this->config->get('purpletree_multivendor_hide_seller_product_tab')) {
				if (isset($this->error['tag'])) {
					$data['error_tag'] = $this->error['tag'];
					} else {
					$data['error_tag'] = array();
				}
				if (isset($this->error['error_product_category'])) {
					
					$data['error_product_category'] = $this->error['error_product_category'];
					} else {
					
					$data['error_product_category'] = array();
				}
			}
			
			if (isset($this->error['keyword'])) {
				$data['error_keyword'] = $this->error['keyword'];
				} else {
				$data['error_keyword'] = '';
			}
			if($this->config->get('purpletree_multivendor_subscription_plans')) {
				if (isset($this->error['error_category_featured_product_plan_id'])) {
					$data['error_category_featured_product_plan_id'] = $this->error['error_category_featured_product_plan_id'];
					} else {
					$data['error_category_featured_product_plan_id'] = '';
				}
				if (isset($this->error['error_featured_product_plan_id'])) {
					
					$data['error_featured_product_plan_id'] = $this->error['error_featured_product_plan_id'];
					} else {
					
					$data['error_featured_product_plan_id'] = '';
				}
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort']; 
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			//Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller-product";
			if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'image/catalog/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'image/catalog/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home','',true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/purpletree_multivendor/sellerproduct',  $url, true)
			);
			
			if (!isset($this->request->get['product_id'])) {
				$data['action'] = $this->url->link('account/purpletree_multivendor/sellerproduct/add',$url, true);
				} else {
				$data['action'] = $this->url->link('account/purpletree_multivendor/sellerproduct/edit','&product_id=' . $this->request->get['product_id'] . $url , true);
			}
			$seller_id = $this->customer->getId();
			
			$data['cancel'] = $this->url->link('account/purpletree_multivendor/sellerproduct',$url, true);
			
			if (isset($this->request->get['product_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
				$product_info = $this->model_purpletree_multivendor_sellerproduct->getProduct($this->request->get['product_id'],$seller_id);
			}
			
			
			$this->load->model('localisation/language');
			
			$data['languages'] = $this->model_localisation_language->getLanguages();
			foreach($data['languages'] as $key => $value) {
				$data['languages'][$key]['activetab'] = '';
			}
			foreach($data['languages'] as $key => $value) {
				$data['languages'][$key]['activetab'] = 'active';
				break;
			}
			
			
			$data['related_approval'] = $this->config->get('purpletree_multivendor_allow_related_product');
			$data['limit_approval'] = $this->config->get('purpletree_multivendor_product_limit');
			
			$data['seller_id'] = $seller_id;
			$data['seller_name'] = $this->customer->getFirstName()." ".$this->customer->getLastName();
			
			$data['is_approved'] = (isset($product_info['is_approved'])?$product_info['is_approved']:'');
			$data['is_featured'] = (isset($product_info['is_featured'])?$product_info['is_featured']:'');
			///////
			$data['is_category_featured'] = (isset($product_info['is_category_featured'])?$product_info['is_category_featured']:'');
			//////
			if (isset($this->request->post['product_description'])) {
				$data['product_description'] = $this->request->post['product_description'];
				} elseif (isset($this->request->get['product_id'])) {
				$data['product_description'] = $this->model_purpletree_multivendor_sellerproduct->getProductDescriptions($this->request->get['product_id']);
				} else {
				$data['product_description'] = array();
			}
			
			if (isset($this->request->post['model'])) {
				$data['model'] = $this->request->post['model'];
				} elseif (!empty($product_info)) {
				$data['model'] = $product_info['model'];
				} else {
				$data['model'] = '';
			}
			
			if (isset($this->request->post['sku'])) {
				$data['sku'] = $this->request->post['sku'];
				} elseif (!empty($product_info)) {
				$data['sku'] = $product_info['sku'];
				} else {
				$data['sku'] = '';
			}
			
			if (isset($this->request->post['upc'])) {
				$data['upc'] = $this->request->post['upc'];
				} elseif (!empty($product_info)) {
				$data['upc'] = $product_info['upc'];
				} else {
				$data['upc'] = '';
			}
			
			if (isset($this->request->post['ean'])) {
				$data['ean'] = $this->request->post['ean'];
				} elseif (!empty($product_info)) {
				$data['ean'] = $product_info['ean'];
				} else {
				$data['ean'] = '';
			}
			
			if (isset($this->request->post['jan'])) {
				$data['jan'] = $this->request->post['jan'];
				} elseif (!empty($product_info)) {
				$data['jan'] = $product_info['jan'];
				} else {
				$data['jan'] = '';
			}
			
			if (isset($this->request->post['isbn'])) {
				$data['isbn'] = $this->request->post['isbn'];
				} elseif (!empty($product_info)) {
				$data['isbn'] = $product_info['isbn'];
				} else {
				$data['isbn'] = '';
			}
			
			if (isset($this->request->post['mpn'])) {
				$data['mpn'] = $this->request->post['mpn'];
				} elseif (!empty($product_info)) {
				$data['mpn'] = $product_info['mpn'];
				} else {
				$data['mpn'] = '';
			}
			
			if (isset($this->request->post['location'])) {
				$data['location'] = $this->request->post['location'];
				} elseif (!empty($product_info)) {
				$data['location'] = $product_info['location'];
				} else {
				$data['location'] = '';
			}
			
			$this->load->model('setting/store');
			
			$data['stores'] = $this->model_setting_store->getStores();
			$data['stores'][] = array(
			'store_id' => 0,
			'name'     => $this->language->get('text_default')
			);
			
			$stores = $this->model_setting_store->getStores();
			
			foreach ($stores as $store) {
				$data['stores'][] = array(
				'store_id' => $store['store_id'],
				'name'     => $store['name']
				);
			}
			
			if (isset($this->request->get['product_id'])) {
				$data['product_store'] = $this->model_purpletree_multivendor_sellerproduct->getProductStores($this->request->get['product_id']);
				} else {
				$data['product_store'] = array($this->config->get('config_store_id'));
			}
			
			if (isset($this->request->post['keyword'])) {
				$data['keyword'] = $this->request->post['keyword'];
				} elseif (!empty($product_info)) {
				$data['keyword'] = $product_info['keyword'];
				} else {
				$data['keyword'] = '';
			}
			
			if (isset($this->request->post['shipping'])) {
				$data['shipping'] = $this->request->post['shipping'];
				} elseif (!empty($product_info)) {
				$data['shipping'] = $product_info['shipping'];
				} else {
				$data['shipping'] = 1;
			}
			
			if (isset($this->request->post['price'])) {
				$data['price'] = $this->request->post['price'];
				} elseif (!empty($product_info)) {
				$data['price'] = $product_info['price'];
				} else {
				$data['price'] = '';
			}
			//****** pts shipping *******//
			$data['text_shipping_charge'] = $this->language->get('text_shipping_charge');
			if (isset($this->request->post['price'])) {
				$data['pts_shipping_charge'] = $this->request->post['pts_shipping_charge'];
			} elseif (!empty($product_info['shipping_charge'])) {
				$data['pts_shipping_charge'] = $product_info['shipping_charge'];
			} else {
				$data['pts_shipping_charge'] = '';
			}
			//****** End pts shipping *******//
			$this->load->model('localisation/tax_class');
			
			$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
			
			if (isset($this->request->post['tax_class_id'])) {
				$data['tax_class_id'] = $this->request->post['tax_class_id'];
				} elseif (!empty($product_info)) {
				$data['tax_class_id'] = $product_info['tax_class_id'];
				} else {
				$data['tax_class_id'] = 0;
			}
			
			if (isset($this->request->post['date_available'])) {
				$data['date_available'] = $this->request->post['date_available'];
				} elseif (!empty($product_info)) {
				$data['date_available'] = ($product_info['date_available'] != '0000-00-00') ? $product_info['date_available'] : '';
				} else {
				$data['date_available'] = date('Y-m-d');
			}
			
			if (isset($this->request->post['quantity'])) {
				$data['quantity'] = $this->request->post['quantity'];
				} elseif (!empty($product_info)) {
				$data['quantity'] = $product_info['quantity'];
				} else {
				$data['quantity'] = 1;
			}
			
			if (isset($this->request->post['minimum'])) {
				$data['minimum'] = $this->request->post['minimum'];
				} elseif (!empty($product_info)) {
				$data['minimum'] = $product_info['minimum'];
				} else {
				$data['minimum'] = 1;
			}
			
			if (isset($this->request->post['subtract'])) {
				$data['subtract'] = $this->request->post['subtract'];
				} elseif (!empty($product_info)) {
				$data['subtract'] = $product_info['subtract'];
				} else {
				$data['subtract'] = 1;
			}
			
			if (isset($this->request->post['sort_order'])) {
				$data['sort_order'] = $this->request->post['sort_order'];
				} elseif (!empty($product_info)) {
				$data['sort_order'] = $product_info['sort_order'];
				} else {
				$data['sort_order'] = 1;
			}
			
			$this->load->model('localisation/stock_status');
			
			$data['stock_statuses'] = $this->model_localisation_stock_status->getStockStatuses();
			
			if (isset($this->request->post['stock_status_id'])) {
				$data['stock_status_id'] = $this->request->post['stock_status_id'];
				} elseif (!empty($product_info)) {
				$data['stock_status_id'] = $product_info['stock_status_id'];
				} else {
				$data['stock_status_id'] = 0;
			}
			
			if (isset($this->request->post['status'])) {
				$data['status'] = $this->request->post['status'];
				} elseif (!empty($product_info)) {
				$data['status'] = $product_info['status'];
				} else {
				$data['status'] = true;
			}
			
			if (isset($this->request->post['weight'])) {
				$data['weight'] = $this->request->post['weight'];
				} elseif (!empty($product_info)) {
				$data['weight'] = $product_info['weight'];
				} else {
				$data['weight'] = '';
			}
			
			$this->load->model('localisation/weight_class');
			
			$data['weight_classes'] = $this->model_localisation_weight_class->getWeightClasses();
			
			if (isset($this->request->post['weight_class_id'])) {
				$data['weight_class_id'] = $this->request->post['weight_class_id'];
				} elseif (!empty($product_info)) {
				$data['weight_class_id'] = $product_info['weight_class_id'];
				} else {
				$data['weight_class_id'] = $this->config->get('config_weight_class_id');
			}
			
			if (isset($this->request->post['length'])) {
				$data['length'] = $this->request->post['length'];
				} elseif (!empty($product_info)) {
				$data['length'] = $product_info['length'];
				} else {
				$data['length'] = '';
			}
			
			if (isset($this->request->post['width'])) {
				$data['width'] = $this->request->post['width'];
				} elseif (!empty($product_info)) {
				$data['width'] = $product_info['width'];
				} else {
				$data['width'] = '';
			}
			
			if (isset($this->request->post['height'])) {
				$data['height'] = $this->request->post['height'];
				} elseif (!empty($product_info)) {
				$data['height'] = $product_info['height'];
				} else {
				$data['height'] = '';
			}
			
			$this->load->model('localisation/length_class');
			
			$data['length_classes'] = $this->model_localisation_length_class->getLengthClasses();
			
			if (isset($this->request->post['length_class_id'])) {
				$data['length_class_id'] = $this->request->post['length_class_id'];
				} elseif (!empty($product_info)) {
				$data['length_class_id'] = $product_info['length_class_id'];
				} else {
				$data['length_class_id'] = $this->config->get('config_length_class_id');
			}
			
			$this->load->model('catalog/manufacturer');
			
			$data['manufacturers'] = $this->model_catalog_manufacturer->getManufacturers();
			
			if (isset($this->request->post['manufacturer_id'])) {
				$data['manufacturer_id'] = $this->request->post['manufacturer_id'];
			} elseif (!empty($product_info)) {
				$data['manufacturer_id'] = $product_info['manufacturer_id'];
			} else {
				$data['manufacturer_id'] = 0;
			}
			
			$data['config_language_id'] = $this->config->get('config_language_id');
			
			$data['product_product_descriptions'] = [];

			$cust_tubs = $this->model_purpletree_multivendor_dashboard->getCustomTabs();

			foreach ($cust_tubs as $cust_tub) {

				$data['product_product_descriptions'][] = [
					'product_description_id' => $cust_tub['id'],
					'name' => $cust_tub['name'],
					'front_name' => $cust_tub['front_name'],
					'product_product_description_description' =>
						[
							
							
							$data['config_language_id'] =>
								['text' => $cust_tub['text'],]
						],
				];

			}
			
			
			$data['checked_tab_products'] = [];
			$data['checked_tab_products_description'] = [];
			
			if(isset($this->request->get['product_id'])) {
				$checked_tab_products = $this->model_catalog_custom_tabs->getCheckedTabProducts($this->request->get['product_id']);
				foreach ($checked_tab_products as $value) {
					$data['checked_tab_products'][] = $value['id'];
				}
				$checked_tab_products_description = $this->model_catalog_custom_tabs->getCheckedTabProductsDescription($this->request->get['product_id']);
				foreach ($checked_tab_products_description as $value) {
					$data['checked_tab_products_description'][] = $value['id'];
				}
			}
			
			// Categories
			$this->load->model('catalog/category');
			
			if (isset($this->request->post['product_category'])) {
				$categories = $this->request->post['product_category'];
				} elseif (isset($this->request->get['product_id'])) {
				$categories = $this->model_purpletree_multivendor_sellerproduct->getProductCategories($this->request->get['product_id']);
				} else {
				$categories = array();
			}
			$data['purpletree_multivendor_seller_product_category'] = $this->config->get('purpletree_multivendor_seller_product_category');
			
			if($data['purpletree_multivendor_seller_product_category'] == 0){
				
				$data['product_categories'] = array();
				$data['entry_category'] = $this->language->get('entry_category');
				foreach ($categories as $category_id) {
					$category_info = $this->model_purpletree_multivendor_sellerproduct->getCategory($category_id);
					
					if ($category_info) {
						$data['product_categories'][] = array(
						'category_id' => $category_info['category_id'],
						'name'        => ($category_info['path']) ? $category_info['path'] . ' &gt; ' . $category_info['name'] : $category_info['name']
						);
					}
				}
				}else{
				$data['entry_categoryy'] = $this->language->get('entry_categoryy');
				$data['entry_select_category'] = $this->language->get('entry_select_category');
				$data11['category_type'] = $this->config->get('purpletree_multivendor_allow_categorytype');
				// $data11['category_allow'] = implode(',',$this->config->get('purpletree_multivendor_allow_category'));
				$allowed=array();
				if($this->config->get('purpletree_multivendor_allow_categorytype')) {
					$this->load->model('catalog/category');
					$results = $this->model_catalog_category->getCategories();
					foreach ($results as $result) {
						$allowed[] = $result['category_id'];
					}
					} else {
					$allowed =$this->config->get('purpletree_multivendor_allow_category');
				}
				$data11['category_allow'] = '';
				if(!empty($allowed)) {
					$data11['category_allow'] = implode(',',$allowed);
				}
				$data11['limit'] = 1000;
				$data11['start'] = 0;
				$data['product_categories'] = array();	         if($this->config->get('purpletree_multivendor_hide_seller_product_tab')) {
					$data['product_categories'] = $this->model_purpletree_multivendor_sellerproduct->getCategories11($data11);			
					}else{
					$data['product_categories'] = $this->model_purpletree_multivendor_sellerproduct->getCategories($data11);
				}
				$product_categoryy = array();
				if(!empty($categories)){
					foreach($categories as $procat){
						$product_categoryy[] = $procat;
						
					}
				}
				
				$data['product_categoryy'] = $product_categoryy;
				//////// For Sub category drop-down ///////// 
				if($this->config->get('purpletree_multivendor_hide_seller_product_tab')) {
					$parent = array();
					$childCats = array();
					if(!empty($categories)) {
						foreach($categories as $cattts) {
							$parent = $this->model_purpletree_multivendor_sellerproduct->getParentCategories($cattts);
							if(!empty($parent) && isset($parent['parent_id'])) {
								$childCats = $this->model_purpletree_multivendor_sellerproduct->getSubcategory($parent['parent_id']);
								
								if($parent['parent_id'] == 0) {
									$childCats = array();
									$parent = array();
									$parent = array(
									'parent_id' => $cattts
									);
									$childCats[] = array(
									'category_id' => $cattts,
									'name'	=> 'None'
									);
								}
							}
							break;
						}
					}			
					$data['parent'] = $parent;
					$data['childCats'] = $childCats;
					$data['sub_category'] = $this->language->get('sub_category');
					$data['none'] = $this->language->get('none');
				} 
				//////// For Sub category drop-down /////////
			}
			
			// Filters
			$this->load->model('catalog/filter');
			
			if (isset($this->request->post['product_filter'])) {
				$filters = $this->request->post['product_filter'];
				} elseif (isset($this->request->get['product_id'])) {
				$filters = $this->model_purpletree_multivendor_sellerproduct->getProductFilters($this->request->get['product_id']);
				} else {
				$filters = array();
			}
			
			$data['product_filters'] = array();
			
			foreach ($filters as $filter_id) {
				$filter_info = $this->model_catalog_filter->getFilter($filter_id);
				
				if ($filter_info) {
					$data['product_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
					);
				}
			}
			
			// Attributes
			$this->load->model('catalog/attribute');
			
			if (isset($this->request->post['product_attribute'])) {
				$product_attributes = $this->request->post['product_attribute'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_attributes = $this->model_purpletree_multivendor_sellerproduct->getProductAttributes($this->request->get['product_id']);
				} else {
				$product_attributes = array();
			}
			
			$data['product_attributes'] = array();
			
			foreach ($product_attributes as $product_attribute) {
				$attribute_info = $this->model_catalog_attribute->getAttribute($product_attribute['attribute_id']);
				
				if ($attribute_info) {
					$data['product_attributes'][] = array(
					'attribute_id'                  => $product_attribute['attribute_id'],
					'name'                          => $attribute_info['name'],
					'product_attribute_description' => $product_attribute['product_attribute_description']
					);
				}
			}
			
			// Options
			$this->load->model('catalog/option');
			
			if (isset($this->request->post['product_option'])) {
				$product_options = $this->request->post['product_option'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_options = $this->model_purpletree_multivendor_sellerproduct->getProductOptions($this->request->get['product_id']);
				} else {
				$product_options = array();
			}
			
			$data['product_options'] = array();
			
			foreach ($product_options as $product_option) {
				$product_option_value_data = array();
				
				if (isset($product_option['product_option_value'])) {
					foreach ($product_option['product_option_value'] as $product_option_value) {
						$product_option_value_data[] = array(
						'product_option_value_id' => $product_option_value['product_option_value_id'],
						'option_value_id'         => $product_option_value['option_value_id'],
						'quantity'                => $product_option_value['quantity'],
						'subtract'                => $product_option_value['subtract'],
						'price'                   => $product_option_value['price'],
						'price_prefix'            => $product_option_value['price_prefix'],
						'points'                  => $product_option_value['points'],
						'points_prefix'           => $product_option_value['points_prefix'],
						'weight'                  => $product_option_value['weight'],
						'weight_prefix'           => $product_option_value['weight_prefix']
						);
					}
				}
				
				$data['product_options'][] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => isset($product_option['value']) ? $product_option['value'] : '',
				'required'             => $product_option['required']
				);
			}
			
			$data['option_values'] = array();
			
			foreach ($data['product_options'] as $product_option) {
				if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
					if (!isset($data['option_values'][$product_option['option_id']])) {
						$data['option_values'][$product_option['option_id']] = $this->model_catalog_option->getOptionValues($product_option['option_id']);
					}
				}
			}
			
			$this->load->model('purpletree_multivendor/customer_group');
			
			$data['customer_groups'] = $this->model_purpletree_multivendor_customer_group->getCustomerGroups();
			///// RESTRICT PRODUCTS BY CUSTOMER GROUP  ///////
			$restrict_products_status = $this->model_purpletree_multivendor_sellerproduct->getModificationsForRestrictProduct();
			
			$data['restrict_products_status'] = $restrict_products_status;
			if(isset($restrict_products_status)){
				$this->model_purpletree_multivendor_sellerproduct->CreateCatalogTableProduct();
				
				if (isset($this->request->post['product_to_customer_group'])) {
					$data['product_to_customer_group'] = $this->request->post['product_to_customer_group'];
					} elseif (isset($this->request->get['product_id'])) {
					$data['product_to_customer_group'] = $this->model_purpletree_multivendor_sellerproduct->getProductByCustomerGroups($this->request->get['product_id']);
					} else {
					$data['product_to_customer_group'] = array(0);
				}
				$data['entry_customer_group'] = $this->language->get('entry_customer_group');
			}
			////// END RESTRICT PRODUCTS BY CUSTOMER GROUP ////////			
			
			if (isset($this->request->post['product_discount'])) {
				$product_discounts = $this->request->post['product_discount'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_discounts = $this->model_purpletree_multivendor_sellerproduct->getProductDiscounts($this->request->get['product_id']);
				} else {
				$product_discounts = array();
			}
			
			$data['product_discounts'] = array();
			
			foreach ($product_discounts as $product_discount) {
				$data['product_discounts'][] = array(
				'customer_group_id' => $product_discount['customer_group_id'],
				'quantity'          => $product_discount['quantity'],
				'priority'          => $product_discount['priority'],
				'price'             => $product_discount['price'],
				'date_start'        => ($product_discount['date_start'] != '0000-00-00') ? $product_discount['date_start'] : '',
				'date_end'          => ($product_discount['date_end'] != '0000-00-00') ? $product_discount['date_end'] : ''
				);
			}
			
			if (isset($this->request->post['product_special'])) {
				$product_specials = $this->request->post['product_special'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_specials = $this->model_purpletree_multivendor_sellerproduct->getProductSpecials($this->request->get['product_id']);
				} else {
				$product_specials = array();
			}
			
			$data['product_specials'] = array();
			
			foreach ($product_specials as $product_special) {
				$data['product_specials'][] = array(
				'customer_group_id' => $product_special['customer_group_id'],
				'priority'          => $product_special['priority'],
				'price'             => $product_special['price'],
				'date_start'        => ($product_special['date_start'] != '0000-00-00') ? $product_special['date_start'] : '',
				'date_end'          => ($product_special['date_end'] != '0000-00-00') ? $product_special['date_end'] :  ''
				);
			}
			
			// Image
			if (isset($this->request->post['image'])) {
				$data['image'] = $this->request->post['image'];
				} elseif (!empty($product_info)) {
				$data['image'] = $product_info['image'];
				} else {
				$data['image'] = '';
			}
			
			$this->load->model('tool/image');
			
			if (isset($this->request->post['image']) && is_file(DIR_IMAGE . $this->request->post['image'])) {
				/////S_img///////
				if(isset($img_mag_status)){
					$data['thumb'] = $this->getsmollsize($this->request->post['image']);
					}else{
					$data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
				}
				/////E_img///////
				} elseif (!empty($product_info) && is_file(DIR_IMAGE . $product_info['image'])) {
				/////S_img///////
				if(isset($img_mag_status)){
					
					$data['thumb'] = $this->getsmollsize($product_info['image']);
					//echo $data['thumb'];
					}else{				
					$data['thumb'] = $this->model_tool_image->resize($product_info['image'], 100, 100);
				}
				/////E_img//////
				} else {
				$data['thumb'] = $this->model_tool_image->resize('no_image.png', 100, 100);
			}
			
			/////S_img///////
			if(isset($img_mag_status)){
				$data['placeholder'] = $this->getsmollsize('no_image.png');	
			}
			else{
				
				$data['placeholder'] = $this->model_tool_image->resize('no_image.png', 100, 100);	
			}
			/////E_img///////	
			
			// Images
			if (isset($this->request->post['product_image'])) {
				$product_images = $this->request->post['product_image'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_images = $this->model_purpletree_multivendor_sellerproduct->getProductImages($this->request->get['product_id']);
				} else {
				$product_images = array();
			}
			
			$data['product_images'] = array();
			
			foreach ($product_images as $product_image) {
				if (is_file(DIR_IMAGE . $product_image['image'])) {
					$image = $product_image['image'];
					$thumb = $product_image['image'];
					} else {
					$image = '';
					$thumb = 'no_image.png';
				}
				//////S_img//////
				$thumbb = '';
				if(isset($img_mag_status)){
					$thumbb = $this->getsmollsize($thumb);			
				}
				else{
					$thumbb = $this->model_tool_image->resize($thumb, 100, 100);			
				}
				/////E_img///////
				
				$data['product_images'][] = array(
				'image'      => $image,
				'thumb'      => $thumbb,
				'sort_order' => $product_image['sort_order']
				);
			}
			
			// Downloads
			$this->load->model('catalog/download');
			
			if (isset($this->request->post['product_download'])) {
				$product_downloads = $this->request->post['product_download'];
				} elseif (isset($this->request->get['product_id'])) {
				$product_downloads = $this->model_purpletree_multivendor_sellerproduct->getProductDownloads($this->request->get['product_id']);
				} else {
				$product_downloads = array();
			}
			
			$data['product_downloads'] = array();
			
			foreach ($product_downloads as $download_id) {
				$download_info = $this->model_catalog_download->getDownload($download_id);
				
				if ($download_info) {
					$data['product_downloads'][] = array(
					'download_id' => $download_info['download_id'],
					'name'        => $download_info['name']
					);
				}
			}
			
			if (isset($this->request->post['product_related'])) {
				$products = $this->request->post['product_related'];
				} elseif (isset($this->request->get['product_id'])) {
				$products = $this->model_purpletree_multivendor_sellerproduct->getProductRelated($this->request->get['product_id']);
				} else {
				$products = array();
			}
			
			$data['product_relateds'] = array();
			
			foreach ($products as $product_id) {
				$related_info = $this->model_purpletree_multivendor_sellerproduct->getProduct($product_id);
				
				if ($related_info) {
					$data['product_relateds'][] = array(
					'product_id' => $related_info['product_id'],
					'name'       => $related_info['name']
					);
				}
			}
			
			if (isset($this->request->post['points'])) {
				$data['points'] = $this->request->post['points'];
				} elseif (!empty($product_info)) {
				$data['points'] = $product_info['points'];
				} else {
				$data['points'] = '';
			}
			
			/* if (isset($this->request->post['product_reward'])) {
				$data['product_reward'] = $this->request->post['product_reward'];
				} elseif (isset($this->request->get['product_id'])) {
				$data['product_reward'] = $this->model_purpletree_multivendor_sellerproduct->getProductRewards($this->request->get['product_id']);
				} else {
				$data['product_reward'] = array();
			} */
			$data['back'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
			$seller_id = $this->customer->getId();
			$data['purpletree_multivendor_subscription_plans'] = $this->config->get('purpletree_multivendor_subscription_plans');
			if($this->config->get('purpletree_multivendor_subscription_plans')){		
				$data['product_plan_info'] = $this->model_purpletree_multivendor_sellerproduct->productPlanInfo($seller_id);
			}
			$product_plan_name='';
			$featured_product_plan_name='';
			$category_featured_product_plan_name='';
			if(isset($this->request->get['product_id'])){
				$product_plan_name= $this->model_purpletree_multivendor_sellerproduct->productPlanName($this->request->get['product_id']);
				$featured_product_plan_name= $this->model_purpletree_multivendor_sellerproduct->featuredProductPlanName($this->request->get['product_id']);
				$category_featured_product_plan_name= $this->model_purpletree_multivendor_sellerproduct->categoryFeaturedProductPlanName($this->request->get['product_id']);
			}
			if (isset($this->request->post['product_plan_id'])) {
				$data['product_plan_id'] = $this->request->post['product_plan_id'];
				} elseif ($product_plan_name) {
				$data['product_plan_id'] =$this->model_purpletree_multivendor_sellerproduct->productPlanName($this->request->get['product_id']);
				} else {
				$data['product_plan_id'] = '';
			} 
			if (isset($this->request->post['featured_product_plan_id'])) {
				$data['featured_product_plan_id'] = $this->request->post['featured_product_plan_id'];
				} elseif ($featured_product_plan_name) {
				$data['featured_product_plan_id'] =$this->model_purpletree_multivendor_sellerproduct->featuredProductPlanName($this->request->get['product_id']);
				} else {
				$data['featured_product_plan_id'] = '';
			}
			if (isset($this->request->post['category_featured_product_plan_id'])) {
				$data['category_featured_product_plan_id'] = $this->request->post['category_featured_product_plan_id'];
				} elseif ($category_featured_product_plan_name) {
				$data['category_featured_product_plan_id'] =$this->model_purpletree_multivendor_sellerproduct->categoryFeaturedProductPlanName($this->request->get['product_id']);
				} else {
				$data['category_featured_product_plan_id'] = '';
			}
			
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/datetimepicker/moment.js'); 
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js'); 
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
			$this->document->addScript('catalog/view/javascript/purpletree/summernote/summernote.js'); 
			$this->document->addStyle('catalog/view/javascript/purpletree/summernote/summernote.css');
			$this->document->addScript('catalog/view/javascript/purpletree/summernote/opencart.js'); 
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			if($this->config->get('purpletree_multivendor_hide_seller_product_tab')) {
				$this->response->setOutput($this->load->view('account/purpletree_multivendor/product_form_hideninfo', $data));
			}else{
				$this->response->setOutput($this->load->view('account/purpletree_multivendor/product_form_new', $data));
			}
		}
		
		public function delete() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
		$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellerproduct');
			$img_mag_status = $this->model_purpletree_multivendor_sellerproduct->getModifications();///img status
			if (isset($this->request->post['selected1'])) {
				$this->request->post['selected'] = $this->request->post['selected1'];
			}
			if (isset($this->request->post['selected'])) {	
				foreach ($this->request->post['selected'] as $product_id) {
					if(isset($img_mag_status)){
						//echo $product_id ; die;
						$this->delProductImage($product_id);// delProductAndImg simple store///img
					}
					$this->model_purpletree_multivendor_sellerproduct->deleteProduct($product_id);
				}
			 
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['filter_name'])) {
					$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_model'])) {
					$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_price'])) {
					$url .= '&filter_price=' . $this->request->get['filter_price'];
				}
				
				if (isset($this->request->get['filter_quantity'])) {
					$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
				}
				
				if (isset($this->request->get['filter_status'])) {
					$url .= '&filter_status=' . $this->request->get['filter_status'];
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct','', true));
			}
			
			$this->getList();
		}
		
		protected function getList(){
			
			if (isset($this->request->get['filter_name'])) {
				$filter_name = $this->request->get['filter_name'];
				} else {
				$filter_name = null;
			}
			
			if (isset($this->request->get['filter_model'])) {
				$filter_model = $this->request->get['filter_model'];
				} else {
				$filter_model = null;
			}
			
			if (isset($this->request->get['filter_price'])) {
				$filter_price = $this->request->get['filter_price'];
				} else {
				$filter_price = null;
			}
			
			if (isset($this->request->get['filter_quantity'])) {
				$filter_quantity = $this->request->get['filter_quantity'];
				} else {
				$filter_quantity = null;
			}
			
			if (isset($this->request->get['filter_status'])) {
				$filter_status = $this->request->get['filter_status'];
				} else {
				$filter_status = null;
			}
			
			if (isset($this->request->get['sort'])) {
				$sort = $this->request->get['sort'];
				} else {
				$sort = 'pd.name';
			}
			
			if (isset($this->request->get['order'])) {
				$order = $this->request->get['order'];
				} else {
				$order = 'ASC';
			}
			
			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
				} else {
				$page = 1;
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			//Help code///	
			$data['helplink'] = "https://www.purpletreesoftware.com/knowledgebase/tag/opencart-multivendor-seller-product";
			if (defined ('DISABLED_PTS_HELP')){if(DISABLED_PTS_HELP == 0){$data['helpcheck'] = 1;}else{$data['helpcheck'] = 0;}}else{$data['helpcheck'] = 1;}
			if ($this->request->server['HTTPS']) {$data['helpimage'] = HTTPS_SERVER . 'image/catalog/help.png'; } else {$data['helpimage'] = HTTP_SERVER . 'image/catalog/help.png';}
			/// End Help code///
			$data['breadcrumbs'] = array();
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home','',true)
			);
			
			$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('account/purpletree_multivendor/sellerproduct', $url, true)
			);
			
			
			$data['enabledproduct'] = $this->url->link('account/purpletree_multivendor/sellerproduct/enabledproduct', $url, true);
			
			$data['disabledproduct'] = $this->url->link('account/purpletree_multivendor/sellerproduct/disabledproduct', $url, true);
			$data['purpletree_multivendor_seller_category_featured'] = $this->config->get('purpletree_multivendor_seller_category_featured');
			$data['purpletree_multivendor_seller_featured_products'] = $this->config->get('purpletree_multivendor_seller_featured_products');
			
			if (isset($this->error['warning'])) {
				$data['error_warning'] = $this->error['warning'];
				} else {
				$data['error_warning'] = '';
			}
			
			if (isset($this->session->data['success'])) {
				$data['success'] = $this->session->data['success'];
				
				unset($this->session->data['success']);
				} else {
				$data['success'] = '';
			}
			
			if (isset($this->session->data['error_warning'])) {
				$data['error_warning'] = $this->session->data['error_warning'];
				
				unset($this->session->data['error_warning']);
				} else {
				$data['error_warning'] = '';
			}
			$seller_plan_sataus = 0;
			//////  check for subscription plan status   /////// 
			if($this->config->get('purpletree_multivendor_subscription_plans')){
				$total_store_Product=array();
				$total_plan_Product=array();
				
				$total_store_Product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalProduct($this->customer->getId());
				if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
					$total_plan_Product = $this->model_purpletree_multivendor_sellerproduct->getNoOfProductForMultiplePlan($this->customer->getId());
					} else {
					$total_plan_Product = $this->model_purpletree_multivendor_sellerproduct->getNoOfProduct($this->customer->getId());
				}
				
				if($total_store_Product['total_product']>0){
					$store_product=$total_store_Product['total_product'];			
					} else {
					$store_product=0;	
				}
				if(!empty($total_plan_Product['no_of_product'])){
				if($total_plan_Product['no_of_product']>0){
					$plan_product=$total_plan_Product['no_of_product'];			
					} else {
					$plan_product=0;	
				}
			}
				
				
				if(isset($plan_product)){
					
					if($plan_product > $store_product){
						
						
						$data['copy'] = $this->url->link('account/purpletree_multivendor/sellerproduct/copy', $url, true);			
						
						} else {
						//$this->session->data['error_warning']=$this->language->get('error_subscription_plan_limit');
						
						
						$data['copy'] = $this->url->link('account/purpletree_multivendor/sellerproduct', $url, true);			
						
					}
					} else {
					$this->session->data['error_warning']=$this->language->get('error_subscription_plan');
					
					
				}
				
				$getSsellerplanStatus = $this->model_purpletree_multivendor_sellerproduct->getSsellerplanStatus($this->customer->getId());
				$invoiceStatus = $this->model_purpletree_multivendor_sellerproduct->getInvoiceStatus($this->customer->getId());
				
				
				
				if(!$getSsellerplanStatus || ($invoiceStatus==NULL || $invoiceStatus!=2) ) {
					$this->session->data['error_warning']=$this->language->get('error_subscription_plan');
					
					$data['copy'] = $this->url->link('account/purpletree_multivendor/sellerproduct', $url, true);
					$seller_plan_sataus = 1;		
				}	
				} else {
				
				$data['copy'] = $this->url->link('account/purpletree_multivendor/sellerproduct/copy', $url, true);
				
			}
			//////  End check for subscription plan status   /////// 
			$data['add'] = $this->url->link('account/purpletree_multivendor/sellerproduct/add', $url, true);
			$data['product_buttonhide'] = '';
			$data['product_buttonhide'] = $this->config->get('purpletree_multivendor_featured_enabled_hide_edit');
			$data['delete'] = $this->url->link('account/purpletree_multivendor/sellerproduct/delete', $url, true);
			//$data['copy'] = $this->url->link('account/purpletree_multivendor/sellerproduct/copy', $url, true);
			
			$data['products'] = array();
			
			$filter_data = array(
			'filter_name'	  => $filter_name,
			'filter_model'	  => $filter_model,
			'filter_price'	  => $filter_price,
			'filter_quantity' => $filter_quantity,
			'filter_status'   => $filter_status,
			'sort'            => $sort,
			'order'           => $order,
			'start'           => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit'           => $this->config->get('config_limit_admin'),
			'seller_id'		  => $this->customer->getId()	
			);
			if($this->config->get('purpletree_multivendor_products_view')== !null){
			      $data['product_view'] = $this->config->get('purpletree_multivendor_products_view');
				}else{
				  $data['product_view'] = 0;
				}
			$product_total = $this->model_purpletree_multivendor_sellerproduct->getTotalSellerProducts($filter_data);
			$seller_id = $this->customer->getId();	
			$results = $this->model_purpletree_multivendor_sellerproduct->getSellerProducts($filter_data);
			
			$this->load->model('tool/image');
			
			foreach ($results as $result) {
				if (is_file(DIR_IMAGE . $result['image'])) {
					$image = $this->model_tool_image->resize($result['image'], 40, 40);
					$image2 = $this->model_tool_image->resize($result['image'], 228, 228);
					} else {
					$image = $this->model_tool_image->resize('no_image.png', 40, 40);
				    $image2 = $this->model_tool_image->resize('no_image.png', 228, 228);
				}
				
				$special = false;
				
				$product_specials = $this->model_purpletree_multivendor_sellerproduct->getProductSpecials($result['product_id']);
				
				foreach ($product_specials  as $product_special) {
					if (($product_special['date_start'] == '0000-00-00' || strtotime($product_special['date_start']) < time()) && ($product_special['date_end'] == '0000-00-00' || strtotime($product_special['date_end']) > time())) {
						//$special = $product_special['price'];
						$special = $this->currency->format($product_special['price'],  $this->session->data['currency']);
						break;
					}
				}
				if($result['product_id']){
					$featuredProductPlan = 0;
					$categoryFeaturedProductPlan = 0;
					if($this->config->get('purpletree_multivendor_subscription_plans')){
						$featuredProductPlan = $this->model_purpletree_multivendor_sellerproduct->featuredProductPlanName($result['product_id']);
						if(($featuredProductPlan > 0) && ($featuredProductPlan != NULL)){
							$is_featured = 1;
							}else{
							$is_featured = 0;
						}
						$categoryFeaturedProductPlan = $this->model_purpletree_multivendor_sellerproduct->categoryFeaturedProductPlanName($result['product_id']);
						if(($categoryFeaturedProductPlan > 0)&& ($categoryFeaturedProductPlan != NULL)){
							$is_category_featured = 1;
							}else{
							$is_category_featured = 0;
						}
						}else{
						$is_featured = $result['is_featured'];
						$is_category_featured = $result['is_category_featured'];
					}
				}
				$price = $this->currency->format(($result['price']),  $this->session->data['currency']);
				$data['products'][] = array(
				'product_id' => $result['product_id'],
				'image'      => $image,
				'name'       => $result['name'],
				'model'      => $result['model'],
				'price'      => $price,
				'image2'      => $image2,
				'product_total'      => $product_total,
				'color'     => $result['status'] ? '#5cb85c' : '#c73e38',
				'special'    => $special,
				'quantity'   => $result['quantity'],
				'status'     => $result['status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled'),
				'statusid'     => $result['status'],
				'is_approved'     => $result['is_approved'] ? $this->language->get('text_yes') : $this->language->get('text_no'),
				'is_featured'      => $is_featured,
				'is_category_featured'      => $is_category_featured,
				'seller_plan_sataus'      => $seller_plan_sataus,
				'edit'       => $this->url->link('account/purpletree_multivendor/sellerproduct/edit', '&product_id=' . $result['product_id'].$url, true)
				);
			}
			
			$data['heading_title'] = $this->language->get('heading_title');
			$data['entry_date_start'] = $this->language->get('entry_date_start');
			$data['entry_date_end'] = $this->language->get('entry_date_end');
			$data['button_remove'] = $this->language->get('button_remove');
			$data['entry_required'] = $this->language->get('entry_required');
			$data['text_yes'] = $this->language->get('text_yes');
			$data['text_no'] = $this->language->get('text_no');
			$data['entry_option_value'] = $this->language->get('entry_option_value');
			$data['entry_subtract'] = $this->language->get('entry_subtract');
			$data['entry_option_points'] = $this->language->get('entry_option_points');
			$data['entry_weight'] = $this->language->get('entry_weight');
			$data['button_option_value_add'] = $this->language->get('button_option_value_add');
			$data['entry_points'] = $this->language->get('entry_points');
			$data['title_quick_edit'] = $this->language->get('title_quick_edit');
			$data['productedit']       = $this->url->link('account/purpletree_multivendor/sellerproduct/edit',$url, true);
			$data['text_list'] = $this->language->get('text_list');
			$data['text_enabled'] = $this->language->get('text_enabled');
			$data['text_disabled'] = $this->language->get('text_disabled');
			$data['text_no_results'] = $this->language->get('text_no_results');
			$data['text_sort'] = $this->language->get('text_sort');
			$data['entry_priority'] = $this->language->get('entry_priority');
			$data['text_confirm'] = $this->language->get('text_confirm');
			$data['text_all'] = $this->language->get('text_all');
			$data['column_image'] = $this->language->get('column_image');
			$data['column_name'] = $this->language->get('column_name');
			$data['column_model'] = $this->language->get('column_model');
			$data['column_price'] = $this->language->get('column_price');
			$data['column_quantity'] = $this->language->get('column_quantity');
			$data['column_status'] = $this->language->get('column_status');
			$data['column_action'] = $this->language->get('column_action');
			$data['column_approved'] = $this->language->get('column_approved');
			$data['column_featured_product'] = $this->language->get('column_featured_product');
			$data['column_cataegory_featured_product'] = $this->language->get('column_cataegory_featured_product');				
			$data['entry_name'] = $this->language->get('entry_name');
			$data['entry_model'] = $this->language->get('entry_model');
			$data['entry_price'] = $this->language->get('entry_price');
			$data['entry_quantity'] = $this->language->get('entry_quantity');
			$data['entry_status'] = $this->language->get('entry_status');
			$data['entry_image'] = $this->language->get('entry_image');
			
			$data['button_copy'] = $this->language->get('button_copy');
			$data['button_add'] = $this->language->get('button_add');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['button_delete'] = $this->language->get('button_delete');
			$data['button_filter'] = $this->language->get('button_filter');
			$data['button_enabled'] = $this->language->get('button_enabled');
			$data['button_disabled'] = $this->language->get('button_disabled');
			$data['button_edit'] = $this->language->get('button_edit');
			$data['error_vacation'] = $this->language->get('error_vacation');
			$data['entry_subscription_plans'] = $this->language->get('entry_subscription_plans');
			$data['button_save'] = $this->language->get('button_save');
			$data['entry_special_price'] = $this->language->get('entry_special_price');
			$data['entry_customer_group'] = $this->language->get('entry_customer_group');
			$data['entry_option'] = $this->language->get('entry_option');
			$data['button_cancel'] = $this->language->get('button_cancel');
			
			
			$this->load->model('localisation/language');
			
			$data['languages'] = $this->model_localisation_language->getLanguages();
			foreach($data['languages'] as $key => $value) {
				$data['languages'][$key]['activetab'] = '';
			}
			foreach($data['languages'] as $key => $value) {
				$data['languages'][$key]['activetab'] = 'active';
				break;
			}
			
			if (isset($this->request->post['selected'])) {
				$data['selected'] = (array)$this->request->post['selected'];
				} else {
				$data['selected'] = array();
			}
			if (isset($this->request->post['selected1'])) {
				$data['selected'] = (array)$this->request->post['selected1'];
				} else {
				$data['selected'] = array();
			}
			
			$url = '';
			$data['sorts_order'] = array();
			
			$data['sorts_order'][] = array(
			'text'  => $this->language->get('text_name_asc'),
			'value' => 'ASC',
			'href'  => $this->url->link('account/purpletree_multivendor/sellerproduct', '&order=ASC' . $url,true)
			);
			
			$data['sorts_order'][] = array(
			'text'  => $this->language->get('text_name_desc'),
			'value' => 'DESC',
			'href'  => $this->url->link('account/purpletree_multivendor/sellerproduct','&order=DESC' . $url,true)
			);
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			$seller_id = $this->customer->getId();
			$data['purpletree_multivendor_subscription_plans'] = $this->config->get('purpletree_multivendor_subscription_plans');
			if($this->config->get('purpletree_multivendor_subscription_plans')){		
				$data['product_plan_info'] = $this->model_purpletree_multivendor_sellerproduct->productPlanInfo($seller_id);
			}
			$this->load->model('purpletree_multivendor/customer_group');
			$data['customer_groups'] = $this->model_purpletree_multivendor_customer_group->getCustomerGroups();
			//echo "<pre>"; print_r($data['customer_groups']); die;
			$pagination = new Pagination();
			$pagination->total = $product_total;
			$pagination->page = $page;
			$pagination->limit = $this->config->get('config_limit_admin');
			$pagination->url = $this->url->link('account/purpletree_multivendor/sellerproduct', $url . '&page={page}', true);
			
			$data['pagination'] = $pagination->render();
			
			$data['results'] = sprintf($this->language->get('text_pagination'), ($product_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($product_total - $this->config->get('config_limit_admin'))) ? $product_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $product_total, ceil($product_total / $this->config->get('config_limit_admin')));
			
			$data['filter_name'] = $filter_name;
			$data['filter_model'] = $filter_model;
			$data['filter_price'] = $filter_price;
			$data['filter_quantity'] = $filter_quantity;
			$data['filter_status'] = $filter_status;
			
			$data['sort'] = $sort;
			$data['order'] = $order;
			
			$this->document->addScript('catalog/view/javascript/purpletree/jquery/datetimepicker/moment.js'); 
			$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js'); 
			$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');
			$this->document->addScript('catalog/view/javascript/purpletree/summernote/summernote.js'); 
			$this->document->addStyle('catalog/view/javascript/purpletree/summernote/summernote.css');
			$this->document->addScript('catalog/view/javascript/purpletree/summernote/opencart.js');
			$data['column_left'] = $this->load->controller('account/purpletree_multivendor/common/column_left');
			$data['footer'] = $this->load->controller('account/purpletree_multivendor/common/footer');
			$data['header'] = $this->load->controller('account/purpletree_multivendor/common/header');
			
			$this->response->setOutput($this->load->view('account/purpletree_multivendor/product_list', $data));
		}
		
		protected function validateForm() {
			foreach ($this->request->post['product_description'] as $language_id => $value) {
				if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 120)) {
					$this->error['name'][$language_id] = $this->language->get('error_name');
				}
				
				/* if ((utf8_strlen($value['meta_title']) < 3) || (utf8_strlen($value['meta_title']) > 255)) {
					$this->error['meta_title'][$language_id] = $this->language->get('error_meta_title');
				} */
				if($this->config->get('purpletree_multivendor_hide_seller_product_tab')) {
					if ((utf8_strlen($value['tag']) < 3) || (utf8_strlen($value['tag']) > 120)) {
						$this->error['tag'][$language_id] = $this->language->get('error_tag');
					} 
				}
			}
			
			//// feature product plan validation ////////
			if($this->config->get('purpletree_multivendor_subscription_plans')) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				$seller_id = $this->customer->getId();
				$catgory_featured_plan_product = array();
				$catgory_featured_total_product = array();
				$featured_plan_product = array();
				$featured_total_product = array();
				if(isset($this->request->post['category_featured_product_plan_id']) && $this->request->post['category_featured_product_plan_id'] != 0 ) {		
					$catgory_featured_plan_product = $this->model_purpletree_multivendor_sellerproduct->getCatgoryFeaturedPlanProduct($this->request->post['category_featured_product_plan_id']);			
					$catgory_featured_total_product = $this->model_purpletree_multivendor_sellerproduct->getCatgoryFeaturedTotalProduct($this->request->post['category_featured_product_plan_id'], $seller_id);			
					if($catgory_featured_total_product >= $catgory_featured_plan_product){
						$this->error['error_category_featured_product_plan_id'] = $this->language->get('error_category_featured_product_plan_id');	
					}
				}
				if(isset($this->request->post['featured_product_plan_id']) && $this->request->post['featured_product_plan_id'] != 0 ) {
					$featured_plan_product = $this->model_purpletree_multivendor_sellerproduct->getFeaturedPlanProduct($this->request->post['featured_product_plan_id']);
					$featured_total_product = $this->model_purpletree_multivendor_sellerproduct->getFeaturedTotalProduct($this->request->post['featured_product_plan_id'], $seller_id);	
					if($featured_total_product >= $featured_plan_product){
						$this->error['error_featured_product_plan_id'] = $this->language->get('error_featured_product_plan_id');	
					}  
					
				}
			}
			//// End feature product plan validation ////////
			if(!isset($this->request->post['product_name'])){
			foreach ($this->request->post['product_description'] as $language_id => $value) {
				if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
					$this->error['name'][$language_id] = $this->language->get('error_name');
				}
				if($this->config->get('module_purpletree_multivendor_hide_seller_product_tab')) {
					if ((utf8_strlen($value['tag']) < 3) || (utf8_strlen($value['tag']) > 120)) {
						$this->error['tag'][$language_id] = $this->language->get('error_tag');
					} 
				}
				
			}
		}
			if($this->config->get('purpletree_multivendor_hide_seller_product_tab')) {
				if($this->config->get('purpletree_multivendor_seller_product_category')) {
					if(empty($this->request->post['product_category'])) {
						$this->error['error_product_category'] = $this->language->get('error_product_category');
						} else {
						foreach($this->request->post['product_category'] as $value) {
							if($value == '') {					
								$this->error['error_product_category'] = $this->language->get('error_product_category');
								break;
							}				
						}
					}
				}
			}
			if (isset($this->request->post['keyword']) && utf8_strlen($this->request->post['keyword']) > 0) {
				$this->load->model('catalog/url_alias');
				
				$url_alias_info = $this->model_catalog_url_alias->getUrlAlias($this->request->post['keyword']);
				
				if ($url_alias_info && isset($this->request->get['product_id']) && $url_alias_info['query'] != 'product_id=' . $this->request->get['product_id']) {
					$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
				}
				
				if ($url_alias_info && !isset($this->request->get['product_id'])) {
					$this->error['keyword'] = sprintf($this->language->get('error_keyword'));
				}
			}
			
			if ($this->error && !isset($this->error['warning'])) {
				$this->error['warning'] = $this->language->get('error_warning');
			}
			
			return !$this->error;
		}
		
		public function change_is_featured() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$json['status'] = 'error'; 
			$json['message'] = 'Something went wrong'; 
			if (isset($this->request->get['product_id']) && $this->request->get['product_id'] != '') {
				if ($this->request->get['value'] == 'true') {
					$value = 1;
					} else {
					$value = 0;
				}
				$this->load->model('purpletree_multivendor/sellerproduct');
				//
				if($this->config->get('purpletree_multivendor_subscription_plans')){
					if($value == 1) {
						$total_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalFeaturedProduct($this->customer->getId(),$this->request->get['product_id']);
						
						if($total_featured_product==NULL){
							$total_featured_product =0;	
						}
						if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
							$allowed_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedFeaturedProductForMultiplePlan($this->customer->getId());
							} else {
							$allowed_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedFeaturedProduct($this->customer->getId());
						}	
						
						if($allowed_featured_product==NULL){
							$allowed_featured_product=0;			
						}
						
						/* $total_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalCategpryFeaturedProduct($this->customer->getId());
							if($total_featured_product==NULL){
							$total_featured_product =0;	
							}
							$allowed_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedCategoryFeaturedProduct($this->customer->getId());
							if($allowed_featured_product==NULL){
							$allowed_featured_product=0; 			
						} */
						if( $allowed_featured_product > $total_featured_product){
							$this->model_purpletree_multivendor_sellerproduct->change_is_featured($this->request->get['product_id'],$value);
							$json['status'] = 'success'; 	
							$json['message'] = $this->language->get('text_assigned'); 
							} else {
							$json['status'] = 'error'; 	
							$json['message'] = $this->language->get('error_featured_product');
						}
						} else {
						$this->model_purpletree_multivendor_sellerproduct->change_is_featured($this->request->get['product_id'],$value);
						$json['message'] = $this->language->get('text_unAssigned'); 
						$json['status'] = 'success'; 
					}			
					} else {
					//
					$this->model_purpletree_multivendor_sellerproduct->change_is_featured($this->request->get['product_id'],$value);
					if($value == 1) {
						$json['message'] = $this->language->get('text_assigned'); 
						} else {
						$json['message'] = $this->language->get('text_unAssigned'); 
						
					}
					$json['status'] = 'success'; 
					$json['value'] = $value; 
					$product_id='';
					if(isset($this->request->get['product_id'])){
						$product_id=$this->request->get['product_id'];
					}
					$json['product_id'] = $product_id;
				}
				
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function change_is_category_featured() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$json['status'] = 'error'; 
			$json['message'] = 'Something went wrong'; 
			if (isset($this->request->get['product_id']) && $this->request->get['product_id'] != '') {
				if ($this->request->get['value'] == 'true') {
					$value = 1;
					} else {
					$value = 0;
				}
				$this->load->model('purpletree_multivendor/sellerproduct');
				//
				if($this->config->get('purpletree_multivendor_subscription_plans')){
					if($value == 1) {
						
						
						$total_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerTotalCategpryFeaturedProduct($this->customer->getId(),$this->request->get['product_id']);
						if($total_category_featured_product==NULL){
							$total_category_featured_product =0;	
						}
						if($this->config->get('purpletree_multivendor_multiple_subscription_plan_active')){
							$allowed_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedCategoryFeaturedProductForMultiplePlan($this->customer->getId());
							} else {			
							$allowed_category_featured_product = $this->model_purpletree_multivendor_sellerproduct->sellerAllowedCategoryFeaturedProduct($this->customer->getId());		
						}
						if($allowed_category_featured_product==NULL){
							$allowed_category_featured_product=0; 			
						} 
						
						if( $allowed_category_featured_product > $total_category_featured_product){
							$this->model_purpletree_multivendor_sellerproduct->change_is_category_featured($this->request->get['product_id'],$value);
							$json['status'] = 'success'; 	
							$json['message'] = $this->language->get('text_assigned'); 
							} else {
							$json['status'] = 'error'; 	
							$json['message'] = $this->language->get('error_category_featured_product');
						}
						} else {
						$this->model_purpletree_multivendor_sellerproduct->change_is_category_featured($this->request->get['product_id'],$value);
						$json['message'] = $this->language->get('text_unAssigned'); 
						$json['status'] = 'success'; 
					}			
					} else {
					//
					$this->model_purpletree_multivendor_sellerproduct->change_is_category_featured($this->request->get['product_id'],$value);
					if($value == 1) {
						$json['message'] = $this->language->get('text_assigned'); 
						} else {
						$json['message'] = $this->language->get('text_unAssigned'); 
						
					}
					$json['status'] = 'success'; 
				}
				$json['value'] = $value;
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}	
		
		public function autocomplete() {
			$json = array();
			
			if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
				
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}
				
				if (isset($this->request->get['filter_model'])) {
					$filter_model = $this->request->get['filter_model'];
					} else {
					$filter_model = '';
				}
				
				if (isset($this->request->get['limit'])) {
					$limit = $this->request->get['limit'];
					} else {
					$limit = 5;
				}
				$seller_id = $this->customer->getId();
				$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit,
				'seller_id' => $seller_id
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getProducts($filter_data);
				
				foreach ($results as $result) {
					$option_data = array();
					
					$product_options = $this->model_purpletree_multivendor_sellerproduct->getProductOptions($result['product_id']);
					
					foreach ($product_options as $product_option) {
						$option_info = $this->model_purpletree_multivendor_sellerproduct->getOptions($product_option['option_id']);
						
						if ($option_info) {
							$product_option_value_data = array();
							
							foreach ($product_option['product_option_value'] as $product_option_value) {
								$option_value_info = $this->model_purpletree_multivendor_sellerproduct->getOptionValue($product_option_value['option_value_id']);
								
								if ($option_value_info) {
									$product_option_value_data[] = array(
									'product_option_value_id' => $product_option_value['product_option_value_id'],
									'option_value_id'         => $product_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $product_option_value['price_prefix']
									);
								}
							}
							
							$option_data[] = array(
							'product_option_id'    => $product_option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $product_option['option_id'],
							//'name'                 => $option_info['name'],
							//'type'                 => $option_info['type'],
							'value'                => $product_option['value'],
							'required'             => $product_option['required']
							);
						}
					}
					
					$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
					);
				}
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function manufacturer() {
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getManufacturers($filter_data);
				
				foreach ($results as $result) {
					$json[] = array(
					'manufacturer_id' => $result['manufacturer_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function category() {
			$json = array();
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
							
				$this->load->model('purpletree_multivendor/dashboard');
			
				$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
				$allowed=array();
				if($this->config->get('purpletree_multivendor_allow_categorytype')) {
					$this->load->model('catalog/category');
					$results = $this->model_catalog_category->getCategories();
					foreach ($results as $result) {
						$allowed[] = $result['category_id'];
					}
					} else {
					$allowed = $this->config->get('purpletree_multivendor_allow_category');
				}
				$dddsds = '';
				if(!empty($allowed)) {
					$dddsds = implode(',',$allowed);
				}
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'sort'        => 'name',
				'order'       => 'ASC',
				'start'       => 0,
				'limit'       => 5,
				'category_type' => ($this->config->get('purpletree_multivendor_allow_categorytype')),
				'category_allow' => $dddsds,
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getCategories($filter_data);
				
				foreach ($results as $result) {
					$json[] = array(
					'category_id' => $result['category_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function filter() {
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
							
				$this->load->model('purpletree_multivendor/dashboard');
			
				$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				
				$filters = $this->model_purpletree_multivendor_sellerproduct->getFilters($filter_data);
				
				foreach ($filters as $filter) {
					$json[] = array(
					'filter_id' => $filter['filter_id'],
					'name'      => strip_tags(html_entity_decode($filter['group'] . ' &gt; ' . $filter['name'], ENT_QUOTES, 'UTF-8'))
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function download() {
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5,
				'seller_id'		  => $this->customer->getId()
				);
				
				$results = $this->model_purpletree_multivendor_sellerproduct->getDownloads($filter_data);
				
				foreach ($results as $result) {
					$json[] = array(
					'download_id' => $result['download_id'],
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function product() {
			$json = array();
			
			if (isset($this->request->get['filter_name']) || isset($this->request->get['filter_model'])) {
				$this->load->model('catalog/product');
				$this->load->model('catalog/option');
				
				if (isset($this->request->get['filter_name'])) {
					$filter_name = $this->request->get['filter_name'];
					} else {
					$filter_name = '';
				}
				
				if (isset($this->request->get['filter_model'])) {
					$filter_model = $this->request->get['filter_model'];
					} else {
					$filter_model = '';
				}
				
				if (isset($this->request->get['limit'])) {
					$limit = $this->request->get['limit'];
					} else {
					$limit = 5;
				}
				
				$seller_id = $this->customer->getId();
				
				$filter_data = array(
				'filter_name'  => $filter_name,
				'filter_model' => $filter_model,
				'start'        => 0,
				'limit'        => $limit,
				'seller_id'        => $seller_id
				);
				
				$this->load->model('purpletree_multivendor/sellerproduct');
				$results = $this->model_purpletree_multivendor_sellerproduct->getProducts($filter_data);
				
				foreach ($results as $result) {
					$option_data = array();
					
					$product_options = $this->model_catalog_product->getProductOptions($result['product_id']);
					
					foreach ($product_options as $product_option) {
						$option_info = $this->model_catalog_option->getOption($product_option['option_id']);
						
						if ($option_info) {
							$product_option_value_data = array();
							
							foreach ($product_option['product_option_value'] as $product_option_value) {
								$option_value_info = $this->model_catalog_option->getOptionValue($product_option_value['option_value_id']);
								
								if ($option_value_info) {
									$product_option_value_data[] = array(
									'product_option_value_id' => $product_option_value['product_option_value_id'],
									'option_value_id'         => $product_option_value['option_value_id'],
									'name'                    => $option_value_info['name'],
									'price'                   => (float)$product_option_value['price'] ? $this->currency->format($product_option_value['price'], $this->config->get('config_currency')) : false,
									'price_prefix'            => $product_option_value['price_prefix']
									);
								}
							}
							
							$option_data[] = array(
							'product_option_id'    => $product_option['product_option_id'],
							'product_option_value' => $product_option_value_data,
							'option_id'            => $product_option['option_id'],
							'name'                 => $option_info['name'],
							'type'                 => $option_info['type'],
							'value'                => $product_option['value'],
							'required'             => $product_option['required']
							);
						}
					}
					
					$json[] = array(
					'product_id' => $result['product_id'],
					'name'       => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'model'      => $result['model'],
					'option'     => $option_data,
					'price'      => $result['price']
					);
				}
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function attribute() {
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->model('purpletree_multivendor/sellerproduct');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				$this->load->model('purpletree_multivendor/sellerattribute');
				// attribute sets
				$datag = $this->model_purpletree_multivendor_sellerattribute->getOtherSellerAttributeGroups();
				$attributearray =array();
				if(!empty($datag)){
					foreach($datag as $datagg){
						$attributearray[] = $datagg['attribute_group_id'];
					}
				}
				$stringgattrsets = '';
				if(!empty($attributearray)) {
					$stringgattrsets = implode(',',$attributearray);
				}
				// attribute sets
				// attributes
				$dataga = $this->model_purpletree_multivendor_sellerattribute->getOtherSellerAttributes();
				$attributearraya =array();
				if(!empty($dataga)){
					foreach($dataga as $datagga){
						$attributearraya[] = $datagga['attribute_id'];
					}
				}
				$stringgattrs = '';
				if(!empty($attributearraya)) {
					$stringgattrs = implode(',',$attributearraya);
				}
				// attributes
				$results = $this->model_purpletree_multivendor_sellerproduct->getAttributes($filter_data,$stringgattrsets,$stringgattrs);
				
				foreach ($results as $result) {
					$json[] = array(
					'attribute_id'    => $result['attribute_id'],
					'name'            => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8')),
					'attribute_group' => $result['attribute_group']
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
	    public function enabledproduct() {
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellerproduct');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$checkSellerVacation = $this->model_purpletree_multivendor_sellerproduct->checkSellerVacationProduct($this->customer->getId());
			if($checkSellerVacation>=1){	
				$this->session->data['error_warning'] = $this->language->get('error_vacation');	
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			if (isset($this->request->post['selected1'])) {
				$this->request->post['selected'] = $this->request->post['selected1'];
			}
			if (isset($this->request->post['selected']) && !empty($this->request->post['selected'])) {
				
				
				
				if($this->config->get('purpletree_multivendor_product_approval')){
					
					$this->session->data['error_warning'] = 'Product Seller Approval Required';
					
					} else {
					if($this->config->get('purpletree_multivendor_subscription_plans')){
						$plan_status = $this->model_purpletree_multivendor_sellerproduct->getEnableProductList($this->customer->getId());
						$plan_product=array();
						if(!empty($plan_status)){
							foreach($plan_status as $kkk=>$ppp){
								$plan_product[]=$ppp['product_id'];
							}
						}
						
						$selected_product=array();
						if(!empty($this->request->post['selected'])){
							foreach($this->request->post['selected'] as $kkkk=>$pppp){
								if(in_array($pppp,$plan_product)){
									$selected_product[]=$pppp;	
								}
							}
						}
						$this->request->post['selected']=array();
						$this->request->post['selected']=$selected_product;
						$plan_status = $this->model_purpletree_multivendor_sellerproduct->sellerTotalPlanStatus($this->customer->getId());
					if(!empty($plan_status['status_id'])){	
						if($plan_status['status_id']==0){
							$this->session->data['error_warning']= $this->language->get('error_subscription_plan_status');
							$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));			
						}
					}
					}				
					$success=array();
					$error=array();
					foreach ($this->request->post['selected'] as $product_id) {
						$errorr=$this->model_purpletree_multivendor_sellerproduct->approveProduct($product_id);
						
						if($errorr==1){
							$error[]=$errorr;	
							}else{
							$success[]=$errorr;
						}
					}
					if(count($error)>0){	
						$this->session->data['error_warning'] = sprintf($this->language->get('text_enable_error'),count($error));
					}
					if(count($success)>0){
						$this->session->data['success'] = sprintf($this->language->get('text_enable_success'),count($success));
					}
				}
			}
			
			$url = '';
			
			if (isset($this->request->get['filter_name'])) {
				$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_model'])) {
				$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
			}
			
			if (isset($this->request->get['filter_price'])) {
				$url .= '&filter_price=' . $this->request->get['filter_price'];
			}
			
			if (isset($this->request->get['filter_quantity'])) {
				$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
			}
			
			if (isset($this->request->get['filter_status'])) {
				$url .= '&filter_status=' . $this->request->get['filter_status'];
			}
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}
			
			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
			
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
            $this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			
			
			$this->index();
		}
		public function disabledproduct() {
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			$this->document->setTitle($this->language->get('heading_title'));
			
			$this->load->model('purpletree_multivendor/sellerproduct');
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (isset($this->request->post['selected1'])) {
				$this->request->post['selected'] = $this->request->post['selected1'];
			}
			if (isset($this->request->post['selected'])) {
				foreach ($this->request->post['selected'] as $product_id) {
					$this->model_purpletree_multivendor_sellerproduct->disabledproduct($product_id);
				}
				
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';
				
				if (isset($this->request->get['filter_name'])) {
					$url .= '&filter_name=' . urlencode(html_entity_decode($this->request->get['filter_name'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_model'])) {
					$url .= '&filter_model=' . urlencode(html_entity_decode($this->request->get['filter_model'], ENT_QUOTES, 'UTF-8'));
				}
				
				if (isset($this->request->get['filter_price'])) {
					$url .= '&filter_price=' . $this->request->get['filter_price'];
				}
				
				if (isset($this->request->get['filter_quantity'])) {
					$url .= '&filter_quantity=' . $this->request->get['filter_quantity'];
				}
				
				if (isset($this->request->get['filter_status'])) {
					$url .= '&filter_status=' . $this->request->get['filter_status'];
				}
				
				if (isset($this->request->get['sort'])) {
					$url .= '&sort=' . $this->request->get['sort'];
				}
				
				if (isset($this->request->get['order'])) {
					$url .= '&order=' . $this->request->get['order'];
				}
				
				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->index();
		}
		public function option() {
			$json = array();
			
			if (isset($this->request->get['filter_name'])) {
				$this->load->language('catalog/option');
				
				$this->load->model('catalog/option');
				
				$this->load->model('tool/image');
				
				$filter_data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 5
				);
				// options
				$this->load->model('purpletree_multivendor/sellerattribute');
				$datag = $this->model_purpletree_multivendor_sellerattribute->getOtherSellerOptions();
				$attributearray =array();
				if(!empty($datag)){
					foreach($datag as $datagg){
						$attributearray[] = $datagg['option_id'];
					}
				}
				$stringgattrsets = '';
				if(!empty($attributearray)) {
					$stringgattrsets = implode(',',$attributearray);
				}
				// attribute sets
				$options = $this->model_catalog_option->getOptions($filter_data,$stringgattrsets);
				
				foreach ($options as $option) {
					$option_value_data = array();
					
					if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox' || $option['type'] == 'image') {
						$option_values = $this->model_catalog_option->getOptionValues($option['option_id']);
						
						foreach ($option_values as $option_value) {
							if (is_file(DIR_IMAGE . $option_value['image'])) {
								$image = $this->model_tool_image->resize($option_value['image'], 50, 50);
								} else {
								$image = $this->model_tool_image->resize('no_image.png', 50, 50);
							}
							
							$option_value_data[] = array(
							'option_value_id' => $option_value['option_value_id'],
							'name'            => strip_tags(html_entity_decode($option_value['name'], ENT_QUOTES, 'UTF-8')),
							'image'           => $image
							);
						}
						
						$sort_order = array();
						
						foreach ($option_value_data as $key => $value) {
							$sort_order[$key] = $value['name'];
						}
						
						array_multisort($sort_order, SORT_ASC, $option_value_data);
					}
					
					$type = '';
					
					if ($option['type'] == 'select' || $option['type'] == 'radio' || $option['type'] == 'checkbox') {
						$type = $this->language->get('text_choose');
					}
					
					if ($option['type'] == 'text' || $option['type'] == 'textarea') {
						$type = $this->language->get('text_input');
					}
					
					if ($option['type'] == 'file') {
						$type = $this->language->get('text_file');
					}
					
					if ($option['type'] == 'date' || $option['type'] == 'datetime' || $option['type'] == 'time') {
						$type = $this->language->get('text_date');
					}
					
					$json[] = array(
					'option_id'    => $option['option_id'],
					'name'         => strip_tags(html_entity_decode($option['name'], ENT_QUOTES, 'UTF-8')),
					'category'     => $type,
					'type'         => $option['type'],
					'option_value' => $option_value_data
					);
				}
			}
			
			$sort_order = array();
			
			foreach ($json as $key => $value) {
				$sort_order[$key] = $value['name'];
			}
			
			array_multisort($sort_order, SORT_ASC, $json);
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		////////////// For sub category //////////////////
		public function autosubcategory() {
			$json = array();
			
			if (isset($this->request->get['category_id'])) {
				$category_id = $this->request->get['category_id'];
				
				} else {
				$category_id = '';
			}
			$this->load->model('purpletree_multivendor/sellerproduct');		
			$results = $this->model_purpletree_multivendor_sellerproduct->getSubcategory($category_id);
			if(empty($results)) {
				$json[] = array(
				'subcategory_id'       => $category_id,
				'name'              => 'None'	
				);
				} else {
				foreach ($results as $result) {
					$json[] = array(
					'subcategory_id'       => $result['category_id'],
					'name'              => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))				
					);
				}
			}
			
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		///////////////// End sub category /////////////////////
		///// check product subscription plan ///////
		public function check_featured_product_subscription_plan() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$json['status'] = 'error'; 
			$json['message'] = 'Something went wrong'; 
			if (isset($this->request->get['product_id']) && $this->request->get['product_id'] != '') {
				if ($this->request->get['value'] == 'true') {
					$value = 1;
					} else {
					$value = 0;
				}
				$this->load->model('purpletree_multivendor/sellerproduct');
				if($this->config->get('purpletree_multivendor_subscription_plans')){
					if($value == 1) {
						if (isset($this->request->get['product_id'])) {
							$product_id = $this->request->get['product_id'];
							
							} else {
							$product_id = '';
						}
						$this->load->model('purpletree_multivendor/sellerproduct');		
						$results = $this->model_purpletree_multivendor_sellerproduct->featuredProductPlanName($this->request->get['product_id']);		
						if(empty($results)) {
							$json['plan_id'] = $results;
							$json['status'] = 'success';
							$json['message'] = ''; 
							} else {
							$json['plan_id'] = $results;
							$json['status'] = 'success';
							$json['message'] = ''; 
						}		
						
					} 		
				}	
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		public function add_featured_product_By_Popup(){		
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$json['status'] = 'error'; 
			$json['message'] = 'Something went wrong'; 
			$featuredhidden  = $this->request->post['featuredhidden'];
			if(isset($featuredhidden) && $featuredhidden == 1){
				if (isset($this->request->post['productidinform']) && $this->request->post['popup_product_plan_id'] != '') {
					//// feature product plan validation ////////
					if($this->config->get('purpletree_multivendor_subscription_plans')) {
						$this->load->model('purpletree_multivendor/sellerproduct');
						$seller_id = $this->customer->getId();			 
						$featured_plan_product = array();
						$featured_total_product = array();		
						if(isset($this->request->post['productidinform']) && $this->request->post['popup_product_plan_id'] != 0 ) {
							$featured_plan_product = $this->model_purpletree_multivendor_sellerproduct->getFeaturedPlanProduct($this->request->post['popup_product_plan_id']);
							$featured_total_product = $this->model_purpletree_multivendor_sellerproduct->getFeaturedTotalProduct($this->request->post['popup_product_plan_id'], $seller_id);	
							if($featured_total_product >= $featured_plan_product){
								$json['status'] = 'error'; 
								$json['message'] = $this->language->get('error_featured_product_plan_id');				
								}else{
								$this->model_purpletree_multivendor_sellerproduct->addFeaturedProductByPopup($this->request->post['productidinform'],$this->request->post['popup_product_plan_id']);
								$json['status'] = 'success'; 	
								$json['message'] = $this->language->get('text_assigned'); 
								$json['product_id'] = $this->request->post['productidinform'];
								$json['featuredhidden']  = $this->request->post['featuredhidden'];				
							}  
							
						}
					}
					//// End feature product plan validation ////////
					
				}
				}else{
				if (isset($this->request->post['productidinform']) && $this->request->post['popup_product_plan_id'] != '') {
					//// feature product plan validation ////////
					if($this->config->get('purpletree_multivendor_subscription_plans')) {
						$this->load->model('purpletree_multivendor/sellerproduct');
						$seller_id = $this->customer->getId();			 
						$category_featured_plan_product = array();
						$category_featured_total_product = array();		
						if(isset($this->request->post['productidinform']) && $this->request->post['popup_product_plan_id'] != 0 ) {
							$category_featured_plan_product = $this->model_purpletree_multivendor_sellerproduct->getCatgoryFeaturedPlanProduct($this->request->post['popup_product_plan_id']);
							$category_featured_total_product = $this->model_purpletree_multivendor_sellerproduct->getCatgoryFeaturedTotalProduct($this->request->post['popup_product_plan_id'], $seller_id);	
							if($category_featured_total_product >= $category_featured_plan_product){
								$json['status'] = 'error'; 
								$json['message'] = $this->language->get('error_featured_product_plan_id');				
								}else{
								$this->model_purpletree_multivendor_sellerproduct->addCategoryFeaturedProductByPopup($this->request->post['productidinform'],$this->request->post['popup_product_plan_id']);
								$json['status'] = 'success'; 	
								$json['message'] = $this->language->get('text_assigned');
								$json['product_id'] = $this->request->post['productidinform'];
								$json['featuredhidden']  = $this->request->post['featuredhidden'];				
							}  
							
						}
					}
					//// End feature product plan validation ////////
					
				}
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		public function check_category_featured_product_subscription_plan() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$json['status'] = 'error'; 
			$json['message'] = 'Something went wrong'; 
			if (isset($this->request->get['product_id']) && $this->request->get['product_id'] != '') {
				if ($this->request->get['value'] == 'true') {
					$value = 1;
					} else {
					$value = 0;
				}
				$this->load->model('purpletree_multivendor/sellerproduct');
				if($this->config->get('purpletree_multivendor_subscription_plans')){
					if($value == 1) {
						if (isset($this->request->get['product_id'])) {
							$product_id = $this->request->get['product_id'];
							
							} else {
							$product_id = '';
						}
						$this->load->model('purpletree_multivendor/sellerproduct');		
						$results = $this->model_purpletree_multivendor_sellerproduct->categoryFeaturedProductPlanName($this->request->get['product_id']);		
						if(empty($results)) {
							$json['plan_id'] = $results;
							$json['status'] = 'success';
							$json['message'] = ''; 
							} else {
							$json['plan_id'] = $results;
							$json['status'] = 'success';
							$json['message'] = ''; 
						}		
						
					} 		
				}	
			}
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		public function remove_category_featured_product_subscription_plan() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$json['status'] = 'error'; 
			$json['message'] = 'Something went wrong'; 
			if (isset($this->request->get['product_id']) && $this->request->get['product_id'] != '') {			
				$this->load->model('purpletree_multivendor/sellerproduct');
				if($this->config->get('purpletree_multivendor_subscription_plans')){	
					$this->model_purpletree_multivendor_sellerproduct->removeCategoryFeaturedProduct($this->request->get['product_id']);
					$json['status'] = 'success';
					$json['message'] = $this->language->get('text_unAssigned');				
				} 		
			}	
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		public function remove_featured_product_subscription_plan() {
			if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('account/purpletree_multivendor/sellerproduct', '', true);
				$this->response->redirect($this->url->link('account/login', '', true));
			}
						
			$this->load->model('purpletree_multivendor/dashboard');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			$json['status'] = 'error'; 
			$json['message'] = 'Something went wrong'; 
			if (isset($this->request->get['product_id']) && $this->request->get['product_id'] != '') {			
				$this->load->model('purpletree_multivendor/sellerproduct');
				if($this->config->get('purpletree_multivendor_subscription_plans')){	
					$this->model_purpletree_multivendor_sellerproduct->removeFeaturedProduct($this->request->get['product_id']);
					$json['status'] = 'success';
					$json['message'] = $this->language->get('text_unAssigned');				
				} 		
			}	
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		//// End check product subscription plan///
		//// ***** Start Quick Edit  Product ********/////
		public function quickEdit() {
			$json = array();
			//echo "<pre>"; print_r($this->request->get['product_id']); die;
			$this->load->model('purpletree_multivendor/dashboard');
			$this->load->model('catalog/option');
			//$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			if (isset($this->request->get['product_id'])) {
				
				$this->load->model('purpletree_multivendor/sellerproduct');
				//$results = $this->model_purpletree_multivendor_sellerproduct->getProducts($filter_data);
				$seller_id = $this->customer->getId();
				$result = $this->model_purpletree_multivendor_sellerproduct->getProduct($this->request->get['product_id'],$seller_id);
				//echo"<pre>"; print_r($result);
				$this->load->model('localisation/language');
           $languages = $this->model_localisation_language->getLanguages();
		  
			foreach($languages as $key => $value) {
				$languages[$key]['activetab'] = '';
			}
			foreach($languages as $key => $value) {
				$languages[$key]['activetab'] = 'active';
				break;
			}
			
			//echo"<pre>"; print_r($languages);
			$product_options = $this->model_purpletree_multivendor_sellerproduct->getProductOptions($this->request->get['product_id']);
			
			$product_options1 = array();
			
			foreach ($product_options as $product_option) {
				$product_option_value_data = array();
				
				if (isset($product_option['product_option_value'])) {
					foreach ($product_option['product_option_value'] as $product_option_value) {
						$product_option_value_data[] = array(
						'product_option_value_id' => $product_option_value['product_option_value_id'],
						'option_value_id'         => $product_option_value['option_value_id'],
						'quantity'                => $product_option_value['quantity'],
						'subtract'                => $product_option_value['subtract'],
						'price'                   => $product_option_value['price'],
						'price_prefix'            => $product_option_value['price_prefix'],
						'points'                  => $product_option_value['points'],
						'points_prefix'           => $product_option_value['points_prefix'],
						'weight'                  => $product_option_value['weight'],
						'weight_prefix'           => $product_option_value['weight_prefix']
						);
					}
				}
				
				
				
				$product_options1[] = array(
				'product_option_id'    => $product_option['product_option_id'],
				'product_option_value' => $product_option_value_data,
				'option_id'            => $product_option['option_id'],
				'name'                 => $product_option['name'],
				'type'                 => $product_option['type'],
				'value'                => isset($product_option['value']) ? $product_option['value'] : '',
				'required'             => $product_option['required']
				);
			}
			//echo"<pre>"; print_r($product_options1);
			$product_option_values_data = array();
			foreach ($product_options1 as $product_option2) {
				if ($product_option2['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
					
					//echo"<pre>"; print_r($product_option2['option_id']);
						$product_option_values_data[$product_option2['option_id']] = $this->model_catalog_option->getOptionValues($product_option2['option_id']);
					
				}
			}
			//echo"<pre>"; print_r($product_option_values_data);die;
			
         $product_specials = array();			
         $product_specials = $this->model_purpletree_multivendor_sellerproduct->getProductSpecials($this->request->get['product_id']);
		 $product_specials1[] = array();
      foreach ($product_specials as $product_special) {
				$product_specials1[] = array(
				'customer_group_id' => $product_special['customer_group_id'],
				'priority'          => $product_special['priority'],
				'price'             => $product_special['price'],
				'date_start'        => ($product_special['date_start'] != '0000-00-00') ? $product_special['date_start'] : '',
				'date_end'          => ($product_special['date_end'] != '0000-00-00') ? $product_special['date_end'] :  ''
				);
			}
			$product_description = $this->model_purpletree_multivendor_sellerproduct->getProductDescriptions($this->request->get['product_id']);
			
			 foreach ($languages as $key => $value) {
			    $product_name[] = array(
				'product_lang' => $languages[$key]['language_id'],
				'product_name' => $product_description[$languages[$key]['language_id']]['name']
				);
				 }
			
			//echo"<pre>"; print_r($product_options1); die;
					
					$json = array(
					'product_id' => $this->request->get['product_id'],
					'name'       => $product_name,
					'product_option'     => $product_options1,
					'price'      => $result['price'],
					'quantity'      => $result['quantity'],
					'special_price'      => $product_specials1,
					'status'      => $result['status'],
					'product_option_values_data'      => $product_option_values_data,
					'language'      => $languages
					);
			}
			//echo "<pre>"; print_r($json); die;
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		public function quickSave() {
		  if (!$this->customer->isLogged()) {
				$this->session->data['redirect'] = $this->url->link('extension/account/purpletree_multivendor/sellerproduct', '', true);
				
				$this->response->redirect($this->url->link('account/login', '', true));
			}
			$this->load->model('purpletree_multivendor/dashboard');
			$this->load->model('purpletree_multivendor/sellerproduct');
			
			$this->model_purpletree_multivendor_dashboard->checkSellerApproval();
			
			$store_detail = $this->customer->isSeller();
			if(!isset($store_detail['store_status'])){
				$this->response->redirect($this->url->link('account/account', '', true));
				}else{
				$stores=array();
						if(isset($store_detail['multi_store_id'])){
							$stores=explode(',',$store_detail['multi_store_id']);
						}
				if(isset($store_detail['store_status']) && !in_array($this->config->get('config_store_id'),$stores)){		
					$this->response->redirect($this->url->link('account/account','', true));
				}
			}
			
			if(!$this->customer->validateSeller()) {
				$this->load->language('purpletree_multivendor/ptsmultivendor');
				$this->session->data['error_warning'] = $this->language->get('error_license');			
				$this->response->redirect($this->url->link('account/purpletree_multivendor/sellerproduct', '', true));
			}
			
			$this->load->language('purpletree_multivendor/sellerproduct');
			
			//echo"<pre>"; print_r($this->request->post); die;
			if($this->request->post['quick_product_id']){
			    $this->model_purpletree_multivendor_sellerproduct->qucikEditProduct($this->request->post['quick_product_id'],$this->request->post);
			    $currentproductname = $this->model_purpletree_multivendor_sellerproduct->getproductname($this->request->post['quick_product_id']);
				$json['productname'] = $currentproductname; 
				$json['pts_price'] =  $this->request->post['quick_product_price'];  
				$json['pts_quentity'] = $this->request->post['quick_product_quantity']; 
				$json['pts_status'] = $this->request->post['quick_product_status'] ? $this->language->get('text_enabled') : $this->language->get('text_disabled');
				$json['pts_status_id'] = $this->request->post['quick_product_status'];
				$json['product_id'] = $this->request->post['quick_product_id']; 
				$json['status'] = 'success'; 
			    $json['message'] = 'Product information successfully update';
				}else{
				$json['status'] = 'error'; 
			    $json['message'] = 'Something went wrong'; 
				}
					
				
			$this->response->addHeader('Content-Type: application/json');
			$this->response->setOutput(json_encode($json));
		}
		
		//// ***** End  Quick Edit  Product ********/////
}
?>