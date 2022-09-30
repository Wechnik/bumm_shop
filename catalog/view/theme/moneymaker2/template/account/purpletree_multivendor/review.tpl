<?php echo $header; ?>
<div class="pts-container container">
	<ul class="pts-breadcrumb breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<?php if ($success) { ?>
		<div class="alert pts-alert-success"> <?php echo $success; ?></div>
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
		<div id="content" class="<?php echo $class; ?>">
			<?php echo $content_top; ?>
			<?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
			<h1><?php echo $text_storereview; ?></h1>
			<?php if ($reviews) { ?>
				<?php foreach ($reviews as $review) { ?>
					<table class="pts-table pts-table-striped pts-table-bordered">
						<tr>
							<td class="ptsc-review-width"><strong><?php echo $review['customer_name']; ?></strong></td>
							<td class="pts-text-right"><?php echo $review['date_added']; ?></td>
						</tr>
						<tr>
							<td colspan="2"><strong><?php echo $review['review_title']; ?></strong>
								<p><?php echo $review['review_description']; ?></p>
								<div class="rating">
									<?php for ($i = 1; $i <= 5; $i++) { ?>
										<?php if ($review['rating'] < $i) { ?>
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
											<?php } else { ?>
											<span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
										<?php } ?>
									<?php } ?>
								</div>
							</td>
						</tr>
					</table>
				<?php } ?>
				<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
				<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
				<?php } else { ?>
				<div class="pts-text-center"><?php echo $text_empty_result; ?></div>
			<?php } ?>
			<?php if(!$result_check) { ?>
				<h3><?php echo $text_heading; ?></h3>
				<form class="pts-form-horizontal" id="form-review" action="<?php echo $action; ?>" method="post">
					<?php if ($customer_id) { ?>
						<?php if($warning){ ?>
							<div class="text-danger"><?php  echo $warning ?></div>
							<?php } else { ?>
							<div class="pts-form-group required">
								<div class="pts-col-sm-12">
									<label class="pts-control-label" for="input-name"><?php echo $text_title; ?></label>
									<input type="text" name="review_title" value="<?php echo $review_title;?>" id="input-name" class="pts-form-control" />
									<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" />
									<input type="hidden" name="customer_id" value="<?php echo $customer_id; ?>" />
									<?php if ($error_title) { ?>
										<div class="text-danger"><?php echo $error_title; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="pts-form-group required">
								<div class="pts-col-sm-12">
									<label class="pts-control-label" for="input-review"><?php echo $text_description; ?></label>
									<textarea name="review_description" rows="5" id="input-review" class="pts-form-control"><?php echo $review_description;?></textarea>
									<?php if ($error_description) { ?>
										<div class="text-danger"><?php echo $error_description; ?></div>
									<?php } ?>
									<div class="help-block"><?php echo $text_note; ?></div>
								</div>
							</div>
							<div class="pts-form-group required">
								<div class="pts-col-sm-12">
									<label class="pts-control-label"><?php echo $text_rating; ?></label>
									&nbsp;&nbsp;&nbsp; <?php echo $entry_bad; ?>&nbsp;
									<input id = "radio1" type="radio" name="rating" value="1" />
									&nbsp;
									<input id = "radio2" type="radio" name="rating" value="2" />
									&nbsp;
									<input id = "radio3" type="radio" name="rating" value="3" />
									&nbsp;
									<input id = "radio4" type="radio" name="rating" value="4" />
									&nbsp;
									<input id = "radio5" type="radio" name="rating" value="5" />
								&nbsp;<?php echo $entry_good; ?></div>
								<?php if ($error_rating) { ?>
									<div class="text-danger"><?php echo $error_rating; ?></div>
								<?php } ?>
							</div>
							<div class="buttons clearfix">
								<div class="pts-pull-right">
									<button type="submit" id="button-review" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-primary"><?php echo $button_continue; ?></button>
								</div>
							</div>
						<?php } } else { ?>
						<?php echo $text_login; ?>
					<?php } ?>
				</form>
			<?php } ?>
		<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<script>
	$(window).load(function() {
			$('aside#column-right').addClass('pts-col-sm-3 col-sm-3');
		});
</script>
<?php echo $footer; ?>