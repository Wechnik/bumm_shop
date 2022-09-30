<?php echo $header; ?>

<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			<div class="errordiv">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
    </div>
      <div class="plansave"></div>
	<div class="successdiv">
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
	</div>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <div class="pts-pull-right">
				<button type="submit" data-toggle="tooltip" id="button-enabledproduct" title="<?php echo $text_enabled; ?>" formaction="<?php echo $enabledproduct; ?>" class="btn btn-primary" ><?php echo $text_enabled; ?></button>
				<button type="submit" data-toggle="tooltip" id="button-disabledproduct" title="<?php echo $text_disabled; ?>" formaction="<?php echo $disabledproduct; ?>" class="btn btn-danger" ><?php echo $text_disabled; ?></button>
				<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus"></i></a>
				<button type="submit" form="form-product" formaction="<?php echo $copy; ?>" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="pts-btn pts-btn-default"><i class="fa fa-copy"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="pts-btn pts-btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-product').submit() : false;"><i class="fa fa-trash-o"></i></button>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
    </div>
  </div>
			<div class="">
				<div class="pts-well">
					<div class="pts-row">
						<div class="pts-col-sm-4">
							<div class="pts-form-group ptsnewcss">
								<label class="pts-control-label" for="input-name"><?php echo $entry_name; ?></label>
								<input type="text" name="filter_name" value="<?php echo $filter_name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="pts-form-control" />
							</div>
							<div class="pts-form-group ptsnewcss">
								<label class="pts-control-label" for="input-model"><?php echo $entry_model; ?></label>
								<input type="text" name="filter_model" value="<?php echo $filter_model; ?>" placeholder="<?php echo $entry_model; ?>" id="input-model" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-col-sm-4">
							<div class="pts-form-group">
								<label class="pts-control-label" for="input-price"><?php echo $entry_price; ?></label>
								<input type="text" name="filter_price" value="<?php echo $filter_price; ?>" placeholder="<?php echo $entry_price; ?>" id="input-price" class="pts-form-control" />
							</div>
							<div class="pts-form-group">
								<label class="pts-control-label" for="input-quantity"><?php echo $entry_quantity; ?></label>
								<input type="text" name="filter_quantity" value="<?php echo $filter_quantity; ?>" placeholder="<?php echo $entry_quantity; ?>" id="input-quantity" class="pts-form-control" />
							</div>
						</div>
						<div class="pts-col-sm-4">
							<div class="pts-form-group">
								<label class="pts-control-label" for="input-status"><?php echo $entry_status; ?></label>
								<select name="filter_status" id="input-status" class="pts-form-control">
									<option value="*"><?php echo $text_all; ?></option>
									<?php if ($filter_status) { ?>
										<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
										<?php } else { ?>
										<option value="1"><?php echo $text_enabled; ?></option>
									<?php } ?>
									<?php if (!$filter_status && !is_null($filter_status)) { ?>
										<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
										<?php } else { ?>
										<option value="0"><?php echo $text_disabled; ?></option>
									<?php } ?>
								</select>
							</div>
							<button type="button" id="pts-button-filter" class="pts-btn pts-btn-primary pts-pull-right ptsc-sellproduct-filtmartop"><i class="fa fa-filter"></i> <?php echo $button_filter; ?></button>
						</div>
					</div>
				</div>
				<div class="pts-row">				
				<div class="pts-col-sm-3">
					<div class="pts-form-group pts-input-group pts-input-group-sm ptssortcss">
						<label class="pts-input-group-addon" for="input-sort"><?php echo $text_sort; ?></label>
						<select id="input-sort" class="pts-form-control" onchange="location = this.value;">
							<?php foreach($sorts_order as $sorts) { ?>
							<?php if ($sorts['value'] == $order) { ?>
						<option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
							<?php } else { ?>
							<option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
							<?php } ?>
						<?php } ?>
						</select>
					</div>
				</div>
				<div class="pts-col-sm-7">
				</div>
				<div class="pts-col-sm-2">
				<div class="pts-pull-right ptsc-product-di">
				<div class="pts-btn-group pts-btn-group-sm">
				<?php $class1 = ''; ?>
				<?php $class2 = ''; ?>	
				<?php if ($product_view == 1) { ?>
				    <?php $class1 = 'active'; ?>
				<?php } else { ?>
				    <?php $class2 = 'active'; ?>
				<?php } ?>				
						<button type="button" id="pro-list-view" class="pts-btn pts-btn-default <?php echo $class2; ?>" data-toggle="tooltip" title="" data-original-title="<?php echo $text_list; ?>">
							<i class="fa fa-th-list">
							</i>
						</button>
						<button type="button" id="pro-grid-view" class="pts-btn pts-btn-default <?php echo $class1; ?>" data-toggle="tooltip" title="" data-original-title="Seller Product Grid">
							<i class="fa fa-th">
							</i>
						</button>
					</div>
				</div>
				</div>
				</div>
				
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-product">
				<div class = "pro-list">
					<div class="pts-table-responsive">
						<table class="pts-table pts-table-bordered pts-table-hover">
							<thead>
								<tr>
									<td class="pts-text-center ptsc-attr-tab-width"><input type="checkbox" onclick="$('input[name*=\'selected1\']').prop('checked', this.checked);" /></td>
									<td class="pts-text-center"><?php echo $column_image; ?></td>
									<td class="pts-text-left"><?php echo $column_name; ?></td>
									<td class="pts-text-left"><?php echo $column_model; ?></td>
									<td class="pts-text-right"><?php echo $column_price; ?></td>
									<td class="pts-text-right"><?php echo $column_quantity; ?></td>
									<td class="pts-text-left"><?php echo $column_status; ?></td>
									<td class="pts-text-left"><?php echo $column_approved; ?></td>
									<!--  -->
									<?php if ($purpletree_multivendor_seller_featured_products) { ?>
										<td class="pts-text-left"><?php echo $column_featured_product;?></td>
									<?php } ?>
									<?php if ($purpletree_multivendor_seller_category_featured) { ?>
										<td class="pts-text-right"><?php echo $column_cataegory_featured_product;?></td>
									<?php } ?>
									<!--  -->
									<td class="pts-text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if ($products) { ?>
									<?php foreach ($products as $product) { ?>
										<tr <?php if ($product['statusid'] == '0') { ?> class="pts-disabled" <?php } ?>>
											<td class="pts-text-center"><?php if (in_array($product['product_id'], $selected)) { ?>
												<input type="checkbox" name="selected1[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected1[]" value="<?php echo $product['product_id']; ?>" />
											<?php } ?></td>
											<td class="pts-text-center"><?php if ($product['image']) { ?>
												<img src="<?php echo $product['image']; ?>" alt="<?php echo $product['name']; ?>" class="img-thumbnail" />
												<?php } else { ?>
												<span class="img-thumbnail list"><i class="fa fa-camera fa-2x"></i></span>
											<?php } ?></td>
											<td class="pts-text-left h4name<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></td>
											<td class="pts-text-left"><?php echo $product['model']; ?></td>
											<td class="pts-text-right"><?php if ($product['special']) { ?>
												<span class = "pts_price ptsc-product-picp<?php echo $product['product_id']; ?> ptsc-product-picp"><?php echo $product['price']; ?></span><br/>
												<div class="text-danger"><?php echo $product['special']; ?></div>
												<?php } else { ?>
												<span class = "pts_price ptsc-product-picp<?php echo $product['product_id']; ?>"><?php echo $product['price']; ?> </span>
											<?php } ?></td>
											<td class="pts-text-right"><?php if ($product['quantity'] <= 0) { ?>
												<span class="label label-warning pts_quantity<?php echo $product['product_id']; ?>"><?php echo $product['quantity']; ?></span>
												<?php } elseif ($product['quantity'] <= 5) { ?>
												<span class="label label-danger pts_quantity<?php echo $product['product_id']; ?>"><?php echo $product['quantity']; ?></span>
												<?php } else { ?>
												<span class="label label-success pts_quantity<?php echo $product['product_id']; ?>"><?php echo $product['quantity']; ?></span>
											<?php } ?></td>
											<td class="pts-text-left pts_status<?php echo $product['product_id']; ?>"><?php echo $product['status']; ?></td>
											<td class="pts-text-left"><?php echo $product['is_approved']; ?></td>
											<!--  -->
											<?php if ($purpletree_multivendor_seller_featured_products) { ?>
												<td class=" pts-text-center"><input product-id="<?php echo $product['product_id']; ?>" class="is_featured is_featu<?php echo $product['product_id']; ?>" name="is_featured" id="is_featured_checkbox" type="checkbox" <?php if ($product['is_featured']==1) { ?> checked <?php } ?>
													<?php if ($product['seller_plan_sataus']==1) { ?> disabled= "disabled"  <?php } ?>
												></td>
											<?php } ?>
											<?php if ($purpletree_multivendor_seller_category_featured) { ?>
												<td class=" pts-text-center"><input product-id="<?php echo $product['product_id']; ?>" class="is_category_featured is_catfeatu<?php echo $product['product_id']; ?>" name="is_category_featured" id="is_category_featured_checkbox" type="checkbox" <?php if ($product['is_category_featured']==1) { ?> checked <?php } ?><?php if ($product['seller_plan_sataus']==1) { ?> disabled= "disabled"  <?php } ?>></td>
											<?php } ?>
											<!--  -->
											<td class="pts-text-right" id="producteditlink<?php echo $product['product_id']; ?>">
												<?php if($product_buttonhide) { ?>
													<?php if($product['is_featured']!=0 || $product['is_category_featured']!=0) { } else { ?>
														<a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary <?php if($direction =='rtl'){ ?> ptsc-productlis-margtop <?php } ?>"><i class="fa fa-pencil fas fa-edit"></i></a>
													    <a id="quick_edit" title="<?php echo $title_quick_edit; ?>" class="pts-btn pts-btn-primary  <?php if($direction =='rtl'){ ?> ptsc-productlis-qbgcol ptsc-productlis-margtop <?php } ?>" onclick="quick_edit(<?php echo $product['product_id']; ?>)"><i class = "fa fa-pencil fas fa-pencil"></i></a>
													<?php } ?>
													<?php }else{ ?>
													<a href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary <?php if($direction =='rtl'){ ?> ptsc-productlis-margtop <?php } ?>"><i class="fa fa-pencil fas fa-edit"></i></a>
												    <a id="quick_edit" title="<?php echo $title_quick_edit; ?>" class="pts-btn pts-btn-primary <?php if($direction =='rtl'){ ?> ptsc-productlis-qbgcol ptsc-productlis-margtop <?php } ?>" onclick="quick_edit(<?php echo $product['product_id']; ?>)"><i class = "fa fa-pencil fas fa-pencil"></i></a>
												<?php } ?>
											</td>
										</tr> 			
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="pts-text-center" colspan="11"><?php echo $text_no_results; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
					</div>
					<div class = "pro-grid">
				 <div class="pts-row">						
						<?php if(isset($product['product_total'])) { ?>
						<?php if($product['product_total'] % 2 == 0) { ?>
						<div class="pts-clearfix"></div>
						<?php }} ?>
						<?php if($products != '') { ?>					
						<?php foreach ($products as $product) { ?>
							<div class="product-layout pts-product-grid pts-col-lg-4 pts-col-md-4 pts-col-sm-3 pts-col-xs-6">
							<div class="pts-product-thumb">
								<div class="image imagename<?php echo $product['product_id']; ?>"><img src="<?php echo $product['image2']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"></a></div>
								<div>
									<div class="pts-caption">
										<h4 class="h4name<?php echo $product['product_id']; ?>"><?php echo $product['name']; ?></h4>
										<?php if ($product['price']) { ?>
								<p class="price">
									<?php if (!$product['special']) { ?>
									<span class="pts_price ptsc-product-picp<?php echo $product['product_id']; ?>"><?php echo $product['price']; ?></span>
									<?php } else { ?>
									<span class="price-new "><?php echo $product['special']; ?></span> <span class="price-old pts_price ptsc-product-picp <?php echo $product['product_id']; ?>"><?php echo $product['price']; ?></span>
									<?php } ?>
								</p>
								<?php } ?>
									</div>
									<div class="pts-button-group pts-text-right"id="producteditlink<?php echo $product['product_id']; ?>" >
									<div class="ptsc-quick-lable">
									<?php if (in_array($product['product_id'], $selected)) { ?>
										<input class="ptsc-quick-lable" type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" checked="checked" />
										<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $product['product_id']; ?>" />			
									<?php } ?>
									</div>
									    <?php if ($product['quantity'] <= 0) { ?><span class="label label-warning pts_quantity<?php echo $product['product_id']; ?>"><?php echo $product['quantity']; ?></span>										
										<?php }elseif ($product['quantity'] <= 5) { ?>
										<span class="label label-danger pts_quantity<?php echo $product['product_id']; ?>"data-toggle="tooltip" title="<?php echo $column_quantity; ?>"><?php echo $product['quantity']; ?></span>
										<?php } else { ?>
										<span class="label label-success" data-toggle="tooltip pts_quantity<?php echo $product['product_id']; ?>" title="<?php echo $column_quantity; ?>"><?php echo $product['quantity']; ?></span>
									 <?php } ?>
									<span style="color: <?php echo $product['color']; ?>; font-weight: bold;"class="ptsc-quick-lable pts_status<?php echo $product['product_id']; ?>" data-toggle="tooltip" title="<?php echo $column_status ?>"><?php echo $product['status']; ?></span>
								   
										<?php if ($product_buttonhide) { ?>
										<?php if($product['is_featured']!=0 || $product['is_category_featured']!=0) { } else { ?>
										<a id="productIdForSelenium" href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a>
										<a id="quick_edit" title="<?php echo $title_quick_edit; ?>" class="pts-btn pts-btn-primary ptsc-product-statuscoenb" onclick="quick_edit(<?php echo $product['product_id']; ?>)"><i class = "fa fa-pencil fas fa-pencil"></i></a>
										<?php } ?>
										<?php } else { ?>
										<a id="productIdForSelenium" href="<?php echo $product['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a>
										<a id="quick_edit" title="<?php echo $title_quick_edit; ?>" class="pts-btn pts-btn-primary ptsc-product-statuscoenb" onclick="quick_edit(<?php echo $product['product_id']; ?>)"><i class = "fa fa-pencil fas fa-pencil"></i></a>
										<?php } ?>					
									</div>
								</div>
							</div>
						</div>
								<?php } ?>								
								<?php } else { ?>							
								<div class="pts-text-center"><?php echo $text_no_results; ?></div>								
								<?php } ?>						
				</div>
				</div>
				</form>
				<div class="pts-row">
					<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
					<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
				</div>
			</div>
		</div>
	</div>
</div>

<?php if(isset($purpletree_multivendor_subscription_plans) && $purpletree_multivendor_subscription_plans == 1 ){ ?>
	
	<!-- Modal -->
	<div class="modal pts-sidenav fade" id="featured_Modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog"  id="mySidenav">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h2 class="modal-title text-center" id="myModalLabel"><?php echo $entry_subscription_plans; ?></h2>
				</div>
				<form action=""  method="post" id="form_plan">
					<div class="modal-body">
						<div class="errorplan"></div>	
						<input type="hidden" name="productidinform" id="productidinform" value="" />				
						<input type="hidden" name="featuredhidden" id="featuredhidden" value="" />				
						<div class="inputgroup">
							<?php if(!empty($product_plan_info)){ 
								
								foreach($product_plan_info as $plans){
								?>				
								<div class="radio">				
									<label><input  id="planidcheck<?php echo $plans['plan_id']; ?>" type="radio" name="popup_product_plan_id" value="<?php echo $plans['plan_id']; ?>" class="plan planidcheck" checked="checked"><span class="plans ptsc-plans"><?php echo $plans['plan_name']; ?></span></label>
								</div>				
							<?php }  } else { ?>
							<div class="radio">
								<label><input type="radio" name="popup_product_plan_id" class=" planidcheck"><span class="planidcheck plans ptsc-plans"><?php echo 'Plan Not Found'; ?></span></label>
							</div>
							<?php } ?>
						</div>
					</div>
					<div class="modal-footer">
						<button type="submit" class="pts-btn pts-btn-primary sub1" id="sub1"><?php echo $button_save; ?></button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!--/ popup model-->
	<style>	
		input[type="radio"] {
		-webkit-appearance: checkbox; /* Chrome, Safari, Opera */
		-moz-appearance: checkbox;    /* Firefox */
		-ms-appearance: checkbox;     /* not currently supported */
		height:20px;
		width:20px;
		}		
		.pts-row .pts-col-sm-6 ul.pagination{
		border: none;
		box-shadow: none;
		}
		.pts-row .pts-col-sm-6 ul.pagination li a{
		border-radius: 0 !important;
		line-height: 1;
		vertical-align: middle;
		text-align: center;
		padding: 5px;
		}
		.pts-row .pts-col-sm-6 ul.pagination li span{
		padding: 3px 10px !important;
		}
	</style>
	
	<script>
		$('input[name="is_category_featured"]').on('change', function(e){
			if(e.target.checked){
				var product_id = $(this).attr('product-id');
				$('#productidinform').val(product_id);
				var is_catfeatu = $(this).prop('checked');
				$.ajax({
					url: 'index.php?route=account/purpletree_multivendor/sellerproduct/check_category_featured_product_subscription_plan&value=' +  is_catfeatu + '&product_id='+ product_id,
					dataType: 'json',
					success: function(json) {
						if(json.status == 'success') {
							if(json.plan_id){
								$('#planidcheck'+json.plan_id).prop('checked', true);			  
							}
							$('.is_catfeatu'+product_id).prop('checked', false);
							$('#featuredhidden').val('2');	            
							$('#featured_Modal').modal();
						} 
						else {
							
						}
					}
				})
				} else {
				var product_id = $(this).attr('product-id');
				$('#productidinform').val(product_id);
				$.ajax({
					url: 'index.php?route=account/purpletree_multivendor/sellerproduct/remove_category_featured_product_subscription_plan&product_id='+ product_id,
					dataType: 'json',
					success: function(json) {
						if(json.status == 'success') {
							$("html, body").animate({ scrollTop: 0 }, "slow");
							$(".plansave").html('<div class="alert pts-alert-success"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');			
							//is_catfeatu is_featu
							<?php if($product_buttonhide){ ?>
								if($('.is_featu'+product_id).prop('checked')) { } else {
									$('#producteditlink'+product_id).append('<a href="<?php echo $productedit; ?>&product_id=' + product_id + ' data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a>');					
								}
							<?php } ?>						
						} 
						else {
							
						}
					}
				})
			}
		})
		
		$('[name="is_featured"]').on('change', function(e){
			if(e.target.checked){
				var product_id = $(this).attr('product-id');
				$('#productidinform').val(product_id);
				var is_featured = $(this).prop('checked');
				$.ajax({
					url: 'index.php?route=account/purpletree_multivendor/sellerproduct/check_featured_product_subscription_plan&value=' +  is_featured + '&product_id='+ product_id,
					dataType: 'json',
					success: function(json) {
						if(json.status == 'success') {
							if(json.plan_id){
								$('#planidcheck'+json.plan_id).prop('checked', true);
								
							}
							$('.is_featu'+product_id).prop('checked', false);
							$('#featuredhidden').val('1');	       
							$('#featured_Modal').modal();
							
						} 
						else {
							
						}
					}
				});	
				} else {
				var product_id = $(this).attr('product-id');
				$('#productidinform').val(product_id);
				$.ajax({
					url: 'index.php?route=account/purpletree_multivendor/sellerproduct/remove_featured_product_subscription_plan&product_id='+ product_id,
					dataType: 'json',
					success: function(json) {
						if(json.status == 'success') {
							$("html, body").animate({ scrollTop: 0 }, "slow");
							$(".plansave").html('<div class="alert pts-alert-success"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
							//is_catfeatu is_featu
							<?php if($product_buttonhide){ ?>
								if($('.is_catfeatu'+product_id).prop('checked')) { } else {
									$('#producteditlink'+product_id).append('<a href="<?php echo $productedit; ?>&product_id=' + product_id + ' data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a>');	
								}						
							<?php } ?>
						} 
						else {
							
						}
					}
				})
			}
		});
		
		var frm = $('#form_plan');
		frm.submit(function (e) {
			e.preventDefault();
			if($('.planidcheck').is(':checked')) {
				$.ajax({
					type: frm.attr('method'),
					url: 'index.php?route=account/purpletree_multivendor/sellerproduct/add_featured_product_By_Popup',
					data: frm.serialize(),
					success: function (json) {
						if(json.status == 'success') {
							$('#featured_Modal').modal('hide');
							$("html, body").animate({ scrollTop: 0 }, "slow");
							$(".plansave").html('<div class="alert pts-alert-success"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
							if(json.featuredhidden == 1){
								$('.is_featu'+json.product_id).prop('checked', true);
								
								
								}else{
								$('.is_catfeatu'+json.product_id).prop('checked', true);
							}
							<?php if($product_buttonhide){ ?>
								$('#producteditlink'+json.product_id).empty();
							<?php } ?>	
							}else {
							$('.errorplan').html('<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
						}
					},
					error: function (json) {
						if(json.status == 'error') {
							$('.errorplan').html('<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
							$('div.modal , .modal-backdrop').show();
						}
					},
				});
				} else {
				$('.errorplan').html('<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i>Please Select Subscription plan</div>');
				$('div.modal , .modal-backdrop').show();
			}
		});
		
	</script>
	<?php } else { ?>
	<script>
		$('.is_featured').on('click', function(e) {
			var product_id = $(this).attr('product-id');
			var is_featured = $(this).prop('checked');
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/change_is_featured&value=' +  is_featured + '&product_id='+ product_id,
				dataType: 'json',
				success: function(json) {
					if(json.status == 'success') {
						$("html, body").animate({ scrollTop: 0 }, "slow");
						$('.successdiv').html('<div class="alert pts-alert-success"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
						$('.errordiv').html('');
						<?php if($product_buttonhide){ ?>
							if(json.value==1){
								$('#producteditlink'+json.product_id).empty();
								} else {
								//is_catfeatu is_featu
								if($('.is_catfeatu'+product_id).prop('checked')) { } else {
									$('#producteditlink'+product_id).append('<a href="<?php echo $productedit; ?>&product_id=' + product_id + ' data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a>');
								}
							}
						<?php } ?>
					}
					else {
						$("html, body").animate({ scrollTop: 0 }, "slow");
						$('.errordiv').html('<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
						$('.successdiv').html('');
						$('.is_featu'+product_id).prop('checked', false);
					}
				}
			});
		});
		$('.is_category_featured').on('click', function() {
			var product_id = $(this).attr('product-id');
			var is_category_featured = $(this).prop('checked');
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/change_is_category_featured&value=' +  is_category_featured + '&product_id='+ product_id,
				dataType: 'json',
				success: function(json) {
					if(json.status == 'success') {
						$("html, body").animate({ scrollTop: 0 }, "slow");
						$('.successdiv').html('<div class="alert pts-alert-success"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
						$('.errordiv').html('');
					    <?php if($product_buttonhide){ ?>
							if(json.value==1){
								$('#producteditlink'+product_id).empty();
								} else {
								//is_catfeatu is_featu
								if($('.is_featu'+product_id).prop('checked')) { 
									
									} else {
									$('#producteditlink'+product_id).append('<a href="<?php echo $productedit; ?>&product_id=' + product_id + ' data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a>');
								}
							}
						<?php } ?>
					}
					else {
						$("html, body").animate({ scrollTop: 0 }, "slow");
						$('.errordiv').html('<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i>'+ json.message +'</div>');
						$('.successdiv').html('');
						$('.is_catfeatu'+product_id).prop('checked', false)
					}
				}
			});
		});
	</script>
<?php } ?>
<script type="text/javascript"><!--
	$('#button-enabledproduct, #button-disabledproduct').on('click', function(e) {
		
		if(confirm('<?php echo $text_confirm; ?>')) {
			
			$('#form-product').attr('action', this.getAttribute('formAction')).submit();
		}
		else { 
			return false;
		}
	});
	
	
	$('#pts-button-filter').on('click', function() {
		var url = 'index.php?route=account/purpletree_multivendor/sellerproduct';
		
		var filter_name = $('input[name=\'filter_name\']').val();
		
		if (filter_name) {
			url += '&filter_name=' + encodeURIComponent(filter_name);
		}
		
		var filter_price = $('input[name=\'filter_price\']').val();
		
		if (filter_price) {
			url += '&filter_price=' + encodeURIComponent(filter_price);
		}
		
		var filter_quantity = $('input[name=\'filter_quantity\']').val();
		
		if (filter_quantity) {
			url += '&filter_quantity=' + encodeURIComponent(filter_quantity);
		}
		
		var filter_status = $('select[name=\'filter_status\']').val();
		
		if (filter_status != '*') {
			url += '&filter_status=' + encodeURIComponent(filter_status);
		}
		
		var filter_model = $('input[name=\'filter_model\']').val();
		
		if (filter_model != '*') {
			url += '&filter_model=' + encodeURIComponent(filter_model);
		}
		
		location = url;
	});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter_name\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/autocomplete&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['product_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_name\']').val(item['label']);
		}
	});
	
	$('input[name=\'filter_model\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/autocomplete&filter_model=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['model'],
							value: item['product_id']
						} 
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter_model\']').val(item['label']);
		}
	});
