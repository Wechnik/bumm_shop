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
			<form action="" method="post" enctype="multipart/form-data" class="pts-form-horizontal">
				<fieldset>
					<div class="pts-form-group required">
						<label class="pts-col-sm-2 pts-control-label" for="input-storeaddress"><?php echo $entry_message; ?></label>
						<div class="pts-col-sm-10">
							<textarea name="message" class="pts-form-control" rows="5"></textarea>
							<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>">
							<?php if ($error_msg) { ?>
								<div class="text-danger"><?php echo $error_msg; ?></div>
							<?php } ?>
						</div>
					</div>
				</fieldset>
				<div class="buttons clearfix">
					<div class="pts-pull-right">
						<input type="submit" value="<?php echo $button_continue; ?>" class="pts-btn pts-btn-primary" />
					</div>
				</div>
			</form>
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<thead>
						<tr>
							<td class="text-left"><?php echo $entry_messages; ?></td>
						</tr>
					</thead>
					<tbody>
						<?php if(isset($messages)) { ?>
							<?php foreach($messages as $key=>$result){ ?>
								<tr class="pts-tr-hover-none">
									<?php if($result['contact_from']==0){ ?>
										<td class="pts-text-right pts-chat-seller" ><?php echo $result['message']; ?><br><?php echo $result['created_at']; ?></td>
										<?php } else { ?>
										<td class="pts-text-right pts-chat-admin" ><?php echo $result['message']; ?><br><?php echo $result['created_at']; ?></td>
									<?php } ?>
								</tr>
							<?php } ?>
						<?php } ?>
					</tbody>
				</table>
			</div>
			<div class="pts-row">
				<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
				<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>