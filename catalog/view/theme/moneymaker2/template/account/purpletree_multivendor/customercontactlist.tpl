<?php echo $header; ?>
<div class="pts-container container">
	<ul class="pts-breadcrumb breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
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
			<?php if($sellercontacts){ ?>
				<?php foreach($sellercontacts as $contact){?>
					<table class="pts-table pts-table-striped pts-table-bordered">
						<tr>
							<td class="ptsc-cuscontact-widthh"><strong><?php echo $contact['customer_name']; ?></strong><br>
								<strong>
									<?php if($contact['customer_id']==0){ echo $contact['customer_email']; } ?>
								</strong></td>
								<td class="pts-text-right"><a href='<?php echo $contact['reply']; ?>' > <?php echo $button_view_all; ?> </a> </td>
						</tr>
						<tr>
							
							<td class="ptsc-cuscontact-width">
								<p><?php echo $contact['message']; ?> </p>
							</td>
							<td colspan="2">
								<?php echo $contact['date_added'];?> 
							</td>
						</tr>
					</table>
				<?php } ?>
				<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
				<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
				<?php } else { ?>
				<div class="pts-text-center"><?php echo $text_empty_result;  ?></div>
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