//--></script>

<script>
// Start Quick edit model function	

var special_row = 0;
var option_row = 0;
var option_value_row = 0;

	
	function addSpecial() {
		html  = '<tr id="special-pts-row' + special_row + '">';
		html += '  <td class="pts-text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="pts-form-control">';
		<?php foreach ($customer_groups as $customer_group) { ?>
			html += '      <option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
		<?php } ?>
		html += '  </select></td>';
		html += '  <td class="pts-text-right"><input type="text" name="product_special[' + special_row + '][priority]" value="" placeholder="<?php echo $entry_priority; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-right"><input type="text" name="product_special[' + special_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-left ptsc-product-width"><div class="pts-input-group date"><input type="text" name="product_special[' + special_row + '][date_start]" value="" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="pts-form-control" /><span class="pts-input-group-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
		html += '  <td class="pts-text-left ptsc-product-width"><div class="pts-input-group date"><input type="text" name="product_special[' + special_row + '][date_end]" value="" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="pts-form-control" /><span class="pts-input-group-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
		html += '  <td class="pts-text-left"><button type="button" onclick="$(\'#special-pts-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('#special tbody').append(html);
		
		$('.date').datetimepicker({
			pickTime: false
		});
		
		special_row++;
	}
	
	function quick_edit(product_id){
	$('#quick_product_id').val(product_id);
		$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/quickEdit&product_id=' +  product_id,
				dataType: 'json',
				success: function(json) {
				$('#quick-product-price').val(json.price);
				$('#quick-product-quantity').val(json.quantity);
				$.each (json.name, function (name1) {            
				  $('.product_name'+json.name[name1].product_lang+'').html('<input autocomplete="off" name="product_description['+json.name[name1].product_lang+'][name]" value="'+json.name[name1].product_name+'" placeholder="" id="quick-product-name'+json.name[name1].product_lang+'" class="pts-form-control" type="text" required>');
                 
                });
				$('.special-pts-row-class').remove();			
			$.each (json.special_price, function (special_price1) {                 
		if(special_price1 !=0){
   		 html  = '<tr class="special-pts-row-class ptsc-product-spicpcol" id="special-pts-row' + special_row + '">';
		html += '  <td class="pts-text-left"><select name="product_special[' + special_row + '][customer_group_id]" class="pts-form-control">';
		//console.log(json)
		var spacial_customer_id = json.special_price[special_price1].customer_group_id;
		<?php foreach ($customer_groups as $customer_group) { ?>
		    var customer_id = '<?php echo $customer_group['customer_group_id']; ?>';
			if(customer_id == spacial_customer_id){
			     html += '<option value="<?php echo $customer_group['customer_group_id']; ?>" selected="selected"><?php echo addslashes($customer_group['name']); ?></option>';
				}else{
				  html += '<option value="<?php echo $customer_group['customer_group_id']; ?>"><?php echo addslashes($customer_group['name']); ?></option>';
				}			
		<?php } ?>		
		html += '  </select></td>';
		html += '  <td class="ptsc-productl-nodisplay" class="pts-text-right"><input id="prioritySpecialId" type="text" name="product_special[' + special_row + '][priority]" value="'+json.special_price[special_price1].priority+'" placeholder="<?php echo $entry_priority; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-right"><input id="priceSpecialId" type="text" name="product_special[' + special_row + '][price]" value="'+json.special_price[special_price1].price+'" placeholder="<?php echo $entry_price; ?>" class="pts-form-control" /></td>';
		html += '  <td class="ptsc-productl-nodisplay pts-text-left ptsc-product-width"><div class="pts-input-group date d-flex d-flex"><input id="dataStartSpecialId" type="text" name="product_special[' + special_row + '][date_start]" value="'+json.special_price[special_price1].date_start+'" placeholder="<?php echo $entry_date_start; ?>" data-date-format="YYYY-MM-DD" class="pts-form-control" /><span class="pts-input-group-pts-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
		html += '  <td class="ptsc-productl-nodisplay pts-text-left ptsc-product-width"><div class="pts-input-group date d-flex d-flex"><input id="dataEndSpecialId" type="text" name="product_special[' + special_row + '][date_end]" value="'+json.special_price[special_price1].date_end+'" placeholder="<?php echo $entry_date_end; ?>" data-date-format="YYYY-MM-DD" class="pts-form-control" /><span class="pts-input-group-pts-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></td>';
		html += '  <td class="pts-text-left"><button type="button" onclick="$(\'#special-pts-row' + special_row + '\').remove();" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('.quicksprice').append(html);
				}   
				special_row++;
                });
				$('.options-pts-row-class').remove();
				$('.tab-option-class-s').remove();
				$.each (json.product_option, function (product_option1,product_option2) { 
				html = '';
				//html += '<a href="#tab-option'+option_row+'" data-toggle="tab"><i class="fa fa-minus-circle" </i>'+json.product_option[product_option1].name+'</a>';				  
				$('.edit_option').append(html);
			html='';
			html  = '<div class="pts-tab-pane options-pts-row-class" id="tab-option' + option_row + '">';
			html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="'+json.product_option[product_option1].option_id+'" />';
			html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="'+json.product_option[product_option1].name+'" />';
			html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + json.product_option[product_option1].option_id + '" />';
			html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + json.product_option[product_option1].type + '" />';
			
			html += '	<div class="pts-form-group row">';
			html += '	  <label class="pts-col-sm-2 col-form-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
			html += '	  <div class="pts-col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="pts-form-control">';
			if(json.product_option[product_option1].required){
			    html += '<option value="1" selected="selected"><?php echo $text_yes; ?></option>';
			    html += '<option value="0"><?php echo $text_no; ?></option>';
				}else{
				html += '<option value="1"><?php echo $text_yes; ?></option>';
			    html += '<option value="0" selected="selected"><?php echo $text_no; ?></option>';
				}
			
			html += '	  </select></div>';
			html += '	</div>';
			
			if (json.product_option[product_option1].type == 'text') {
				html += '	<div class="pts-form-group row">';
				html += '	  <label class="pts-col-sm-2 col-form-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="'+json.product_option[product_option1].value+'" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="pts-form-control" /></div>';
				html += '	</div>';
			}
			
			if (json.product_option[product_option1].type == 'textarea') {
				html += '	<div class="pts-form-group row">';
				html += '	  <label class="pts-col-sm-2 col-form-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="pts-form-control">'+json.product_option[product_option1].value+'</textarea></div>';
				html += '	</div>';
			}
			
			if (json.product_option[product_option1].type == 'file') {
				html += '	<div class="pts-form-group row ptsc-productl-nodisplay">';
				html += '	  <label class="pts-col-sm-2 col-form-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="'+json.product_option[product_option1].value+'" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="pts-form-control" /></div>';
				html += '	</div>';
			}
			
			if (json.product_option[product_option1].type == 'date') {
				html += '	<div class="pts-form-group row">';
				html += '	  <label class="pts-col-sm-2 col-form-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-3"><div class="pts-input-group date d-flex d-flex"><input type="text" name="product_option[' + option_row + '][value]" value="'+json.product_option[product_option1].value+'" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="pts-form-control" /><span class="pts-input-group-pts-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
				html += '	</div>';
			}
			
			if (json.product_option[product_option1].type == 'time') {
				html += '	<div class="pts-form-group row">';
				html += '	  <label class="pts-col-sm-2 col-form-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><div class="pts-input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="'+json.product_option[product_option1].value+'" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="pts-form-control" /><span class="pts-input-group-pts-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
				html += '	</div>';
			}
			
			if (json.product_option[product_option1].type == 'datetime') {
				html += '	<div class="pts-form-group row">';
				html += '	  <label class="pts-col-sm-2 col-form-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><div class="pts-input-group date d-flex d-flextime"><input type="text" name="product_option[' + option_row + '][value]" value="'+json.product_option[product_option1].value+'" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="pts-form-control" /><span class="pts-input-group-pts-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
				html += '	</div>';
			}
			
			if (json.product_option[product_option1].type == 'select' || json.product_option[product_option1].type == 'radio' || json.product_option[product_option1].type == 'checkbox' || json.product_option[product_option1].type == 'image') {
				html += '<div class="pts-table-responsive">';
				html += '  <table id="option-value' + option_row + '" class="pts-table pts-table-striped pts-table-bordered pts-table-hover">';
				html += '  	 <thead>';
				html += '      <tr>';
				html += '        <td class="pts-text-left"><?php echo $entry_option_value; ?></td>';
				html += '        <td class="pts-text-right ptsc-productl-nodisplay"><?php echo $entry_quantity; ?></td>';
				html += '        <td class="pts-text-left ptsc-productl-nodisplay"><?php echo $entry_subtract; ?></td>';
				html += '        <td class="pts-text-right"><?php echo $entry_price; ?></td>';
				html += '        <td class="pts-text-right ptsc-productl-nodisplay"><?php echo $entry_option_points; ?></td>';
				html += '        <td class="pts-text-right ptsc-productl-nodisplay"><?php echo $entry_weight; ?></td>';
				html += '        <td></td>';
				html += '      </tr>';
				html += '  	 </thead>';
				html += '  	 <tbody>';
				$.each(product_option2.product_option_value,function (product_option_value3,product_option_value4){
					
				html += '	<tr id="option-value-pts-row'+option_value_row+'">';
				
				html += '  <td class="pts-text-left pts-product-option"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="pts-form-control">';
				$.each (json.product_option_values_data, function (product_option_values_data1,product_option_values_data2) { 
					
					$.each (product_option_values_data2, function (product_option_values_data3,product_option_values_data4) {
					
					if(product_option_value4.option_value_id==product_option_values_data4.option_value_id){
					    html+= '<option value="'+product_option_values_data4.option_value_id+'" selected="selected">'+product_option_values_data4.name+'</option>';
						}else{
						html+= '<option value="'+product_option_values_data4.option_value_id+'">'+product_option_values_data4.name+'</option>';
						}
					
					}); 
				}); 
				html += $('#option-values' + option_row).html();
				html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="'+product_option_value4.product_option_value_id+'" /></td>';
				html += '  <td class="pts-text-right pts-product-option ptsc-productl-nodisplay"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="'+product_option_value4.quantity+'" placeholder="<?php echo $entry_quantity; ?>" class="pts-form-control" /></td>';
				html += '  <td class="pts-text-left pts-product-option ptsc-productl-nodisplay"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="pts-form-control">';
				if(product_option_value4.subtract == 1){
				    html += '    <option value="1" selected="selected"><?php echo $text_yes; ?></option>';
				    html += '    <option value="0"><?php echo $text_no; ?></option>';
					}else{
					html += '    <option value="1"><?php echo $text_yes; ?></option>';
				    html += '    <option value="0" selected="selected"><?php echo $text_no; ?></option>';
					}
				
				html += '  </select></td>';
				html += '  <td class="pts-text-right pts-product-option"><select class="ptsc-productl-nodisplay" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="pts-form-control">';
				if(product_option_value4.price_prefix == '+'){
				    html += '    <option value="+" selected="selected">+</option>';
					}else{
					html += '    <option value="+">+</option>';				   
					}
				if(product_option_value4.price_prefix == '-'){				    
				    html += '    <option value="-" selected="selected">-</option>';
					}else{
				    html += '    <option value="-">-</option>';
					}
				
				html += '  </select>';
				html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="'+product_option_value4.price+'" placeholder="<?php echo $entry_price; ?>" class="pts-form-control" /></td>';
				html += '  <td class="pts-text-right pts-product-option ptsc-productl-nodisplay"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="pts-form-control">';
				if(product_option_value4.points_prefix == '+'){
				   html += '    <option value="+" selected="selected">+</option>';
				   
				}else{
				   html += '    <option value="+">+</option>';				  
					}
				if(product_option_value4.points_prefix == '-'){		
				   html += '    <option value="-" selected="selected">-</option>';
				}else{
				   html += '    <option value="+">-</option>';				   
					}	
				
				html += '  </select>';
				html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="'+product_option_value4.points+'" placeholder="<?php echo $entry_points; ?>" class="pts-form-control" /></td>';
				html += '  <td class="pts-text-right pts-product-option ptsc-productl-nodisplay"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="pts-form-control">';
				if(product_option_value4.weight_prefix == '+'){
				    html += '    <option value="+" selected="selected">+</option>';
					}else{
					html += '    <option value="+">+</option>';				   
					}
				if(product_option_value4.weight_prefix == '-'){				    
				    html += '    <option value="-" selected="selected">-</option>';
					}else{
				    html += '    <option value="-">-</option>';
					};
				html += '  </select>';
				html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="'+product_option_value4.weight+'" placeholder="<?php echo $entry_weight; ?>" class="pts-form-control" /></td>';
				html += '  <td class="pts-text-left pts-product-option"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-pts-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
				html += '';
				html += '	</tr>';
				   option_value_row++;
				   
					});
				html += '    </tbody>';
				html += '    <tfoot>';
				html += '      <tr>';
				html += '        <td colspan="2"></td>';
				html += '        <td class="pts-text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
				html += '      </tr>';
				html += '    </tfoot>';
				html += '  </table>';
				html += '</div>';
				
				html += '  <select id="option-values' + option_row + '" class="ptsc-productl-nodisplay">';
				$.each (json.product_option_values_data, function (product_option_values_data1,product_option_values_data2) { 
				$.each (product_option_values_data2, function (product_option_values_data3,product_option_values_data4) {
					
					html+= '<option value="'+product_option_values_data4.option_value_id+'">'+product_option_values_data4.name+'</option>';
					});
				});
				
				html += '  </select>';
				html += '</div>';
			}
			
			$('.quick_product_option').append(html);
			
			$('#option > li:last-child').before('<li class="tab-option-class-s"><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#option a:first\').tab(\'show\');$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove();"></i>' + json.product_option[product_option1].name + '</li>');
			
			$('#option a[href=\'#tab-option' + option_row + '\']').tab('show');
			
			$('[data-toggle=\'tooltip\']').tooltip({
				container: 'body',
				html: true
			});
			
			$('.date').datetimepicker({
				pickTime: false
			});
			
			$('.time').datetimepicker({
				pickDate: false
			});
			
			$('.datetime').datetimepicker({
				pickDate: true,
				pickTime: true
			});
			option_row++;
				});
				if(json.status == 1){
				 // $('#quick-product-status option[value=1]').prop('selected', 'selected');
				   $('input[name="quick_product_status"][value="1"]').prop('checked', true);
					}else{
					//$('#quick-product-status option[value=0]').prop('selected', 'selected');
					 $('input[name="quick_product_status"][value="0"]').prop('checked', true);
					}
				
				},
				error: function(json) {
				alert('error');
				}
				
			});
			
			$('#quick_edit_modal').modal('show'); 
		   	 //$('body').css('overflow', 'hidden');
			 
		}
	
