<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-product" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-product" class="form-horizontal">      
					<div class="tab-content">           
						<ul class="nav nav-tabs" id="language">
							<?php foreach ($languages as $language) { ?>
								<li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a></li>
							<?php } ?>
						</ul>
						<div class="tab-content">
							<?php foreach ($languages as $language) { ?>
								<div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
										<div class="col-sm-10">
											<input type="text" name="blog_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['title'] : ''; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control" />
											<?php if (isset($error_name[$language['language_id']])) { ?>
												<div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group required">
										<label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
										<div class="col-sm-10">
											<textarea name="blog_description[<?php echo $language['language_id']; ?>][description]" placeholder="<?php echo $entry_description; ?>" id="input-description<?php echo $language['language_id']; ?>" class="form-control summernote"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['description'] : ''; ?></textarea>
											<?php if (isset($error_description[$language['language_id']])) { ?>
												<div class="text-danger"><?php echo $error_description[$language['language_id']]; ?></div>
											<?php } ?>
										</div>
									</div>
									<div class="form-group ">
										<label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_meta_title; ?></label>
										<div class="col-sm-10">
											<input type="text" name="blog_description[<?php echo $language['language_id']; ?>][meta_title]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_title'] : ''; ?>" placeholder="<?php echo $entry_meta_title; ?>" id="input-meta-title<?php echo $language['language_id']; ?>" class="form-control" />
											
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
										<div class="col-sm-10">
											<textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" placeholder="<?php echo $entry_meta_description; ?>" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
										<div class="col-sm-10">
											<textarea name="blog_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" placeholder="<?php echo $entry_meta_keyword; ?>" id="input-meta-keyword<?php echo $language['language_id']; ?>" class="form-control"><?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['meta_keyword'] : ''; ?></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label" for="input-meta-title<?php echo $language['language_id']; ?>"><?php echo $entry_post_tags; ?></label>
										<div class="col-sm-10">
											<input type="text" name="blog_description[<?php echo $language['language_id']; ?>][post_tags]" value="<?php echo isset($blog_description[$language['language_id']]) ? $blog_description[$language['language_id']]['post_tags'] : ''; ?>" placeholder="<?php echo $entry_post_tags; ?>" id="input-post_tags<?php echo $language['language_id']; ?>" class="form-control" />
										</div>
									</div>
								</div>
							<?php } ?>
						</div>
						<div class="form-group ptsc-sellerblog-bordertop">			 
							<div class="catdivdropp">
								<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" class="form-control" />
								<label class="col-sm-2 control-label" for="input-name"><?php echo $entry_seller_store; ?></label>
								<div class="col-sm-4" >
									<input type="text" name="store_name" value="<?php echo $store_name; ?>" placeholder="<?php echo $entry_seller_store; ?>" id="input-name" class="form-control" />
								</div>
							</div>							
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
							<div class="col-sm-10"><a href="" id="thumb-image" data-toggle="image" class="img-thumbnail"><img src="<?php echo $thumb; ?>" alt="" title="" data-placeholder="<?php echo $placeholder; ?>" /></a>
								<input type="hidden" name="image" value="<?php echo $image; ?>" id="input-image" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 control-label" for="input-keyword"><span data-toggle="tooltip" title=""><?php echo $entry_keyword; ?></span></label>
							<div class="col-sm-10">
								<input type="text" name="keyword" value="<?php echo $keyword; ?>" placeholder="<?php echo $entry_keyword; ?>" id="input-keyword" class="form-control" />
								<?php if ($error_keyword) { ?>
									<div class="text-danger"><?php echo $error_keyword; ?></div>
								<?php } ?>
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
						
						<?php if ($purpletree_multivendor_seller_blog_order == 1) { ?>
							
							<?php } else { ?>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
								<div class="col-sm-10">
									<input type="text" name="sort_order" value="<?php echo $sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
								</div>
							</div>			 
						<?php } ?> 		  
					</div>		
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="view/javascript/summernote/summernote.js"></script>
	<link href="view/javascript/summernote/summernote.css" rel="stylesheet" />
	<script type="text/javascript" src="view/javascript/summernote/opencart.js"></script>
	
	<script type="text/javascript"><!--
		$('#language a:first').tab('show');
	//--></script>
	
	<script type="text/javascript"><!--
		$('input[name=\'store_name\']').autocomplete({
			'source': function(request, response) {
				$.ajax({
					url: 'index.php?route=purpletree_multivendor/sellerblogpost/autosellerstore&token=<?php echo $token; ?>&store_name=' +  encodeURIComponent(request),
					
					dataType: 'json',	
					success: function(json) {
						response($.map(json, function(item) {
							return {
								label: item['name'],
								value: item['vendor_id']
							}
						}));
					}
				});
			},
			'select': function(item) {
				$('input[name=\'store_name\']').val(item['label']);
				$('input[name=\'seller_id\']').val(item['value']);
			}	
		});
		
		
	//--></script> 	
</div>
<?php echo $footer; ?>
