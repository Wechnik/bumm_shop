<?php echo $header;?>
<?php echo $column_left;?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		<?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
			<h1><?php echo $heading_title;?></h1>
			<ul class="breadcrumb">
				<?php foreach($breadcrumbs as $breadcrumb){ ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text'];?></a></li>
				<?php }?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if($error_warning){?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php }?>
		<?php if($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success;?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_bulk_product_upload; ?></h3>
			</div>
			
			<div class="panel-body">
			<div class="col-sm-12">	
				<div class="well">
					<div class="row">
						<div class="col-sm-12 text-left">
							<div>
								<div>
									<label class="control-label ptsc-bulkshipp-nofontweig" for="input-name">&nbsp;<?php echo $text_maxtime_info; ?></label><label class="ptsc-commission-fontbold">&nbsp;<?php echo $max_time.' '.$text_seconds; ?></label>
									
								</div>
								<div>
									
									<label class="control-label ptsc-bulkshipp-nofontweig" for="input-name" >&nbsp;<?php echo $text_file_size_info; ?> </label><label class="ptsc-commission-fontbold">&nbsp;<?php echo $memory_limit; ?></label>
									
								</div>
								<div>
									
									<label class="ptsc-commission-fontbold"><a href="<?php echo $admin_template;?>"><?php echo $admin_bulk_product_upload_sheet;?></a></label>
									
								</div>
							</div>
							
						</div>
					</div>
				</div>  
				</div>  
		<div class="col-sm-12">	
			<div class="well">
				<h4 class="panel-title ptsc-bulkupload-padd"> <span class="pts-title"><?php echo $text_bulk_product_export; ?> </span></h4>
					<div class="row">
						<form action=""  method="post" enctype="multipart/form-data" id="form-export-product">
							<div class="col-sm-6 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_seller;?></label>
									<select name="seller_id" id="input-status" class="form-control">
										
										<option value="" ><?php echo $text_none;?> </option>
										<?php foreach($seller_id as $seller_id2){ ?>
											
											<option value="<?php echo $seller_id2['seller_id']; ?>" ><?php echo $seller_id2['store_name'].' ( '.$seller_id2['seller_id'].' )'; ?></option>
										<?php } ?>
									</select>
									
								</div>
							</div>
							
							<div class="col-sm-6 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_language;?></label>
									<select name="language" id="input-status" class="form-control">
										<?php foreach($lang as $lang2 ){ ?>
											<option value="<?php echo $lang2['language_id']; ?>" <?php if($lang2['default']){ ?> selected  <?php } ?> ><?php echo $lang2['name']; ?></option>
										<?php } ?>
									</select>
									
								</div>
							</div>
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<input type="submit" value="<?php echo $text_export; ?>" class="btn btn-primary" class="button_add ptsc-bulkupload-btnadd" form="form-export-product" formaction="<?php echo $export; ?>">
									
						</div>
					</div>
				</form>	
			</div>
		</div>
	</div>
		<div class="col">				
			<div class="col">
				<div class="col-sm-6">
					<div class="well">
						<h4 class="panel-title ptsc-bulkupload-padd"><span class="pts-title"><?php echo $text_bulk_product_import_add; ?> </span></h4>
						<div class="row">
							<form action="" method="post" enctype="multipart/form-data" id="form-add-product">
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_seller;?></label>
									<select name="seller_id" id="input-status" class="form-control">
										
										<option value="" ><?php echo $text_none;?> </option>
										<?php foreach($seller_id as $seller_id1){ ?>
											
											<option value="<?php echo $seller_id1['seller_id']; ?>" ><?php echo $seller_id1['store_name'].' ( '.$seller_id1['seller_id'].' )'; ?></option>
										<?php } ?>
									</select>
									
								</div>
							</div>
							
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_language;?></label>
									<select name="language" id="input-status" class="form-control">
										<?php foreach($lang as $lang1 ){ ?>
											<option value="<?php echo $lang1['language_id']; ?>" <?php if($lang1['default']){ ?> selected  <?php } ?> ><?php echo $lang1['name'];?></option>
										<?php } ?>
									</select>
									
								</div>
							</div>
							
							
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<input type="file" class="ptsc-bulkupload-impheight"   name="import">
									
								</div>
							</div>

						<div class="col-sm-12 text-left">
								<div class="form-group" style="float:left">
									<input id="pts-existing-product" type="checkbox" class="ptsc-bulkupload-impheight"  name="import_existing_products">
								</div>
								<label class="" style="padding-top:15px; padding-left:5px" for="pts-existing-product" ><?php echo $text_check_existing_products; ?></label>
							</div>
							<div class="col-sm-12 text-left pts-existing-product">
								<div class="col-sm-6 text-left" style="padding-left: 0px !important;">
									<div class="form-group"><label class="control-label col-form-label" for="pts-product-column" ><?php echo $text_matching_column; ?></label>
									</div>	
								</div>	
								<div class="col-sm-6 text-left">
									<div class="form-group">
										<select id="pts-product-column" class="form-control"  name="import_product_column">
											<option value="product_id"><?php echo $text_product_id; ?> </option>
											<option value="model"><?php echo $text_product_model; ?></option>
											<option value="sku" selected><?php echo $text_product_sku; ?></option>
											<option value="upc"><?php echo $text_product_upc; ?></option>
											<option value="ean"><?php echo $text_product_ean; ?></option>
											<option value="jan"><?php echo $text_product_jan; ?></option>
											<option value="isbn"><?php echo $text_product_isbn; ?></option>
											<option value="mpn"><?php echo $text_product_mpn; ?></option>
										</select>
									</div>
								</div>
							</div>	

							<div class="col-sm-12 text-left">
									<button type="submit" name="submit" value="<?php echo $button_upload; ?>" class="btn btn-primary" class="button_add ptsc-upgrdatabas-padd" form="form-add-product" formaction="<?php echo $add_product; ?>" ><?php echo $text_import; ?></button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
				
		<div class="col">
			<div class="col-sm-6">
				<div class="well">
						<h4 class="panel-title ptsc-bulkupload-padd"><span class="pts-title"><?php echo $text_bulk_product_import_update; ?> </span></h4>
						<div class="row">
						<form action="" method="post" enctype="multipart/form-data" id="form-update-product">
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_seller;?></label>
									<select name="seller_id" id="input-status" class="form-control">
										
										<option value="" ><?php echo $text_none;?> </option>
										<?php foreach($seller_id as $seller_id1){ ?>
											
											<option value="<?php echo $seller_id1['seller_id']; ?>" ><?php echo $seller_id1['store_name'].' ( '.$seller_id1['seller_id'].' )'; ?></option>
										<?php } ?>
									</select>
									
								</div>
							</div>
							
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_language;?></label>
									<select name="language" id="input-status" class="form-control">
										<?php foreach($lang as $lang1 ){ ?>
											<option value="<?php echo $lang1['language_id']; ?>" <?php if($lang1['default']){ ?> selected  <?php } ?> ><?php echo $lang1['name'];?></option>
										<?php } ?>
									</select>
									
								</div>
							</div>
							
							
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<input type="file" class="ptsc-bulkupload-impheight"  name="import">
									
								</div>
							</div>
													
							<div class="col-sm-12 text-left">
								<div class="col-sm-6 text-left" style="padding-left: 0px !important;">
									<div class="form-group"><label class="control-label col-form-label" for="pts-update-product-column" ><?php echo $text_matching_column; ?></label>
									</div>	
								</div>	
								<div class="col-sm-6 text-left">
									<div class="form-group">
										<select id="pts-update-product-column" class="form-control"  name="update_product_column">
											<option value="product_id"><?php echo $text_product_id; ?> </option>
											<option value="model"><?php echo $text_product_model; ?></option>
											<option value="sku" selected><?php echo $text_product_sku; ?></option>
											<option value="upc"><?php echo $text_product_upc; ?></option>
											<option value="ean"><?php echo $text_product_ean; ?></option>
											<option value="jan"><?php echo $text_product_jan; ?></option>
											<option value="isbn"><?php echo $text_product_isbn; ?></option>
											<option value="mpn"><?php echo $text_product_mpn; ?></option>
										</select>
									</div>
								</div>
							</div>	

							<div class="col-sm-12 text-left">
									<button type="submit" name="submit" value="<?php echo $button_upload; ?>" class="btn btn-primary" class="button_add ptsc-upgrdatabas-padd" form="form-update-product" formaction="<?php echo $update_product; ?>"><?php echo $text_update; ?></button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
	
			</div>
		<div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-exclamation-triangle"></i><?php echo $text_bulk_product_status_heading;?></h3>
      </div>
      <div class="panel-body">
        <textarea wrap="off" rows="15" readonly class="form-control">
  <?php if(!empty($status_msgs)){ foreach($status_msgs as $status_msg){ ?>
  <?php echo $status_msg['msg']; ?> 
  <?php }}?>
        </textarea>				
		</div>
	</div>
	
	<?php echo $footer;?>
	<script type="text/javascript">
	
	$( "#pts-existing-product" ).change(function(e) {
			var checked = e.currentTarget.checked;
			if(checked){
				$(".pts-existing-product" ).css( "display","block" );
			} else {
				$(".pts-existing-product" ).css( "display","none" );
			}
		}).change();
	
		function checkbox()
		{
			var checkboxselect=document.getElementById("check").checked;
			if(checkboxselect)
			{
				document.getElementById("check").checked=false;
				} else {
				document.getElementById("check").checked=true;	
			}
		}
	</script>	