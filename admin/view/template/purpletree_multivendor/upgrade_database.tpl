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
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_upgrade_database; ?></h3>
			</div>
			
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="form-customer">
					<div class="well">
						<div class="row">
							
							<label class="control-label  ptsc-upgrdatabas-textpadd" for="input-name" ><?php echo $text_upgrade_info; ?></label>
							<div class="col-sm-12 text-left">
								<div class="form-group">
									<a href="<?php echo $url; ?>" data-toggle="tooltip" title="<?php echo $button_Upgrade; ?>"><input type="button" value="<?php echo $button_Upgrade; ?>" class="btn btn-primary" class="button_add ptsc-upgrdatabas-padd " ></a>
									
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
