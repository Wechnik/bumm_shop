<?php echo $header; ?>

<div class="pts-container container">
	<div class="pts-row d-flex row"><?php echo $column_left; ?>
		<div id="content" class="pts-col-sm-9 col-sm-9 pts-col-md-9 col-md-9 pts-col-lg-10 col-lg-10 pts-col-xs-12 col-xs-12"> 
			<div class="page-header">
			<div class="errordiv">
			 <?php  if (isset($error_warning) && $error_warning != ''): ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
		<button type="button" class="close" data-dismiss="alert">&times;</button>
	</div>
	</div>
    <?php  endif; ?>
    <div class="successdiv">
	<?php  if (isset($success) && $success != '') { ?>
		<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i><?php echo $success; ?></div>
	<?php } ?>
		</div>
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
			<div class="pts-row">
				<div class="pts-col-md-6">
					<div class="pts-panel pts-panel-default">
						<div class="pts-panel-heading">
							<h3 class="pts-panel-title"><i class="fa fa-shopping-cart"></i>  <?php echo $text_order; ?></h3>
						</div>
						<table class="pts-table">
							<tbody>
								<tr>              
									<th class="col-sm-4"><?php echo $entry_order_id; ?></th>
									<td>#<?php echo $order_id; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4" ><?php echo $entry_date_ordered; ?></th>
									<td><?php echo $date_ordered; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4"><?php echo $entry_customer; ?> </th>
									<td><?php echo $customer; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4"><?php echo $entry_email; ?></th>
									<td><?php echo $email; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4"><?php echo $entry_telephone; ?></th>
									<td><?php echo $telephone; ?></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="pts-col-md-6">
					<div class="pts-panel pts-panel-default">
						<div class="pts-panel-heading">
							<h3 class="pts-panel-title"><i class="fa fa-cubes"></i> <?php echo $text_product; ?></h3>
						</div>
						<table class="pts-table">
							<tbody>
								<tr>              
									<th class="col-sm-4"><?php echo $entry_product; ?></th>
									<td><?php echo $product; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4" ><?php echo $entry_model; ?></th>
									<td><?php echo $model; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4"><?php echo $entry_quantity; ?></th>
									<td><?php echo $quantity; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4"><?php echo $entry_return_reason; ?></th>
									<td><?php echo $return_statuses_name; ?></td>
								</tr>
								<tr>
									<th class="col-sm-4"><?php echo $entry_opened; ?></th>
									<?php if ($opened) { ?>
										<td><?php echo $text_opened; ?></td>                 
										<?php } else { ?>
										<td><?php echo $text_unopened; ?></td>                    
									<?php } ?>
								</tr>
								<tr>
									<th class="col-sm-4"><?php echo $entry_comment; ?></th>
									<td><?php echo $comment; ?></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="pts-panel pts-panel-default">
				<div class="pts-panel-body">
					<div class="pts-tab-content">   	  
						<?php if ($return_id) { ?>
							<div class="pts-tab-pane active " id="tab-history">
								<fieldset>
									<legend><i class="fa fa-comment-o"></i> <?php echo $text_history; ?></legend>
									<div id="history"></div>
								</fieldset>
								<br />
								<fieldset>
									<legend><i class="fa fa-pencil"></i> <?php echo $text_history_add; ?></legend>
									<form class="pts-form-horizontal">
										<div class="pts-form-group">
											<label class="pts-col-sm-2 pts-control-label" for="input-return-status"><?php echo $entry_return_status; ?></label>
											<div class="pts-col-sm-10">
												<select name="return_status_id" id="input-return-status" class="pts-form-control">
													<?php foreach($return_statuses as $return_status) { ?>
														<?php if ($return_status['return_status_id'] == $return_status_id) { ?>
															<option value="<?php echo $return_status['return_status_id']; ?>" selected="selected"><?php echo $return_status['name']; ?></option>
															<?php } else { ?>
															<option value="<?php echo $return_status['return_status_id']; ?>"><?php echo $return_status['name']; ?></option>
														<?php } ?>
													<?php } ?>
												</select>
											</div>
										</div>
										<div class="pts-form-group">
											<label class="pts-col-sm-2 pts-control-label" for="input-notify"><?php echo $entry_notify; ?></label>
											<div class="col-sm-10">
												<input type="checkbox" name="notify" value="1" id="input-notify" />
											</div>
										</div>
										<div class="pts-form-group">
											<label class="pts-col-sm-2 pts-control-label" for="input-history-comment"><?php echo $entry_comment; ?></label>
											<div class="col-sm-10">
												<textarea name="comment" rows="8" id="input-history-comment" class="pts-form-control"></textarea>
											</div>
										</div>
										<div class="pts-text-right">
											<button id="button-history" data-loading-text="<?php echo $text_loading; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus-circle"></i> <?php echo $text_history_add; ?></button>
										</div>
									</form>
								</fieldset>
							</div>
						<?php } ?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 
<script type="text/javascript"><!--
	$('#history').delegate('.pagination a', 'click', function(e) {
		e.preventDefault();
		
		$('#history').load(this.href);
	});			
	
	$('#history').load('index.php?route=account/purpletree_multivendor/product_returns/history&return_id=<?php echo $return_id; ?>');
	
	$('#button-history').on('click', function(e) {
		e.preventDefault();
		
		$.ajax({
			url: 'index.php?route=account/purpletree_multivendor/product_returns/addhistory&return_id=<?php echo $return_id; ?>',
			type: 'post',
			dataType: 'json',
			data: 'return_status_id=' + encodeURIComponent($('#tab-history select[name=\'return_status_id\']').val()) + '&notify=' + ($('input[name=\'notify\']').prop('checked') ? 1 : 0) + '&comment=' + encodeURIComponent($('#tab-history textarea[name=\'comment\']').val()),
			beforeSend: function() {
				$('#button-history').button('loading');	
			},
			complete: function() {
				$('#button-history').button('reset');	
			},
			success: function(json) {
				$('.alert-dismissible').remove();
				
				if (json['error']) {
					$('#tab-history').prepend('<div class="alert alert-danger alert-dismissible"><i class="fa fa-exclamation-circle"></i> ' + json['error'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}
				
				if (json['success']) {
					$('#history').load('index.php?route=account/purpletree_multivendor/product_returns/history&return_id=<?php echo $return_id; ?>');
					
					$('#tab-history').prepend('<div class="alert alert-success alert-dismissible"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
					
					$('#tab-history textarea[name=\'comment\']').val('');
				}
			}
		});
	});
//--></script> 

<?php echo $footer; ?>