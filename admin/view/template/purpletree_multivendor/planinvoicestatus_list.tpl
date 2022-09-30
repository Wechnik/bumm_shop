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
		<div class="col-md-12 col-sm-12 form-group text-right">					
			<a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add_new_status; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
			<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-invoice').submit() : false;"><i class="fa fa-trash-o"></i></button>
			
		</div>
	</div>	
	<div class="col-md-12  col-sm-12">
        <div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-invoice">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td 
									class="text-center ptsc-vendorlis-width"><input onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" type="checkbox"></td>
									<td class="text-left"><?php echo $column_status_name; ?></td>
									<td class="text-left"><?php echo $column_created_date; ?></td>
									<td class="text-left"><?php echo $column_modified_date; ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if (isset($planinvoice_statuss)) { ?>
									<?php foreach ($planinvoice_statuss as $planinvoice_status) { ?>
										<tr>
											<!-- <td class="text-center ptsc-vendorlis-width"><input type="checkbox"></td> -->
											<td class="text-center ptsc-vendorlis-width"><?php if (in_array($planinvoice_status['status_id'], $selected)) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $planinvoice_status['status_id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox"  name="selected[]" value="<?php echo $planinvoice_status['status_id']; ?>" />
											<?php } ?>
											</td>
											
											<td class="text-left"><?php echo $planinvoice_status['invoice_status']; ?></td>
											<td class="text-left"><?php echo $planinvoice_status['created_date']; ?></td>
											<td class="text-left"><?php echo $planinvoice_status['modified_date']; ?></td>
										<td class="text-right"><a href="<?php echo $planinvoice_status['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>"class="btn btn-primary" " ><i class="fa fa-edit"></i></a></td>
									</tr>
								<?php } ?>
								<?php } else { ?>
								<tr>
									<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</form>
				<div class="col-sm-12">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
<?php echo $footer; ?>