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
	<?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
     <h1><?php echo $text_storereview; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
    </div>
  </div>
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
											<span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
											<?php } else { ?>
											<span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
										<?php } ?>
									<?php } ?>
								</div>
								<div class="pts-text-right"><?php echo $review['status'];?></div>
							</td>
						</tr>
					</table>
				<?php } ?>
				<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
				<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
				<?php } else { ?>
				<div class="pts-text-center"><?php echo $text_empty_result; ?></div>
			<?php } ?>
		</div>
	</div>
</div>
<?php echo $footer; ?>