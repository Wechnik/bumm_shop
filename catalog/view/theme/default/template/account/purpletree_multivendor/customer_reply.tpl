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
			  <?php }?>
    </div>
  </div>
			<div>
				<?php if($sellercontacts){ ?>
					<table class="pts-table pts-table-striped pts-table-bordered">
						<?php foreach($sellercontacts as $contact){ ?>
							<tr <?php if($contact['seen']) { ?> class="ptsc-cusreply-baccolor" <?php } ?>>
								<td><strong><?php echo $contact['customer_name']; ?> -</strong>
									</br><strong> <?php echo $contact['customer_email'];?></strong>
									- <?php echo $contact['customer_messages']; ?>
								<?php if(!empty($contact['attached_file'])) { ?>
								<br><strong><?php echo $text_files;?></strong>
								<?php foreach($contact['attached_file'] as $files){ ?>
								<br>&nbsp; &nbsp;<a href="<?php echo $files['images'];?>" target="_blank" ><?php echo $files['name'];?></a>
								<?php }} ?>
								</td>
								<td class="pts-text-right">
									<?php echo $contact['date_added']; ?>
								</td>
							</tr>
						<?php } ?>
					</table>
					<?php } else {?>
					<div class="pts-text-center"><?php echo $text_empty_result;  ?></div>
				<?php } ?>
			</div>
			<?php if($allow_seller_to_reply){ ?>
				<?php if($loggedin and $customer_id != '0'){ ?>
					<form action="" method="post" enctype="multipart/form-data" class="pts-col-sm-12 pts-form-horizontal">
						<input type="hidden" name="customer_id" value="<?php echo $customer_id;?>">
						<fieldset>
							<div class="pts-form-group required">
								<label class="pts-col-sm-2 pts-control-label" for="input-enquiry"> <?php echo $entry_enquiry; ?></label>
								<div class="pts-col-sm-10">
									<textarea name="customer_message" rows="10" id="input-enquiry" class="pts-form-control"><?php echo $customer_message; ?></textarea>
									<?php if($error_enquiry){ ?>
										<div class="text-danger"><?php echo $error_enquiry; ?></div>
									<?php } ?>
								</div>
							</div>
							<!-- add attach file -->
	<div class="pts-form-group">
	<label class="pts-col-sm-2 pts-control-label" for="input-enquiry"><?php echo $text_attach_file; ?></label>
	<div class="pts-col-sm-10">
		<div class="pts-table-responsive">
			<table id="attached-file" class="pts-table pts-table-striped pts-table-bordered pts-table-hover">
				<thead>
					<tr>
						<td class="pts-text-left"><?php echo $text_upload_file; ?></td>
						<td><?php echo $text_action; ?></td>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="1" width="80%"></td>
						<td class="pts-text-left" width="20%"><button type="button" onclick="attachedFile();" data-toggle="tooltip" title="<?php echo $text_attach_file; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i></button></td>
					</tr>
				</tfoot>
			</table>
		</div>
		</div>
	</div>
	<!-- add attach file -->
							<?php echo $captcha; ?>
						</fieldset>
						<div class="pts-buttons">
							<div class="pts-pull-right">
								<input class="pts-btn pts-btn-primary" type="submit" value="<?php echo $button_submit; ?>" />
							</div>
						</div>
					</form>
				<?php } ?>
			<?php } ?>
		</div>
	</div>
</div>
<?php echo $footer; ?>
<script>
var attach_file_row = 1;		
function attachedFile() {	
	html = '<tr id="attach_file_row' + attach_file_row + '">';
	html += '<td class="pts-text-left">';
	html += '<input type="file" name="attached_file[' + attach_file_row + ']" value="" placeholder="" id="attach_file_row' + attach_file_row + '"class="pts-form-control date" />';
	html += '</td>';
	html += '<td class="pts-text-left">';
	html += '<button type="button" onclick="$(\'#attach_file_row' + attach_file_row + '\').remove();" data-toggle="tooltip" title="{{ button_remove }}" class="pts-btn pts-btn-danger"><i class="fa fa-minus-circle"></i></button>';
	html += '</td>';
	html += '</tr>';
	$('#attached-file tbody').append(html);
	attach_file_row++;
}
</script>
