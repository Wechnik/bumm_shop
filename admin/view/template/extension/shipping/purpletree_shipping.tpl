<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-flat" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
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
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-flat" class="form-horizontal">
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
						<div class="col-sm-10">
							<select name="purpletree_shipping_status" id="input-status" class="form-control">
								<?php if ($purpletree_shipping_status) { ?>
									<option value="1" selected="selected"><?php echo $text_enabled; ?></option>
									<option value="0"><?php echo $text_disabled; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_enabled; ?></option>
									<option value="0" selected="selected"><?php echo $text_disabled; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
						<div class="col-sm-10">
							<input type="text" name="purpletree_shipping_sort_order" value="<?php echo $purpletree_shipping_sort_order; ?>" placeholder="<?php echo $entry_sort_order; ?>" id="input-sort-order" class="form-control" />
						</div>
					</div>
					<div class="well well11 ptsc-well11">
						<div class="panel-heading ptsc-categorycommi-border">
							<h4 class="panel-title"><?php echo $onlyforadminproducts; ?></h4>
						</div>
						<div class="">
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-newsletter"><?php echo $entry_storeshipping_type; ?></label>
								<div class="col-sm-4">
									<select name="purpletree_shipping_order_type" id="input-storeshipping-type" class="form-control">
										
										<option value="pts_product_wise" <?php if ($purpletree_shipping_order_type == 'pts_product_wise') { ?> selected="selected" <?php } ?>><?php echo $entry_product_wise; ?></option>
										<option value="pts_order_wise" <?php if ($purpletree_shipping_order_type == 'pts_order_wise') { ?> selected="selected" <?php } ?>><?php echo $entry_order_wise; ?></option>
										
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label" for="input-newsletter"><?php echo $entry_storeshipping_charge; ?></label>
								<div class="col-sm-4">
									<select name="purpletree_shipping_type" id="input-store-shipping-type" class="form-control">
										
										<option value="pts_flat_rate_shipping" onclick="show2();" <?php if ($purpletree_shipping_type == 'pts_flat_rate_shipping') { ?> selected="selected" <?php } ?>><?php echo $entry_store_flat_rate_shipping; ?></option>
										
										<option value="pts_matrix_shipping" <?php if ($purpletree_shipping_type == 'pts_matrix_shipping') { ?> selected="selected" <?php } ?>  onclick="show1();"><?php echo $entry_store_matrix_shipping; ?></option>
										
										<option <?php if ($purpletree_shipping_type == 'pts_flexible_shipping') { ?> selected="selected" <?php } ?> value="pts_flexible_shipping" onclick="show2();"><?php echo $entry_store_flexible_shipping; ?></option>
										
									</select>
								</div>
							</div>
							<div class="form-group" id="div1" class="hide">
								<label class="col-sm-2 control-label" for="input-storeshipping"><?php echo $entry_storeshipping; ?></label>
								<div class="col-sm-4">
									<input type="text" name="purpletree_shipping_charge" value="<?php echo $purpletree_shipping_charge; ?>" placeholder="<?php echo $entry_storeshipping; ?>" id="input-storeshipping" class="form-control" />
									<?php if ($error_storecharge) { ?>
										<div class="text-danger"><?php echo $error_storecharge; ?></div>
									<?php } ?>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	function show1(){
		document.getElementById('div1').style.display ='none';
	}
	function show2(){
		document.getElementById('div1').style.display = 'block';
	}
	$(window).load(function(){
		<?php if ($purpletree_shipping_type == 'pts_matrix_shipping') { ?>
			document.getElementById('div1').style.display ='none';
		<?php } ?>
	});
</script>  
<?php echo $footer; ?> 