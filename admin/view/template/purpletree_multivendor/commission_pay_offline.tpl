<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-payoffline" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			</div>
			<h1><?php echo $heading_title1; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>" ><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i><?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-user"></i><?php echo $text_payment_settlement; ?></h3>
			</div>
			<div class="panel-body">
				<!----------------->
				<div class="ptsc-subscrip-pagebreak">
					<div class="well clearfix">
						<div class="col-sm-4"><h4><?php echo $total_text; ?></h4><?php echo $total_amount; ?></div>
						<div class="col-sm-4"><h4><?php echo $commision_product; ?></h4><?php echo $total_commission; ?></div>
						<div class="col-sm-4"><h4><?php echo $text_pay_amount; ?></h4><?php echo $total_pay; ?></div>
					</div>
					<form action="<?php echo $paymentoffline; ?>" method="post" enctype="multipart/form-data" id="form-payoffline" class="form-horizontal">
						<div class="tab-content">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="txn_id"><?php echo $column_transacton_id; ?></label>
								<div class="col-sm-10">
									<input type="hidden" name="invoice_id" id="invoice_id" data-toggle="summernote" data-lang="" class="form-control" value="<?php echo  $invoice_number; ?>">
									<input type="hidden" name="id" id="id" data-toggle="summernote" data-lang="" class="form-control" value="<?php echo $id; ?>">
									<input type="hidden" name="seller_id" id="seller_id" data-toggle="summernote" data-lang="" class="form-control" value="<?php echo $seller_id; ?>">
									<input type="text" name="txn_id" placeholder="<?php echo $column_transacton_id; ?>" id="txn_id" data-toggle="summernote" data-lang="" class="form-control" value="<?php echo $transaction_id; ?>">
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-2 control-label" for="amount"><?php echo $column_amount; ?></label>
								<div class="col-sm-10">
									<input type="text" disabled name="amount" placeholder="Amount" id="amount" data-toggle="summernote" data-lang="" class="form-control" value="<?php echo $total_pay_amount; ?>">
									<input type="hidden" name="amount" placeholder="<?php echo $column_amount; ?>" id="amount" data-toggle="summernote" data-lang="" class="form-control" value="<?php echo $total_pay_amount; ?>">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="payment_mode"><?php echo $column_payment_mode; ?></label>
								<div class="col-sm-10">
									<input type="text" name="payment_mode" disabled id="payment_mode" data-toggle="summernote" data-lang="" class="form-control" value="Offline">
									<input type="hidden" name="payment_mode"  id="payment_mode" data-toggle="summernote" data-lang="" class="form-control" value="Offline">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="status"><?php echo $column_statuss; ?></label>
								<div class="col-sm-10">
									<select name="status" id="status" data-toggle="summernote" data-lang="" class="form-control"> 
										<?php if ($status) { ?>
											<?php foreach ($status as $statuss) { ?>
												<option value="<?php echo $statuss['status']; ?>" <?php if ($statuss['status'] == $status_id) { ?> selected <?php } ?>> <?php echo $statuss['status']; ?></option>
											<?php } ?>
										<?php } ?>
										<!--option value="2" {% if status_id==2 %} selected {% endif %}> Complete </option-->
									</select> 
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="comment"><?php echo $column_commentt; ?></label>
								<div class="col-sm-10">
									<textarea type="text" name="comment" value="<?php echo $comment;?>" id="comment" placeholder="<?php echo $column_commentt; ?>" data-toggle="summernote" data-lang="" class="form-control"><?php echo $comment;?></textarea>
								</div>
							</div>
						</div>
					</form>
					
				</div>
				<!----------------->
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>
<script>
	function changeStatus() {
		var x = document.getElementById("status").value;
		var y="Disable";
		if(x==1){
			var y="Enable";
		}
		document.getElementById("change_status").innerHTML = y +" all products";
		document.getElementById("status_value").value = x;
		
	}
</script>