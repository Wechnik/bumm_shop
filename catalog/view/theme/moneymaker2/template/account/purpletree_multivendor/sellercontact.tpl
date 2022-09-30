<?php echo $header; ?>
<div class="pts-container container">
	<ul class="pts-breadcrumb breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<?php if($success){ ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success;?></div>
	<?php  } ?>
	<?php if($error_warning){ ?>
		<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i>  <?php $error_warning; ?> </div>
	<?php } ?>
	<div class="pts-row">		 
		<?php echo $column_left; ?>
		<?php if ($column_left && $column_right) { ?>
			<?php $class = 'pts-col-sm-6 col-sm-6'; ?>
			<?php } elseif ($column_left || $column_right) { ?>
			<?php $class = 'pts-col-sm-9 col-sm-9'; ?>
			<?php } else { ?>
			<?php $class = 'pts-col-sm-12 col-sm-12'; ?>
		<?php } ?>
		<div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
			<h1><?php echo $heading_title; ?></h1>
			<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="pts-form-horizontal">
				<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>">
				<input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>">
				<input type="hidden" name="contact_from" value="0">
				<fieldset>
					<?php if($contact_Mode){ ?>
						<input type="hidden" name="customer_name" value="<?php echo $customer_name; ?>">
						<input type="hidden" name="customer_email" value="<?php echo $customer_email; ?>">
					<?php } ?>
					<?php if(!$contact_Mode){ ?>
						<div class="pts-form-group required">
							<label class="pts-col-sm-2 pts-control-label" for="input-name"><?php echo $entry_name; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="customer_name" value="<?php echo $customer_name; ?>" id="input-name" class="pts-form-control" />
								<?php if($error_name){ ?>
									<div class="text-danger"><?php echo $error_name; ?></div>
								<?php } ?>
							</div>
						</div>
						<div class="pts-form-group required">
							<label class="pts-col-sm-2 pts-control-label" for="input-email"><?php echo $entry_email; ?></label>
							<div class="pts-col-sm-10">
								<input type="text" name="customer_email" value="<?php echo $customer_email; ?>" id="input-email" class="pts-form-control" />
								<?php if($error_email){ ?>
									<div class="text-danger"><?php echo $error_email; ?></div>
								<?php } ?>
							</div>
						</div>
						
					<?php } ?>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="customer_message" rows="10" id="input-enquiry" class="pts-form-control"><?php echo $customer_message; ?></textarea>
							<?php if($error_enquiry){ ?>
								<div class="text-danger"><?php echo $error_enquiry; ?></div>
							<?php } ?>
						</div>
					</div>
					<?php echo $captcha; ?>
				</fieldset>
				<div class="pts-buttons">
					<div class="pts-pull-right">
						<input class="pts-btn pts-btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
					</div>
				</div>
			</form>
		<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<script>
	$(window).load(function() {
			$('aside#column-right').addClass('pts-col-sm-3 col-sm-3');
		});
</script>
<?php echo $footer; ?>
