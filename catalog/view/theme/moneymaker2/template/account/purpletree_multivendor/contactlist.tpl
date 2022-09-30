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
			  <?php if ($helpcheck) { ?>
			  <div class="pull-right float-right">
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			   </div>
			<?php } ?>
    </div>
  </div>
			<?php if($sellercontacts){ ?>
				<?php foreach($sellercontacts as $contact){?>
					<table class="pts-table pts-table-striped pts-table-bordered">
						<tr>
							<td class="ptsc-contact-width"><strong><?php echo $contact['customer_name']; ?></strong><br>
							<strong><?php if($contact['customer_id']==0){ echo $contact['customer_email']; } ?></strong></td>
							<td class="pts-text-right"><a href='<?php echo $contact['reply'] ?>'><?php echo $button_view_all; ?></a></td>
						</tr>
						<tr <?php if ($contact['seen']) { ?> class="pts-new_inquiry" <?php } ?>>
							<td class="ptsc-contact-width">
								<p><?php echo $contact['message']; ?></p>
							</td>
							<td colspan="2">
								<?php echo $contact['date_added']; ?>
							</td>
						</tr>
					</table>
				<?php } ?>
				<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination;?></div>
				<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
				<?php }else{ ?>
				<div class="pts-text-center"><?php echo $text_empty_result; ?></div>
			<?php } ?>
		</div>
	</div>
</div>
<?php echo $footer; ?>