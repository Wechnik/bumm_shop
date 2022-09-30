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
     <h1><?php echo $heading_offline_payment; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
    </div>
  </div>
			<div class="pts-container container">
				<div class="pts-row">
					<div class="pts-col-sm-9">
						<div class="pts-col-sm-12 form-group p-0">
							<div class="pts-col-sm-12 bordr">
								<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="pts-col-sm-12 pts-form-horizontal">	
									<div class="pts-col-sm-12 form-group  p-0">
										<div class="pts-col-sm-6">
											<label><?php echo $column_enter_payment; ?></label>
										</div>
										<div class="pts-col-sm-6">
											<input type="hidden" name="invoice_id" value="<?php echo $invoice_id; ?>">
											<textarea rows="8" cols="100%"  name="comment" id="" class="form-control" placeholder="<?php echo $entry_enter_payment; ?>"></textarea>
										</div>
										<div class="pts-col-sm-12 form-group text-right m-t10">
											<button type="submit" class="btn btn-primary"><?php echo $button_save_offline; ?></button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>