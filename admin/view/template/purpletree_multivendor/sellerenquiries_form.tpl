<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right">
			<a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a>
			<?php if ($helpcheck) { ?>
					<!-- <a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a> -->
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
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_form; ?></h3>
			</div>
			<div class="panel-body">
				<form action="" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
					<div class="form-group required">
						<label class="col-sm-2 control-label" for="input-text"><?php echo $text_message; ?></label>
						<div class="col-sm-10">
							<textarea name="message" cols="60" rows="8" placeholder="<?php echo $text_message; ?>" id="input-text" class="form-control"></textarea>
							<input type="hidden" name="seller_id" value="<?php echo $seller_id; ?>" >
							<input type="hidden" name="sendtoall" value="<?php echo $sendtoall; ?>" >
							<?php if ($error_text) { ?>
								<div class="text-danger"><?php echo $error_text; ?></div>
							<?php } ?>
						</div>
					</div>
					<div class="pull-right">
						<button type="submit" form="form-review" data-toggle="tooltip" title="<?php echo $button_send; ?>" class="btn btn-primary"><?php echo $text_send; ?></button>
					</div>
				</form>
			</div>
			<?php if(!$sendtoall){ ?>
				<div class="table-responsive">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								
								<td class="text-left"><?php echo $text_message; ?></td>
								
							</tr>
						</thead>
						<tbody>
							<?php foreach($seller_message as $key=>$value){ ?>
								<tr class="pts-tr-hover-none">
									<?php if($value['contact_from']==1){ ?>
										<td class="pts-text-right pts-chat-admin" ><?php echo $value['message']."<br>".$value['created_at']; ?></td>
										<?php } else { ?>
										<td class="pts-text-right pts-chat-seller" ><?php echo $value['message']."<br>".$value['created_at']; ?></td>
									<?php } ?>
								</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			<?php } ?>
		</div>
		<div class="row">
			<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
			<div class="col-sm-6 text-right"><?php echo $results; ?></div>
		</div>
	</div>
</div>
<?php echo $footer; ?>