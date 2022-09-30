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
		<?php if($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if($success){ ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_edit_commission; ?></h3>
			</div>
			
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="well">
						<div class="row">
							
							<div class="col-sm-4">
								<div class="form-group">
									<input type="hidden" name="filter_id" value="<?php echo $commission_id; ?>" class="form-control" />
									<label class="control-label" for="input-name"><?php echo $entry_categories; ?></label>
									<input type="text" name="filter_name" value="<?php echo $category_name; ?>" placeholder="<?php echo $entry_categories; ?>" id="input-name" class="form-control" readonly />
								</div>
							</div>  
							
							<div class="col-sm-4">
								<div class="form-group">
									<label class="control-label" for="input-commission"><?php echo $entry_commission; ?></label>
									<input type="text" name="filter_commission" value="<?php echo $category_commission; ?>"  placeholder="<?php echo $entry_commission; ?>"  class="form-control" />
								</div>
							</div>
							<div class="col-sm-4">
								<div class="form-group">
									<label class="control-label" for="input-commission"><?php echo $entry_commission_fixed ?></label>
									<input type="text" name="filter_commission_fixed" value="<?php echo$filter_commission_fixed ?>"  placeholder="<?php echo $entry_commission_fixed ?>"  class="form-control" />
								</div>
							</div>
							<?php if ($show_seller_group == 1) { ?>
								<div class="col-sm-4">
									<div class="form-group">
										<label class="control-label" for="input-commission"><?php echo $entry_seller_group; ?> </label>
										<select name="filter_seller_group" class="form-control">
											
											<?php foreach ($seller_groups as $seller_group) { ?>
												<option <?php if ($selected_seller_group == $seller_group['customer_group_id']) { ?> selected="selected" <?php } ?> value="<?php echo $seller_group['customer_group_id']; ?>"><?php echo $seller_group['name'];?> </option>
											<?php } ?>
										</select>
									</div>
								</div>
							<?php } ?>
							<div class="col-sm-4">
								<div class="form-group">
									<input type="submit" value="Save" class="btn btn-primary" class="button_edit ptsc-categorycommi-paddmar" data-toggle="tooltip" title="<?php echo $button_edit; ?>" >				  
									
								</div>
							</div>
							
						</div>
					</div>
				</form>
			</div>       
		</div>
	</div>
</div>

<?php echo $footer; ?> 
