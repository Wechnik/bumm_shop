<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
		 <?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
			<h1><?php echo $heading_title; ?></h1>
			<ul class="breadcrumb">
				<?php foreach($breadcrumbs as $breadcrumb) { ?>
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
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_bulk_shipping_upload; ?></h3>
			</div>
			
			<div class="panel-body">
				<div class="well">
					<div class="row">
						<div class="panel-heading">
							<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_bulk_shipping_upload; ?></h3>
						</div>
						<div class="col-sm-12 text-left">
							<div>
								<div>
									<label class="control-label ptsc-bulkshipp-nofontweig" for="input-name"><?php echo $text_maxtime_info; ?></label><label class="ptsc-commission-fontbold">&nbsp;<?php echo $max_time; ?>&nbsp;<?php echo $text_seconds; ?></label>
									
								</div>
								<div>
									
									<label class="control-label ptsc-bulkshipp-nofontweig" for="input-name" ><?php echo $text_file_size_info; ?> </label><label class="ptsc-commission-fontbold">&nbsp;<?php echo $memory_limit; ?></label>
									
								</div>
							</div>
							
						</div>
					</div>
				</div> 
				<form action="<?php echo $export; ?>" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="well">
						<div class="row">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-download"></i> <?php echo $text_bulk_shipping_export_data; ?>	</h3>
							</div>
							<div class="col-sm-4 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_seller; ?></label>
									<select name="seller_id" id="input-status" class="form-control">
										<option value="" ><?php echo $text_none;?></option>
										<?php foreach($seller_id as $sellerId) {?>
											<option value="<?php echo $sellerId['seller_id']; ?>" ><?php echo $sellerId['store_name'].'( '.$sellerId['seller_id'].' )'; ?></option>
										<?php }?>
									</select>
									
								</div>
							</div>
							
							<div class="col-sm-2 col-md-offset-6 text-left">
								<div class="form-group">
									<input type="submit" value="<?php echo $button_export; ?>" class="btn btn-primary" class="button_add ptsc-upgrdatabas-padd" >
									
								</div>
							</div>
							
						</div>
					</div>
				</form>
				<form action="<?php echo $upload; ?>" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="well">
						<div class="row">
							<div class="panel-heading">
								<h3 class="panel-title"><i class="fa fa-upload"></i> <?php echo $text_bulk_shipping_upload; ?>	</h3>
							</div>
							<div class="col-sm-4 text-left">
								<div class="form-group">
									<label class="control-label" for="input-name" ><?php echo $entry_select_seller; ?></label>
									<select name="seller_id" id="input-status" class="form-control">
										<option value="" ><?php echo $text_none;?></option>
										<?php foreach($seller_id as $sellerId) {?>
											<option value="<?php echo $sellerId['seller_id']; ?>" ><?php echo $sellerId['store_name'].'( '.$sellerId['seller_id'].' )'; ?></option>
										<?php }?>
									</select>
								</div>
							</div>
							
							<div class="col-sm-6 text-left">
								<div class="form-group">
									<input type="file" class="ptsc-bulkupload-impheightt"  name="import">
									
								</div>
							</div>
							
							<div class="col-sm-2 text-left">
								<div class="form-group">
									<input type="submit" value="<?php echo $button_upload; ?>" class="btn btn-primary" class="button_add ptsc-upgrdatabas-padd" >
									
								</div>
							</div>
							
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
	
	<?php echo $footer; ?> 
