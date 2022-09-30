<?php echo $header; ?>  
<div class="pts-container container">
	<ul class="pts-breadcrumb breadcrumb">
		<?php foreach($breadcrumbs as $breadcrumb){ ?>
			<li><a href="<?php echo $breadcrumb['href'];?>"><?php echo $breadcrumb['text']; ?></a></li>
		<?php } ?>
	</ul>
	<?php if($success){ ?> 
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
	<?php } ?>
	<?php if($error_warning){ ?>
		<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?> </div>
	<?php  } ?>
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
			<div>
				<?php if($sellercontacts){?>
					<table class="pts-table pts-table-striped pts-table-bordered">
						<?php foreach($sellercontacts as $contact){ ?>
							<tr>
								<td><strong><?php echo $contact['customer_name']; ?></strong>
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
					<div class="pts-col-sm-6 pts-text-left"> <?php ///echo $pagination; ?></div>
					<div class="pts-col-sm-6 pts-text-right"><?php //echo $results; ?></div>
					<?php } else { ?>
					<?php if($contact_mode){ ?>
						<div class="pts-text-center"><?php echo $text_empty_result; ?></div>
					<?php } ?>
				<?php } ?>
			</div>
			<form action="" method="post" enctype="multipart/form-data" class="pts-col-sm-12 pts-form-horizontal">
				<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>">
				<fieldset>
					<?php if($loggedin == '0' and !$contact_mode){ ?>
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
									<div class="text-danger"> <?php echo $error_email; ?></div>
								<?php } ?>
							</div>
						</div>
						
					<?php } ?>
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
		<?php echo $content_bottom; ?></div>
	<?php echo $column_right; ?></div>
</div>
<script>
	$(window).load(function() {
			$('aside#column-right').addClass('pts-col-sm-3 col-sm-3');
		});
</script>
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

<?php echo $footer; ?>
