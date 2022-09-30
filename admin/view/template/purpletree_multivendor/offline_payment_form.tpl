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
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-credit-card"></i><?php echo $text_offline_payment_form_invoice_id; ?>#<?php echo $invoice_id; ?></h3> 
			</div>
			<div class="panel-body">
				<form name="savestatus" method="post">
					<div class="row">
						<div class="col-sm-12">
							<div class="col-sm-3">
								<label class="control-label"><?php echo $text_status; ?></label>
							</div>
							<div class="col-sm-9">
								<select name="status_id" class="form-control">
									<?php if ($statuslist) { ?>
										<?php foreach ($statuslist as $statuss) { ?>
											<?php if ($currentstatus['status_id'] == $statuss['status_id']) { ?>
												<option value="<?php echo $statuss['status_id']; ?>" selected="selected"><?php echo $statuss['status']; ?></option>									
												<?php } else { ?>
												<option value="<?php echo $statuss['status_id']; ?>" ><?php echo $statuss['status']; ?></option>
											<?php } ?>	
											
										<?php } ?>
									<?php } ?>
								</select>
							</div>
						</div>
						<div class="col-sm-12 form-group">
							<div class="col-sm-3">
								<label class="control-label"><?php echo $text_payment_mode; ?></label>
							</div>
							<div class="col-sm-9">
								<input type="text" readonly disabled class="form-control" value="Offline"/>
							</div>
						</div>
						<div class="col-sm-12">
							<div class="col-sm-3">
								<label class="control-label"><?php echo $text_transaction_id; ?></label>
							</div>
							<div class="col-sm-9">
								<input type="text" name="transaction_id" id="" class="form-control" />
							</div>
						</div>
						<div class="col-sm-12 form-group">
							<div class="col-sm-3">
								<label class="control-label"><?php echo $text_comment; ?> </label>
							</div>
							<div class="col-sm-9">
								<textarea rows="8" cols="100%" name="comment" id="" class="form-control" ></textarea>
							</div>
						</div>
						<div class="col-sm-12 ">
							<div class="col-sm-12 text-right">
								<input type="submit" class="btn btn-primary" value="<?php echo $button_saveAndEnableSubscription; ?>" id="saveAndEnableSubscription" formaction="<?php echo $saveAndEnableSubscription;?>" />
								<input type="submit" class="btn btn-primary" value="<?php echo $button_save; ?>" />
							</div>
						</div>	
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>