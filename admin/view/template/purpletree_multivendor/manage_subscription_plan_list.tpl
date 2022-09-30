<?php echo $header; ?><?php echo $column_left; ?>
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
			<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
			</div>
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="form-category">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php echo $column_seller_name; ?></td>
									<td class="text-right"><?php echo $column_status; ?></td>
									<td class="text-right"><?php echo $column_no_of_active_plan; ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if (!empty($subscriptions)) { ?>
									<?php foreach ($subscriptions as $subscription) { ?>
										<?php if ($subscription['customer_status']) { ?>
											<tr>
												<td class="text-center"><?php if (in_array($subscription['plan_id'],$selected)) { ?>
													<input type="checkbox" name="selected[]" value="<?php echo $subscription['plan_id']; ?>" checked="checked" />
													<?php } else { ?>
													<input type="checkbox" name="selected[]" value="<?php echo $subscription['plan_id']; ?>" />
												<?php } ?></td>
												<td class="text-left"><?php echo $subscription['store_name']; ?></td>
												<td class="text-right"><?php echo $subscription['status']; ?></td>
												<td class="text-right"><?php  echo $subscription['no_of_active_plan'] ;  ?></td>
												
												<td class="text-right"><a href="<?php echo $subscription['view']; ?>" data-toggle="tooltip" title="View" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
											</tr>
											
										<?php } } ?>
										<?php } else { ?>
										<tr>
											<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
										</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</form>
				<!--   <div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div> -->
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>