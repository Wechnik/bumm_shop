<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
				<button type="submit" form="form-review" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-author"><?php echo $text_customer_name; ?></label>
						<div class="col-sm-10">
							<input type="text" disabled name="customer_name" value="<?php echo $customer_name; ?>" placeholder="<?php echo $text_customer_name; ?>" id="input-customer_name" class="form-control" />
						</div>
					</div>	
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-author"><?php echo $text_seller_name; ?></label>
						<div class="col-sm-10">
							<input type="text" disabled name="seller_name" value="<?php echo $seller_name; ?>" placeholder="<?php echo $text_seller_name; ?>" id="input-seller_name" class="form-control" />
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-author"><?php echo $text_title; ?></label>
						<div class="col-sm-10">
							<input type="text" name="review_title" value="<?php echo $review_title; ?>" placeholder="<?php echo $text_title; ?>" id="input-review_title" class="form-control" />
							<?php if ($error_title) { ?>
								<div class="text-danger"><?php echo $error_title; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-text"><?php echo $text_description; ?></label>
						<div class="col-sm-10">
							<textarea name="review_description" cols="60" rows="8" placeholder="<?php echo $text_description; ?>" id="input-text" class="form-control"><?php echo $review_description; ?></textarea>
							<?php if ($error_description) { ?>
								<div class="text-danger"><?php echo $error_description; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-name"><?php echo $text_rating; ?></label>
						<div class="col-sm-10">
							<label class="radio-inline">
								<?php if ($rating == 1) { ?>
									<input type="radio" name="rating" value="1" checked="checked" />
									1
									<?php } else { ?>
									<input type="radio" name="rating" value="1" />
									1
								<?php } ?>
							</label>
							<label class="radio-inline">
								<?php if ($rating == 2) { ?>
									<input type="radio" name="rating" value="2" checked="checked" />
									2
									<?php } else { ?>
									<input type="radio" name="rating" value="2" />
									2
								<?php } ?>
							</label>
							<label class="radio-inline">
								<?php if ($rating == 3) { ?>
									<input type="radio" name="rating" value="3" checked="checked" />
									3
									<?php } else { ?>
									<input type="radio" name="rating" value="3" />
									3
								<?php } ?>
							</label>
							<label class="radio-inline">
								<?php if ($rating == 4) { ?>
									<input type="radio" name="rating" value="4" checked="checked" />
									4
									<?php } else { ?>
									<input type="radio" name="rating" value="4" />
									4
								<?php } ?>
							</label>
							<label class="radio-inline">
								<?php if ($rating == 5) { ?>
									<input type="radio" name="rating" value="5" checked="checked" />
									5
									<?php } else { ?>
									<input type="radio" name="rating" value="5" />
									5
								<?php } ?>
							</label>
							<?php if ($error_rating) { ?>
								<div class="text-danger"><?php echo $error_rating; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="input-status"><?php echo $text_status; ?></label>
						<div class="col-sm-10">
							<select name="status" id="input-status" class="form-control">
								<?php if ($status) { ?>
									<option value="1" selected="selected"><?php echo $text_approved; ?></option>
									<option value="0"><?php echo $text_notapproved; ?></option>
									<?php } else { ?>
									<option value="1"><?php echo $text_approved; ?></option>
									<option value="0" selected="selected"><?php echo $text_notapproved; ?></option>
								<?php } ?>
							</select>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript"><!--
		$('.datetime').datetimepicker({
			pickDate: true,
			pickTime: true
		});
	//--></script>
</script></div>
<?php echo $footer; ?>