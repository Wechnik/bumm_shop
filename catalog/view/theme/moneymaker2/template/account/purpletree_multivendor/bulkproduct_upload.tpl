<?php echo $header; ?>
<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
    </div>
  </div>
			<div class="pts-panel pts-panel-default">
				<div class="pts-panel-heading">
					<h3 class="pts-panel-title"><i class="fa fa-list"></i> <?php echo $text_bulk_product_upload; ?></h3>
				</div>
				
				<div class="pts-panel-body">
				<div class="col-sm-12">	
					<div class="pts-well">
						<div class="pts-row">
							<div class="pts-col-sm-12 pts-text-left">
								<div>
									<div>
										<label class="pts-control-label ptsc-font-normal" for="input-name"><?php echo $text_maxtime_info; ?></label><label class="ptsc-font-bold">&nbsp;<?php echo $max_time; ?>&nbsp;<?php echo 'seconds'; ?></label>
										
									</div>
									<div>
										
										<label class="pts-control-label ptsc-font-normal" for="input-name"><?php echo $text_file_size_info; ?> </label><label class="ptsc-font-bold">&nbsp;<?php echo $memory_limit; ?></label>
										
									</div>
									<div>
										
										<label class="ptsc-font-bold"><a href="<?php echo $seller_template;?>"><?php echo $seller_bulk_product_upload_sheet;?></a></label>
										
									</div>
									
								</div>
								
							</div>
						</div>
					</div>  
					</div>  
					<div class="col-sm-12">	
						<div class="pts-well">
							<h4 class="pts-panel-title ptsc-bulk-padding"> <span class="pts-title"><?php echo $text_bulk_product_export; ?></span></h4>
							<div class="pts-row">
								<form action="" method="post" enctype="multipart/form-data" id="form-export-product">
								<div class="pts-col-sm-4 pts-text-left">
									<div class="pts-form-group">
										<label class="pts-control-label" for="input-name" ><?php echo $entry_select_language; ?></label>
										<select name="language" id="input-status" class="pts-form-control">
											<?php foreach($lang as $langs) { ?> 
												<option value="<?php echo $langs['language_id']; ?>" ><?php echo $langs['name']; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								<div class="pts-col-sm-2 pts-col-sm-offset-6 pts-text-left">
									<div class="pts-form-group">
										<button type="submit" name="submit" value="<?php echo $button_upload; ?>" class="pts-btn pts-btn-primary" class="pts-button_add ptsc-bulkproduct-mar-toppadd" form="form-export-product" formaction="<?php echo $export; ?>"><?php echo $text_export; ?></button>
										
									</div>
								</div>
								</form>
							</div>
						</div>
						</div>
						<div class="col">	
						<div class="pts-col-sm-6">
						<div class="pts-well">
							<h4 class="pts-panel-title ptsc-bulk-padding"><span class="pts-title"> <?php echo $text_bulk_product_import_add; ?></span></h4>
							<div class="pts-row">							
								<form action="" method="post" enctype="multipart/form-data" id="form-add-product">
								<div class="pts-col-sm-12 pts-text-left">
									<div class="pts-form-group">
										<label class="pts-control-label" for="input-name" ><?php echo $entry_select_language; ?></label>
										<select name="language" id="input-status" class="pts-form-control">
											<?php foreach($lang as $langs) { ?>
												<option value="<?php echo $langs['language_id']; ?>" ><?php echo $langs['name']; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								
								
								<div class="pts-col-sm-12 pts-text-left">
									<div class="pts-form-group">
										<input type="file" class="ptsc-bulk-heimarr"  name="import">
										
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
								
								<div class="pts-col-sm-12 pts-text-left">
										<button type="submit" name="submit" value="<?php echo $button_upload; ?>" class="pts-btn pts-btn-primary" class="button_add ptsc-bulk-import-padmar" form="form-add-product" formaction="<?php echo $add_product; ?>"><?php echo $text_import; ?></button>
								</div>
								</form>
								
							</div>
						</div>
						</div>
						<div class="pts-col-sm-6">
						<div class="pts-well">
							<h4 class="pts-panel-title ptsc-bulk-padding"> <span class="pts-title"><?php echo $text_bulk_product_import_update; ?></span></h4>
							<div class="pts-row">
							 <form action="" method="post" enctype="multipart/form-data" id="form-update-product">
								<div class="pts-col-sm-12 pts-text-left">
									<div class="pts-form-group">
										<label class="pts-control-label" for="input-name" ><?php echo $entry_select_language; ?></label>
										<select name="language" id="input-status" class="pts-form-control">
											<?php foreach($lang as $langs) { ?>
												<option value="<?php echo $langs['language_id']; ?>" ><?php echo $langs['name']; ?></option>
											<?php } ?>
										</select>
									</div>
								</div>
								
								
								<div class="pts-col-sm-12 pts-text-left">
									<div class="pts-form-group">
										<input type="file"  class="ptsc-bulk-heimarr" name="import">
										
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
								
								<div class="pts-col-sm-12 pts-text-left">
									<button type="submit" name="submit" value="<?php echo $button_upload; ?>" class="pts-btn pts-btn-primary" class="button_add ptsc-bulk-import-padmar" form="form-update-product" formaction="<?php echo $update_product; ?>"><?php echo $text_update; ?></button>
								</div>
								</form>
							</div>
						</div>
						</div>
						</div>
				</div>
				<div class="pts-panel-heading">
        <h3 class="pts-panel-title"><i class="fa fa-exclamation-triangle"></i><?php echo $text_bulk_product_status_heading;?></h3>
      </div>
      <div class="pts-panel-body">
        <textarea wrap="off" rows="15" readonly class="pts-form-control">
  <?php if(!empty($status_msgs)){ foreach($status_msgs as $status_msg){ ?>
  <?php echo $status_msg['msg']; ?> 
  <?php }}?>
        </textarea>				
		</div>
			</div>
		</div>
	</div>
</div>
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
<?php echo $footer; ?>