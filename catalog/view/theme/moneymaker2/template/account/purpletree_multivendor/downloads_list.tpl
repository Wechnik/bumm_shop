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
     <h1><?php echo $heading_titlee; ?></h1>
      <ul class="breadcrumb">
	  <?php  foreach($breadcrumbs as $breadcrumb): ?>
                <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
				<?php  endforeach; ?>
              </ul>
			  <div class="pts-pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus"></i></a>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="pts-btn pts-btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-download').submit() : false;"><i class="fa fa-trash-o"></i></button>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>				
			<?php } ?>
			</div>
    </div>
  </div>
			<div class="">
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-download">
					<div class="pts-table-responsive">
						<table class="pts-table pts-table-bordered pts-table-hover">
							<thead>
								<tr>
									<td class="pts-text-center ptsc-attr-tab-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="pts-text-left">
										<?php if ($sort == 'dd.name') { ?>
											<a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
											<?php } else { ?>
											<a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
										<?php } ?></td>
										<td class="pts-text-right">  <?php if ($sort == 'dd.date_added') { ?>
											<a href="<?php echo $sort_date_added; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_date_added; ?></a>
											<?php } else { ?>
											<a href="<?php echo $sort_date_added; ?>"><?php echo $column_date_added; ?></a>
										<?php } ?></td>
										<td class="pts-text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<?php if (!empty($downloads)) { ?>
									<?php foreach ($downloads as $download) { ?>
										<tr>
											<td class="pts-text-center"><?php if (in_array($download['download_id'],$selected)) {?>
												<input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $download['download_id']; ?>" />
											<?php } ?></td>
											<td class="pts-text-left"><?php echo $download['name']; ?></td>
											<td class="pts-text-right"><?php echo $download['date_added']; ?></td>
											<td class="pts-text-right"><a href="<?php echo $download['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-pencil"></i></a></td>
										</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="pts-text-center" colspan="6"><?php echo $text_no_results; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</form>
				<div class="pts-row">
					<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
					<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>