// End Quick edit model function
</script>
<!--/ Start Quick edit popup model-->
<!-- Modal -->
<!-- The Modal -->
  <div class="modal" id="quick_edit_modal">
    <div class="modal-dialog quickviewmodal">
      <div class="modal-content">
      <form method="post" id="form_quick_edit">
        <!-- Modal Header -->
        <div class="modal-header">
                 <h4 class="modal-title" id="quick_edit_Label"><?php echo $title_quick_edit; ?></h4>		
           <button type="button" class="close pts-rtl-close ptsc-product-martop" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <ul class="pts-nav pts-nav-tabs nav nav-tabs" id="language">
							<input type="hidden" id="quick_product_id" name="quick_product_id" value="">
							<input type="hidden" name="seller_name" value="<?php echo $seller_name; ?>">
							<?php foreach ($languages as $language) { ?>
							<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /><?php echo $language['name']; ?></a></li>
							<?php } ?>
						</ul>
			<div class="pts-tab-content ">			
			<?php foreach ($languages as $language) { ?>		
			<div class="pts-tab-pane <?php echo $language['activetab'];?>" id="language<?php echo $language['language_id']; ?>">
			    <div class="pts-row">         
                  <div class="pts-col-sm-3 pts-form-group">
						<label class="pts-col-sm-2 pts-control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
				  </div>
				  <div class="pts-col-sm-9 pts-form-group product_name<?php echo $language['language_id']; ?>">
						
				</div>
			</div>
			</div>
			<?php } ?>
			</div>
			 <div class="pts-row"> 
				<div class="pts-col-sm-3 pts-form-group ">
						<label class="pts-control-label pts-col-form-label" for="quick-product-price"><?php echo $entry_price; ?></label>
				  </div>
				  <div class="pts-col-sm-9 pts-form-group">
						<input autocomplete="off" name="quick_product_price" value="" placeholder="" id="quick-product-price" class="pts-form-control" type="text" required>
				</div>
				
				</div>
				 <div class="pts-row"> 
				<div class="pts-col-sm-12 pts-form-group ">
						<label class="pts-control-label pts-col-form-label" for="quick-product-special-price"><?php echo $entry_special_price; ?></label>
				  </div>
				  <div class="pts-col-sm-12 pts-form-group">
				  <div class="pts-table-responsive">
						<table id="special" class="pts-table pts-table-striped pts-table-bordered pts-table-hover">
							<thead>
								<tr>
								    <td class="pts-text-left"><?php echo $entry_customer_group; ?></td>
									<td class="pts-text-right ptsc-productl-nodisplay"><?php echo $entry_priority; ?></td>
									<td class="pts-text-right"><?php echo $entry_price; ?></td>
									<td class="pts-text-left ptsc-productl-nodisplay"><?php echo $entry_date_start; ?></td>
									<td class="pts-text-left ptsc-productl-nodisplay"><?php echo $entry_date_end; ?></td>
									<td></td>
								</tr>
							</thead>
							<tbody class="quicksprice">
							</tbody>
							<tfoot>
								<tr class="ptsc-productl-nodisplay">
									<td colspan="5"></td>
									<td class="pts-text-left"><button id="addSpecialButtonId" type="button" onclick="addSpecial();" data-toggle="tooltip" title="<?php echo $button_special_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>
								</tr>
							</tfoot>
						</table>
				</div>
				</div>
				
				</div>
				 <div class="pts-row"> 
					<div class="pts-col-sm-3 pts-form-group">
						<label class="pts-control-label pts-col-form-label" for="quick-product-quantity"><?php echo $entry_quantity; ?></label>
				  </div>
				  <div class="pts-col-sm-9 pts-form-group">
						<input autocomplete="off" name="quick_product_quantity" value="" placeholder="<?php echo $entry_quantity; ?>" id="quick-product-quantity" class="pts-form-control" type="text">
					</div>
				</div>
				 <div class="pts-row"> 
				   <div class="pts-col-sm-3 pts-form-group">
						<label class="pts-control-label pts-col-form-label" for="quick-product-status"><?php echo $entry_status; ?></label>
				  </div>
				  <div class="pts-col-sm-9 pts-form-group">	
						<input  type="radio" name = "quick_product_status" class="ptsc-quiproduct-unwidhei" value="1">&nbsp <span class="ptsc-product-statuscoenb"> <?php echo $text_enabled; ?></span>&nbsp&nbsp 
                        <input  type="radio" name = "quick_product_status" class="ptsc-quiproduct-unwidhei" value="0">&nbsp <span class="ptsc-product-statuscodis"><?php echo $text_disabled; ?></span>
					</div>
				</div>
				<div class="pts-row"> 
					<div class="pts-col-sm-12 pts-form-group">
						<label class="pts-control-label pts-col-form-label" for="input-product-status"><?php echo $entry_option; ?></label>						
					</div>
						<div class="pts-col-sm-12 pts-form-group ">
						<div class="pts-col-sm-2">
							<ul class="pts-nav pts-nav-pills pts-nav-stacked" id="option">
								<li class="edit_option">
								</li>
								<li>
									<input type="text" name="option" value="" placeholder="<?php echo $entry_option; ?>" id="input-option" class="pts-form-control" />
								</li>
							</ul>
						</div>
						<div class="pts-col-sm-10">
							<div class="pts-tab-content quick_product_option">
						</div>
						</div>
						</div>
				</div>				
						            
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
		   <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo $button_cancel; ?></button>
                <button type="submit" class="btn btn-primary"><?php echo $button_save; ?></button>
        </div>
        </form>
      </div>
    </div>
  </div>
