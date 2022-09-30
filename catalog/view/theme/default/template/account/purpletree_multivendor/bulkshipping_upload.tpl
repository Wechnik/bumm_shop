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
					<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_bulk_shipping_upload; ?></h3>
				</div>
				<div class="pts-panel-body">
					<div class="well">
						<div class="row">
							<div class="col-sm-12 pts-text-left">
								<div>
									<div>
										<label class="control-label ptsc-font-normal" for="input-name"><?php echo $text_maxtime_info; ?></label><label class="ptsc-font-bold">&nbsp;<?php echo $max_time; ?>&nbsp;<?php echo $text_seconds; ?></label>
										
									</div>
									<div>
										
										<label class="control-label ptsc-font-normal" for="input-name"><?php echo $text_file_size_info; ?> </label><label class="ptsc-font-bold">&nbsp;<?php echo $memory_limit; ?></label>
										
									</div>
								</div>
								
							</div>
						</div>
					</div>  
					<form action="<?php echo $export; ?>" method="post" enctype="multipart/form-data" id="form-customer">
						<div class="pts-well">
							<div class="pts-row">
								<div class="pts-panel-heading">
									<h3 class="pts-panel-title"><i class="fa fa-download"></i><?php echo $text_bulk_shipping_export; ?></h3>
								</div>
								
								<div class="pts-col-sm-12 pts-text-left">
									<div class="form-group">
										<input type="submit" value="<?php echo $button_export; ?>" class="btn btn-primary" class="button_add ptsc-bulk-shipp-padding" >
										
									</div>
								</div>
								
							</div>
						</div>
					</form>
					<form action="<?php echo $upload; ?>" method="post" enctype="multipart/form-data" id="form-customer">
						<div class="pts-well">
							<div class="pts-row">
								<div class="pts-panel-heading">
									<h3 class="pts-panel-title"><i class="fa fa-upload"></i> <?php echo $text_bulk_shipping_upload; ?></h3>
								</div>
								
								<div class="pts-col-sm-6 pts-text-left">
									<div class="pts-form-group">
										<input id="ptsshippingxml" type="file" class="ptsc-bulk-shipp-height"  name="import">
									</div>
								</div>
								<div class="pts-col-sm-6 pts-text-left">
									<div class="pts-form-group">
										<input id="ptsshippingsubmit" type="submit" value="<?php echo $button_upload; ?>" class="btn btn-primary" class="button_add ptsc-bulk-shipp-padding" >
										
									</div>
								</div>
								
							</div>
						</div>
					</form>
					
				</div>
				
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>