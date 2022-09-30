<?php echo $header;?><?php echo $column_left;?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right float-right">
				<a href="<?php echo $add;?>" data-toggle="tooltip" title="<?php echo $button_add;?>" class="btn btn-primary"><i class="fa fa-plus"></i></a> 
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete;?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm;?>') ? $('#form-category').submit() : false;"><i class="fa fa-trash-o fas fa-trash-alt"></i></button>
				 <?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			<?php } ?>
			</div>
			<h1><?php echo $heading_title;?></h1>
			<ul class="breadcrumb">
				<?php foreach ($breadcrumbs as $breadcrumb) { ?>
					<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php } ?>
			</ul>
		</div>
	</div>
	<div class="container-fluid">
		<?php if($error_warning) { ?>
		<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning;?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php  }  ?>
		<?php if($success) { ?>
		<div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> <?php echo $success;?>
			<button type="button" class="close" data-dismiss="alert">&times;</button>
		</div>
		<?php  }  ?>
		<div class="panel panel-default card">
			<div class="panel-heading">
				<h3 class="panel-title card-header"><i class="fa fa-list"></i> <?php echo $text_list;?></h3>
			</div>
			<div class="panel-body card-body">
				<form action="<?php echo $delete;?>" method="post" enctype="multipart/form-data" id="form-category">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php echo $column_name;?></td>
									
									<td class="text-left"><?php echo $column_sort_order;?></td>
									<td class="text-right"><?php echo $column_status;?></td>
									<td class="text-right"><?php echo $column_action;?></td>
								</tr>    
							</thead>
							<tbody>
								<?php if($sellerareas) { ?>
								<?php foreach ($sellerareas as $sellerarea) { ?>
								<tr>
									<td class="text-center"><?php if (in_array($sellerarea['area_id'],$selected)) { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $sellerarea['area_id'];?>" checked="checked" />
										<?php } else { ?>
										<input type="checkbox" name="selected[]" value="<?php echo $sellerarea['area_id'];?>" />
									<?php  }  ?></td>
									<td class="text-left"><?php echo $sellerarea['area_name'];?></td>									
									<td class="text-left"><?php echo $sellerarea['sort_order'];?></td>
									<td class="text-right"><?php echo $sellerarea['status'];?></td>
									<td class="text-right"><a href="<?php echo $sellerarea['edit'];?>" data-toggle="tooltip" title="<?php echo $button_edit;?>" class="btn btn-primary"><i class="fa fa-pencil fas fa-edit"></i></a></td>
								</tr>
								<?php  }  ?>
								<?php } else { ?>
								<tr>
									<td class="text-center" colspan="100%"><?php echo $text_no_results;?></td>
								</tr>
								<?php  }  ?>
							</tbody>
						</table>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<?php echo $footer;?>