<script type="text/javascript"><!--	
	$('input[name=\'option\']').autocompletepts({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/option&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							category: item['category'],
							label: item['name'],
							value: item['option_id'],
							type: item['type'],
							option_value: item['option_value']
						}
					}));
				}
			});
		},
		'select': function(item) {
			html  = '<div class="pts-tab-pane options-pts-row-class" id="tab-option' + option_row + '">';
			html += '	<input type="hidden" name="product_option[' + option_row + '][product_option_id]" value="" />';
			html += '	<input type="hidden" name="product_option[' + option_row + '][name]" value="' + item['label'] + '" />';
			html += '	<input type="hidden" name="product_option[' + option_row + '][option_id]" value="' + item['value'] + '" />';
			html += '	<input type="hidden" name="product_option[' + option_row + '][type]" value="' + item['type'] + '" />';
			
			html += '	<div class="pts-form-group row">';
			html += '	  <label class="pts-col-sm-2 pts-control-label" for="input-required' + option_row + '"><?php echo $entry_required; ?></label>';
			html += '	  <div class="pts-col-sm-10"><select name="product_option[' + option_row + '][required]" id="input-required' + option_row + '" class="pts-form-control">';
			html += '	      <option value="1"><?php echo $text_yes; ?></option>';
			html += '	      <option value="0"><?php echo $text_no; ?></option>';
			html += '	  </select></div>';
			html += '	</div>';
			
			if (item['type'] == 'text') {
			 //alert('text');
				html += '	<div class="pts-form-group">';
				html += '	  <label class="pts-col-sm-2 pts-control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="pts-form-control" /></div>';
				html += '	</div>';
			}
			
			if (item['type'] == 'textarea') {
			 //alert('textarea');
				html += '	<div class="pts-form-group">';
				html += '	  <label class="pts-col-sm-2 pts-control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><textarea name="product_option[' + option_row + '][value]" rows="5" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="pts-form-control"></textarea></div>';
				html += '	</div>';
			}
			
			if (item['type'] == 'file') {
			 //alert('file');
				html += '	<div class="pts-form-group ptsc-productl-nodisplay">';
				html += '	  <label class="pts-col-sm-2 pts-control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" id="input-value' + option_row + '" class="pts-form-control" /></div>';
				html += '	</div>';
			}
			
			if (item['type'] == 'date') {
			 //alert('date');
				html += '	<div class="pts-form-group">';
				html += '	  <label class="pts-col-sm-2 pts-control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="col-sm-10"><div class="pts-input-group date"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD" id="input-value' + option_row + '" class="pts-form-control" /><span class="pts-input-group-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
				html += '	</div>';
			}
			
			if (item['type'] == 'time') {
			 //alert('time');
				html += '	<div class="pts-form-group">';
				html += '	  <label class="pts-col-sm-2 pts-control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><div class="pts-input-group time"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="HH:mm" id="input-value' + option_row + '" class="pts-form-control" /><span class="pts-input-group-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
				html += '	</div>';
			}
			
			if (item['type'] == 'datetime') {
			    //alert('datetime');
				html += '	<div class="pts-form-group">';
				html += '	  <label class="pts-col-sm-2 pts-control-label" for="input-value' + option_row + '"><?php echo $entry_option_value; ?></label>';
				html += '	  <div class="pts-col-sm-10"><div class="pts-input-group datetime"><input type="text" name="product_option[' + option_row + '][value]" value="" placeholder="<?php echo $entry_option_value; ?>" data-date-format="YYYY-MM-DD HH:mm" id="input-value' + option_row + '" class="pts-form-control" /><span class="pts-input-group-btn"><button type="button" class="pts-btn pts-btn-default"><i class="fa fa-calendar"></i></button></span></div></div>';
				html += '	</div>';
			}
			
			if (item['type'] == 'select' || item['type'] == 'radio' || item['type'] == 'checkbox' || item['type'] == 'image') {
			 //alert('checkbox to all');
				html += '<div class="pts-table-responsive">';
				html += '  <table id="option-value' + option_row + '" class="pts-table pts-table-striped pts-table-bordered pts-table-hover">';
				html += '  	 <thead>';
				html += '      <tr>';
				html += '        <td class="pts-text-left "><?php echo $entry_option_value; ?></td>';
				html += '        <td class="pts-text-right ptsc-productl-nodisplay"><?php echo $entry_quantity; ?></td>';
				html += '        <td class="pts-text-left ptsc-productl-nodisplay"><?php echo $entry_subtract; ?></td>';
				html += '        <td class="pts-text-right"><?php echo $entry_price; ?></td>';
				html += '        <td class="pts-text-right ptsc-productl-nodisplay"><?php echo $entry_option_points; ?></td>';
				html += '        <td class="pts-text-right ptsc-productl-nodisplay"><?php echo $entry_weight; ?></td>';
				html += '        <td></td>';
				html += '      </tr>';
				html += '  	 </thead>';
				html += '  	 <tbody>';
				html += '    </tbody>';
				html += '    <tfoot>';
				html += '      <tr>';
				html += '        <td colspan="2"></td>';
				html += '        <td class="pts-text-left"><button type="button" onclick="addOptionValue(' + option_row + ');" data-toggle="tooltip" title="<?php echo $button_option_value_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>';
				html += '      </tr>';
				html += '    </tfoot>';
				html += '  </table>';
				html += '</div>';
				
				html += '  <select id="option-values' + option_row + '" class="ptsc-productl-nodisplay">';
				
				for (i = 0; i < item['option_value'].length; i++) {
					html += '  <option value="' + item['option_value'][i]['option_value_id'] + '">' + item['option_value'][i]['name'] + '</option>';
				}
				
				html += '  </select>';
				html += '</div>';
			}
			
			$('.quick_product_option').append(html);
			
			$('#option > li:last-child').before('<li class="tab-option-class-s"><a href="#tab-option' + option_row + '" data-toggle="tab"><i class="fa fa-minus-circle" onclick=" $(\'#option a:first\').tab(\'show\');$(\'a[href=\\\'#tab-option' + option_row + '\\\']\').parent().remove(); $(\'#tab-option' + option_row + '\').remove();"></i>' + item['label'] + '</li>');
			
			$('#option a[href=\'#tab-option' + option_row + '\']').tab('show');
			
			$('[data-toggle=\'tooltip\']').tooltip({
				container: 'body',
				html: true
			});
			
			$('.date').datetimepicker({
				pickTime: false
			});
			
			$('.time').datetimepicker({
				pickDate: false
			});
			
			$('.datetime').datetimepicker({
				pickDate: true,
				pickTime: true
			});
			
			option_row++;
		}
	});

	function addOptionValue(option_row) {
		html  = '<tr id="option-value-pts-row' + option_value_row + '">';
		html += '  <td class="pts-text-left pts-product-option"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][option_value_id]" class="pts-form-control">';
		html += $('#option-values' + option_row).html();
		html += '  </select><input type="hidden" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][product_option_value_id]" value="" /></td>';
		html += '  <td class="pts-text-right pts-product-option ptsc-productl-nodisplay"><input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][quantity]" value="" placeholder="<?php echo $entry_quantity; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-left pts-product-option ptsc-productl-nodisplay"><select  name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][subtract]" class="pts-form-control">';
		html += '    <option value="1"><?php echo $text_yes; ?></option>';
		html += '    <option value="0"><?php echo $text_no; ?></option>';
		html += '  </select></td>';
		html += '  <td class="pts-text-right pts-product-option"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price_prefix]" class="pts-form-control ptsc-productl-nodisplay">';
		html += '    <option value="+">+</option>';
		html += '    <option value="-">-</option>';
		html += '  </select>';
		html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][price]" value="" placeholder="<?php echo $entry_price; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-right pts-product-option ptsc-productl-nodisplay"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points_prefix]" class="pts-form-control">';
		html += '    <option value="+">+</option>';
		html += '    <option value="-">-</option>';
		html += '  </select>';
		html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][points]" value="" placeholder="<?php echo $entry_points; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-right pts-product-option ptsc-productl-nodisplay"><select name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight_prefix]" class="pts-form-control">';
		html += '    <option value="+">+</option>';
		html += '    <option value="-">-</option>';
		html += '  </select>';
		html += '  <input type="text" name="product_option[' + option_row + '][product_option_value][' + option_value_row + '][weight]" value="" placeholder="<?php echo $entry_weight; ?>" class="pts-form-control" /></td>';
		html += '  <td class="pts-text-left pts-product-option"><button type="button" onclick="$(this).tooltip(\'destroy\');$(\'#option-value-pts-row' + option_value_row + '\').remove();" data-toggle="tooltip" rel="tooltip" title="<?php echo $button_remove; ?>" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button></td>';
		html += '</tr>';
		
		$('#option-value' + option_row + ' tbody').append(html);
		$('[rel=tooltip]').tooltip();
		
		option_value_row++;
	}
	
	var quick_form = $('#form_quick_edit');
	quick_form.submit(function (e) {
		e.preventDefault();	
			$.ajax({
				type: quick_form.attr('method'),
				url: 'index.php?route=account/purpletree_multivendor/sellerproduct/quickSave',
				data: quick_form.serialize(),
				success: function (json) {
					if(json.status == 'success') {
						if(json.productname && json.productname != '' && json.product_id && json.product_id != '') {
						$('.imagename'+json.product_id).attr('title',json.productname);
						$('.imagename'+json.product_id).attr('alt',json.productname);
						$('.h4name'+json.product_id).text(json.productname);
						$('.pts_price'+json.product_id).text(json.pts_price);
						$('.pts_quantity'+json.product_id).text(json.pts_quentity);
						$('.pts_status'+json.product_id).text(json.pts_status);
						if(json.pts_status_id == 1){
						    $('.pts_status'+json.product_id).css('display','#5cb85c');
						}else{
							 $('.pts_status'+json.product_id).css('display','#c73e38');
						}
							}
						
						$('#quick_edit_modal').modal('hide');
						//$('body').css('overflow', '');
						//$("html, body").animate({ scrollTop: 0 }, "slow");
						$(".plansave").html('<div class="alert pts-alert-success"><i class="fa fa-exclamation-circle"></i> 	'+ json.message +'</div>');	
						//$('.plansave').css('display','none');
						//location.reload();
						}else {
						$('.errorplan').html('<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i> '+ json.message +'</div>');
					}
				},
				error: function (json) {
					if(json.status == 'error') {
						$('.errorplan').html('<div class="alert pts-alert-danger"><i class="fa fa-exclamation-circle"></i> '+ json.message +'</div>');
						//$('div.modal , .modal-backdrop').show();
					}
				},
			});
			
	});
	var product_view = <?php echo $product_view; ?>;
	if(product_view == 1){
	      $(".pro-grid").show();
		  $(".pro-list").hide();
	}else{
	     $(".pro-list").show();
		 $(".pro-grid").hide();
	}
	$( document ).ready(function() {														
		$("#pro-grid-view").on("click", function() {
			$(".pro-grid").show();
			$(".pro-list").hide();
			$("#pro-list-view").removeClass("active");
		});
		$("#pro-list-view").on("click", function() {
			$(".pro-list").show();
			$(".pro-grid").hide();
			$("#pro-grid-view").removeClass("active");
		});
	}); 
//--></script>

<?php echo $footer; ?>
<style>
 body.modal-open {
    overflow: hidden !important;
}
</style>