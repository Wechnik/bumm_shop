<?php echo $header; ?>
<?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<!--div class="pull-right"-->
			<!-- a href="<?php //echo //$add; ?>" data-toggle="tooltip" title="<?php //echo $button_assign_new_plan; ?>" class="btn btn-primary"></i><?php //echo $button_assign_new_plan; ?></a -->
			<!--/div-->
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
			
			<div class="panel-body">
				
				<div class="panel-heading">
					<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_seller_plan_history; ?></h3>
				</div>
				<div class=" table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<td><?php echo /* $column_id */'SL'; ?></td>
								<td><?php echo $column_plan; ?></td>
								<td><?php echo $column_reminder; ?></td>
								<td><?php echo $column_status; ?></td>
								<td><?php echo $column_invoice_status; ?></td>
								<td><?php echo $column_Start_date; ?></td>
								<td><?php echo $column_End_date; ?></td>
								<td><?php echo $column_Created_Date; ?></td>
								<td><?php echo $column_action; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php if(!empty($subscriptions)){  $i=1;?>
								<?php foreach($subscriptions as $subscription){ ?>
									<tr>
										<td><?php echo $i; ?></td>
										<td><?php echo $subscription['plan_name']; ?></td>
										<td><?php echo $subscription['reminder']; ?></td>
										<td><?php echo $subscription['status']; ?></td>
										<td><?php echo $subscription['invoice_status']; ?></td>
										<td><?php echo $subscription['start_date']; ?></td>
										<td><?php echo $subscription['end_date']; ?></td>
										<td><?php echo $subscription['created_date']; ?></td>
										<td> 
											<a href="<?php echo $subscription['add_history']; ?>" data-toggle="tooltip" title="<?php echo $button_Add_Payment_History; ?>" class="btn btn-default"><i class="fa fa-plus"></i></a>
											
											<a href="<?php echo $subscription['view_invoice']; ?>"  target="_blank" data-toggle="tooltip" title="<?php echo $button_view_invoicw; ?>" class="btn btn-success"><i class="fa fa-eye"></i></a>
											
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