<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-subscription" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-subscription" class="form-horizontal">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
						<li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
						
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab-general">
							<ul class="nav nav-tabs" id="language">
								<?php foreach ($languages as $language) { ?>
									<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name'];?>" /> <?php echo $language['name']; ?></a></li>
								<?php } ?>
							</ul>
							<div class="tab-content">
								<?php foreach ($languages as $language) { ?>
									<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
										<div class="form-group required">
											<label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
											<div class="col-sm-10">
												<input type="text" name="subscription[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($subscription[$language['language_id']]) ? $subscription[$language['language_id']]['name']:''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
												<?php if (isset($error_name[$language['language_id']])) { ?>
													<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
												<?php } ?>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
											<div class="col-sm-10">			
												<textarea name="subscription[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($subscription[$language['language_id']]) ? $subscription[$language['language_id']]['description']:''; ?></textarea>
											</div>
										</div>
										
										<div class="form-group">
											<label class="col-sm-2 control-label" for="input-short_description<?php echo $language['language_id']; ?>"><?php echo $entry_short_description; ?></label>
											<div class="col-sm-10">
												<textarea name="subscription[<?php echo $language['language_id']; ?>][short_description]" rows="5" placeholder="<?php echo $entry_short_description; ?>" id="input-short_description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($subscription[$language['language_id']]) ? $subscription[$language['language_id']]['short_description']:''; ?></textarea>
											</div>
										</div>
										
									</div>
								<?php } ?>
							</div>
						</div>
						<div class="tab-pane" id="tab-data">
							<div class="form-group row">
							<label class="col-sm-2 control-label col-form-label" for="input-default_subscription_plan"><?php echo $entry_default_subscription_plan;?></span></label>
							<div class="col-sm-10">
								<input type="checkbox" name="default_subscription_plan" value="1" placeholder="<?php echo $entry_default_subscription_plan;?>" id="input-default_subscription_plan" class="form-control" <?php if($default_subscription_plan==1){ ?> checked <?php } ?>/>
							</div>
						</div>
						
						<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-no_of_product"><?php echo $entry_no_of_product; ?></span></label>
						<div class="col-sm-10">
							<input type="text" name="no_of_product" value="<?php echo $no_of_product; ?>" placeholder="<?php echo $entry_no_of_product; ?>" id="input-no_of_product" class="form-control" />
							<?php if ($error_no_of_product) { ?>
								<div class="text-danger"><?php echo $error_no_of_product; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-joinning_fee"><?php echo $entry_joinning_fee; ?></label>
						<div class="col-sm-10">
							<input type="text" name="joining_fee" value="<?php echo $joining_fee; ?>" placeholder="<?php echo $entry_joinning_fee; ?>" id="input-joinning_fee" class="form-control" />
							<?php if ($error_joining_fee) { ?>
								<div class="text-danger"><?php echo $error_joining_fee; ?></div>
							<?php } ?>
						</div>
					</div>
					
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-subscription_price"><?php echo $entry_subscription_price; ?></label>
						<div class="col-sm-10">
							<input type="text" name="subscription_price" value="<?php echo $subscription_price; ?>" placeholder="<?php echo $entry_subscription_price; ?>" id="input-subscription_price" class="form-control" />
							<?php if ($error_subscription_price) { ?>
								<div class="text-danger"><?php echo $error_subscription_price; ?></div>
							<?php } ?>
						</div>
					</div>
					
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-validity"><?php echo $entry_validity; ?></label>
						<div class="col-sm-10">
							<input type="text" name="validity" value="<?php echo $validity; ?>" placeholder="<?php echo $entry_validity; ?>" id="input-validity" class="form-control" />
							<?php if ($error_validity) { ?>
								<div class="text-danger"><?php echo $error_validity; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-no_of_featured_product"><?php echo $entry_no_of_featured_product ; ?></label>
						<div class="col-sm-10">
							<input type="text" name="no_of_featured_product" value="<?php echo $no_of_featured_product; ?>" placeholder="<?php echo $entry_no_of_featured_product; ?>" id="input-no_of_featured_product" class="form-control" />
							<?php if ($error_no_of_featured_product) { ?>
								<div class="text-danger"><?php echo $error_no_of_featured_product; ?></div>
							<?php } ?>
						</div>
					</div>			  
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-no_of_category_featured_product"><?php echo $entry_no_of_category_featured_product ; ?></label>
						<div class="col-sm-10">
							<input type="text" name="no_of_category_featured_product" value="<?php echo $no_of_category_featured_product; ?>" placeholder="<?php echo $entry_no_of_category_featured_product; ?>" id="input-no_of_category_featured_product" class="form-control" />
							<?php if ($error_no_of_category_featured_product) { ?>
								<div class="text-danger"><?php echo $error_no_of_category_featured_product; ?></div>
							<?php } ?>
						</div>
					</div>			  
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-featured_store"><?php echo $entry_allow_Store_featured; ?></label>
						<div class="col-sm-10">
							<select name="featured_store" id="input-featured_store" class="form-control">
								<?php if ($featured_store) { ?>
									<option value="1" selected="selected"><?php echo $text_yes; ?></option>
									<option value="0"><?php echo $text_no; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_yes; ?></option>
									<option value="0" selected="selected"><?php echo $text_no; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
					<div class="col-sm-10">
						<select name="status" id="input-status" class="form-control">
							<?php if ($status) { ?>
								<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
								<option value="0"><?php echo $text_disabled; ?></option>
								<?php } else { ?>
								<option value="1"><?php echo $text_enabled; ?></option>
								<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
							<?php } ?>
						</select>
					</div>
				</div>
			</div>
			
		</div>
	</form>
</div>
</div>
</div>
<link href="view/javascript/codemirror/lib/codemirror.css" rel="stylesheet" />
<link href="view/javascript/codemirror/theme/monokai.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/codemirror/lib/codemirror.js"></script> 
<script type="text/javascript" src="view/javascript/codemirror/lib/xml.js"></script> 
<script type="text/javascript" src="view/javascript/codemirror/lib/formatting.js"></script> 

<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
<script type="text/javascript" src="view/javascript/summernote/summernote-image-attributes.js"></script>
<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>

<script type="text/javascript"><!--
	$('input[name=\'path\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/category/autocomplete&user_token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					json.unshift({
						category_id: 0,
						name: '<?php echo $text_none; ?>'
					});
					
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['category_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'path\']').val(item['label']);
			$('input[name=\'parent_id\']').val(item['value']);
		}
	});
//--></script>
<script type="text/javascript"><!--
	$('input[name=\'filter\']').autocomplete({
		'source': function(request, response) {
			$.ajax({
				url: 'index.php?route=catalog/filter/autocomplete&user_token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
				dataType: 'json',
				success: function(json) {
					response($.map(json, function(item) {
						return {
							label: item['name'],
							value: item['filter_id']
						}
					}));
				}
			});
		},
		'select': function(item) {
			$('input[name=\'filter\']').val('');
			
			$('#category-filter' + item['value']).remove();
			
			$('#category-filter').append('<div id="category-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category_filter[]" value="' + item['value'] + '" /></div>');
		}
	});
	
	$('#category-filter').delegate('.fa-minus-circle', 'click', function() {
		$(this).parent().remove();
	});
//--></script>
<script type="text/javascript"><!--
	$('#language a:first').tab('show');
//--></script></div>
<?php echo $footer; ?>
