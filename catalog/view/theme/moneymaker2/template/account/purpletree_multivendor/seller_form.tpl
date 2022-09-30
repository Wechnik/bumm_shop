<?php echo $header; ?>

<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
    <div class="container-fluid">
     <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
    </div>
  </div>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="pts-form-horizontal">
				<fieldset>
					<legend>
						<?php if ( isset($isSeller['store_status']) && $isSeller['store_status'] == '0') { ?>
							<?php echo $text_approval; ?>
							<?php  } else { ?>
							<?php if($is_removed) { ?>
								<?php echo $text_remove_msg; ?>
								<?php } else { ?>
								<?php echo $text_seller_heading; ?>
							<?php } } ?>
					</legend>
					<?php if ( isset($isSeller['store_status']) && $isSeller['store_status'] == '0') { ?>
						<?php echo $text_approval; ?>
						<?php } else { ?>
						<div class="pts-form-group">
							<label class="pts-col-sm-2 pts-control-label"><?php echo $text_seller; ?></label>
							<div class="pts-col-sm-10">
								<label class="radio-inline">
									<input type="radio" name="become_seller" value="1" <?php if($become_seller){ echo "checked=checked"; } ?>  />
								<?php echo $text_yes; ?></label>
								<label class="radio-inline">
									<input type="radio" name="become_seller" value="0" <?php if(!$become_seller){ echo "checked=checked"; } ?>/>
								<?php echo $text_no; ?></label>
							</div>
						</div>
						<?php if(!$is_removed) { ?>
							<div class="pts-form-group required">
								<label class="pts-col-sm-2 pts-control-label"><?php echo $text_store_name; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="seller_storename" value="<?php echo $store_name; ?>" class="pts-form-control"  />
									<?php if ($error_sellerstore) { ?>
										<div class="text-danger"><?php echo $error_sellerstore; ?></div>
									<?php } ?>
								</div>
							</div>
						<?php } } ?>
				</fieldset>
				<?php if ( isset($isSeller['store_status']) && $isSeller['store_status'] == '0') { } else { ?>
					<div class="buttons clearfix">
						<div class="pts-pull-right">
							<input type="submit" value="<?php echo $button_continue; ?>" class="pts-btn pts-btn-primary" />
						</div>
					</div>
				<?php } ?>
			</form>
		</div>
	</div>
</div>
<?php echo $footer; ?>