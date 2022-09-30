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
				<?php foreach($breadcrumbs as $breadcrumb){ ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if($error_warning){ ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if($success){ ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $column_plan; ?></h3>
			</div>
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="form-category">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-left"><?php echo $column_sl; ?></td>
									<td class="text-left"><?php echo $column_plan_name; ?></td>
									<td class="text-left"><?php echo $column_sellername; ?></td>
									<td class="text-left"><?php echo $column_subscription_status; ?></td>
									<td class="text-left"><?php echo $column_invoice_status; ?></td>
									<td class="text-left"><?php echo $column_start_date; ?></td>
									<td class="text-left"><?php echo $column_End_date; ?></td>
									<td class="text-left"><?php echo $column_create_date; ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>    
							</thead>
							<tbody>
								<?php if(isset($subscriptions)) { ?>
									<?php foreach($subscriptions as $subscription){ ?>
										<tr>
											<td class="text-left"><?php echo $subscription['id']; ?></td>
											<td class="text-left"><?php echo $subscription['plan_name']; ?></td>
											<td class="text-left"><?php echo $subscription['seller_name']; ?></td>
											<td class="text-left"><?php echo $subscription['subscription_status']; ?></td>
											<td class="text-left"><?php echo $subscription['invoice_status']; ?></td>
											<td class="text-left"><?php echo $subscription['start_date']; ?></td>
											<td class="text-left"><?php echo $subscription['end_date']; ?></td>
											<td class="text-left"><?php echo $subscription['created_date']; ?></td>
											<td> 
												<a href="<?php echo $subscription['add_history']; ?>" data-toggle="tooltip" title="<?php echo $button_Add_Payment_History; ?>" class="btn btn-default"><i class="fa fa-plus"></i></a>		 
												<a href="<?php echo $subscription['view_invoice'] ;?>"  target="_blank" data-toggle="tooltip" title="<?php echo $button_view_invoicw ?>" class="btn btn-success"><i class="fa fa-eye"></i></a>
												
											</td>
										</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="text-center" colspan="10"><?php echo $text_no_results; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div> 
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>