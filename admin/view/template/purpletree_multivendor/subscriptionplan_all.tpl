<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
			<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_assign_new_plan; ?>" class="btn btn-primary"></i><?php echo $button_assign_new_plan; ?></a>
			<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
		</div>
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
			<h3 class="panel-title"><i class="fa fa-user"></i><?php echo $text_list_Seller_Plan_View; ?></h3>
		</div>
		<div class="panel-body">
			<div class="well-xs ptsc-subscrip-updbgmarbotpadd">
				<div class="row">
					
					<form name="subscription_status" method="POST" id="subscription_status" >
						<div class="col-sm-12 ptsc-subscrip-updatstpadbor">
							<h5><b><?php echo $update_subscription_status; ?></b></h5>
						</div>
						<div class="col-sm-12 form-group update_subscription">
							<div class="col-sm-3 p-9 ptsc-subscrip-updatstmartop">
								<label> <?php echo $update_subscription_status; ?></label>
							</div>
							<div class="col-sm-4 ptsc-subscrip-statusmartop">
								<?php if($subscription_status==1){
									$statuss=$text_enabled_all_products;
									} else {
									$statuss=$text_disabled_all_products;
								}
								?>							
								<input type="checkbox" name="subscription_disable" value="<?php echo $subscription_status; ?>" id="status_value" >
								<label id="change_status" for="status_value">
									<?php echo $statuss;?>
								</label>
							</div>
							
							<div class="col-sm-2 p-9">
								<select class="form-control" name="subscription_status" id="status" onchange="changeStatus()" >
									<option <?php if($subscription_status){ ?> selected="selected" <?php } ?> id="subscribenabled" value="1" > <label for="subscribenabled"><?php echo $column_Enabled; ?></label></option>
									
									<option <?php if(!$subscription_status){ ?> selected="selected"<?php } ?> id="subscribdisabled"  value="0"> <label for="subscribdisabled"><?php echo $column_Disabled; ?></label></option>
								</select>
							</div>
							<div class="col-sm-3 text-left ptsc-subscrip-plmartop">
								<button type="submit" name="" class="btn btn-primary"><?php echo $button_update; ?></button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class=" well well-bg-w ptsc-subscrip-plpadd">
				
				<div class="row">
					<div class="col-sm-12 ptsc-subscrip-plpadbormarbot">
						<h5><b><?php echo $subscription_details; ?></b></h5>
					</div>
					<?php if(!empty($current_plan)){ ?>
						<?php if(!empty($current_plan['seller_name'])){ ?>
							<div class="col-sm-8">
								<p><strong><?php echo $column_seller_name; ?>: </strong><?php echo $current_plan['seller_name']; ?></p>
								<p><strong><?php echo $column_allowed_products; ?>: </strong><?php echo $current_plan['used_products'].'/'.$current_plan['no_of_product']; ?> </p>
								
								<p><strong><?php echo $text_category_featured_products; ?>: </strong><?php echo  $current_plan['total_category_featured_product'].'/'. $current_plan['no_of_category_featured_product']; ?></p>
								
							</div>
							<div class="col-sm-4">
								<p><strong><?php echo $column_subscription_status; ?>: </strong><?php echo $subscriptions_status; ?>
									<p><strong><?php echo $text_featured_products; ?>: </strong><?php echo  $current_plan['total_featured_product'].'/'. $current_plan['no_of_featured_product']; ?></p>
									
								</div>
							<?php } ?>
						<?php } ?>
					</div>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_subscription_plans; ?></h3>
				</div>
				<div class=" table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td><?php echo $column_id; ?></td>
								<td><?php echo $column_plan; ?></td>
								<td><?php echo $column_status; ?></td>
								<td><?php echo $column_invoice_status; ?></td>
								<td><?php echo $column_Start_date; ?></td>
								<td><?php echo $column_End_date; ?></td>
								<td><?php echo $column_action; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php /* echo "<pre>"; print_r($currentPlans);die; */ if(!empty($currentPlans)){ ?>
								<?php $i=1; foreach($currentPlans as $key=>$result){ ?>
									<tr>
										<td><?php echo $i; ?></td>
										<td><?php echo $result['plan_name']; ?></td>
										<td><?php echo $result['status']; ?></td>
										<td><?php echo $result['invoice_status']; ?></td>
										<td><?php echo $result['start_date']; ?></td>
										<td><?php echo $result['end_date']; ?></td>
										<td> 										 
											<a href="<?php echo $result['view_plan']; ?>" data-toggle="tooltip" title="<?php echo $button_view_invoicw; ?>" class="btn btn-success"><i class="fa fa-eye"></i></a>
											<a href="<?php echo $result['edit_plan']; ?>" data-toggle="tooltip" title="<?php echo $button_renewplan; ?>" class="btn btn-success"><i class="fa fa-pencil"></i></a>
											
										</td>
									</tr>
								<?php $i++; } ?>
								<?php } else { ?>
								<tr>
									<td class="text-center" colspan="6"><?php echo $column_No_Records_Found; ?></td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
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