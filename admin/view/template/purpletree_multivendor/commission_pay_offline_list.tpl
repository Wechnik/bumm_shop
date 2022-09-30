<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<a type="submit" data-toggle="tooltip" title="Add" href="<?php echo $save; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
			</div>
			
			<h1><?php echo $heading_title1; ?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
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
						<div class="col-sm-4"><h4><?php echo $commision_product; ?></h4> <?php echo $total_commission; ?></div>
						<div class="col-sm-4"><h4><?php echo $text_pay_amount; ?></h4><?php echo $total_pay; ?></div>
					</div>
					
					<table class="table table-bordered">
						<thead>
							<tr>
								<td class="text-right"><?php echo $column_id; ?></td>
								<td class="text-right"><b><?php echo $column_transacton_id; ?></b></td>
								<td class="text-right"><b><?php echo $column_payment_mode; ?> </b></td>
								<td class="text-right"><b><?php echo $column_payment_date; ?> </b></td>
								<td class="text-right"><b><?php echo $column_commentt; ?> </b></td>
								<td class="text-right"><b><?php echo $column_statuss; ?></b></td>
								<td class="text-right"><b><?php echo $column_actionn; ?></b></td>
								
							</tr>
						</thead>
						<tbody>
							<?php if (isset($commission_history)) { ?>
								<?php foreach ($commission_history as $commission_hist) { ?>
									<tr>
										<td class="text-right"><?php echo $commission_hist['id']; ?></td>
										<td class="text-right"><?php echo $commission_hist['transaction_id']; ?></td>
										<td class="text-right"><?php echo $commission_hist['payment_mode']; ?></td>
										<td class="text-right"><?php echo $commission_hist['created_date']; ?></td>
										<td class="text-right"><?php echo $commission_hist['comment']; ?></td> 
										<td class="text-right"><?php echo $commission_hist['status_id']; ?></td> 
										<td class="text-right"><?php if ($commission_hist['link_show']) { ?><a href="<?php echo $commission_hist['link'] ?>" class="btn btn-primary" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
										</a><?php } ?></td> 
									</tr>
								<?php } ?>
							<?php } ?>
						</tbody>
					</table>
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