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
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_heading; ?></h3>
			</div>
			<div class="panel-body">
				<form id = "form-seller-delete" action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="well">
						<div class="row">
							<ul class="pts-delete-seller-detail">
								<li><?php echo "Subscription plans of seller"; ?></li>
								<li><?php echo "Products of seller"; ?></li>
								<li><?php echo "Orders of seller"; ?></li>
								<li><?php echo "Commissions & Invoices of seller"; ?></li>
								<li><?php echo "Blogs of seller"; ?></li>
								<li><?php echo "Downloads of seller"; ?></li>
								<li><?php echo "Seller reviews"; ?></li>
								<li><?php echo "Customer enquiries of seller"; ?></li>
								<li><?php echo "Shipping rates"; ?></li>
							</ul>
						</div>
						<label for="check-1" class="ptsc-delete-seller-marlef">
						<input type="checkbox" id="chek-1 "name="delete_product" value="1"> Delete Products</label> 
					</div>
					<button type="submit" id="confirm-seller-delete" data-toggle="tooltip"  title="<?php echo "Delete Confirm"; ?>" class="btn btn-danger" onclick="confirm('<?php echo "Do you want to delete all the information of seller?"; ?>') ? $('#form-seller-delete').submit() : false;">Delete Confirm</button>
				</form>
			</div>       
		</div>
	</div>
</div>
<?php echo $footer; ?> 