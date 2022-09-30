<?php echo $header; ?>
<div id="content">
  <div class="container-fluid">
  <br>
    <br>
    <div class="row">
				<div class="<?php //echo $setdivclass; ?> col-sm-offset-4 col-sm-4">
				  <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
    <?php  endif; ?>
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
			
					<div class="pts-well seller-login-form">
						<h2 class="text-center"><?php echo $text_seller_login; ?></h2>				
						<form action="<?php echo $action; ?>" method="post" id="regForm" enctype="multipart/form-data">
							<div class="pts-form-group">
								<label class="pts-control-label col-form-label" for="seller-email"><?php echo $entry_email; ?></label>
								<input type="text" name="email" value="<?php echo $email; ?>" placeholder="<?php echo $entry_email; ?>" id="seller-email" class="pts-form-control" />
							</div>
							<div class="pts-form-group ">
								<label class="pts-control-label col-form-label" for="seller-password"><?php echo $entry_password; ?></label>
								<input type="password" name="password" value="<?php echo $password; ?>" placeholder="<?php echo $entry_password; ?>" id="seller-password" class="pts-form-control" />
							</div>
							<a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a>
							<div class="pts-row">
								<div class="pts-col-sm-5 pts-pull-left-1 pts-mt-3">
									<input type="submit" value="<?php echo $button_login; ?>"ZZ class="pts-btn pts-btn-primary" />
								</div>
								<div class="pts-pr-3 text-center pts-pull-right-1 pts-mt-3">
									<p class="new-seller-register-here"><span class="pts-login-seller"><i class="fa fa-user"></i> <?php echo $text_new_seller; ?></span><a href="<?php echo $sellerregister; ?>" class="ptsc-sregister-sellog"> <?php echo $text_register_new; ?></a></p>
									</div>
								</div>
								<?php if ($redirect) { ?>
									<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
								<?php } ?>
							</form>
						</div>
					
			</div>
		</div>
	</div>
<style>
#button-menu {
	display:none;
}
</style>
<link href="catalog/view/javascript/purpletree/css/stylesheet/commonstylesheet.css" type="text/css" rel="stylesheet" />
<?php echo $footer; ?>      
