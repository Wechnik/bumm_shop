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
			  <div class="pts-pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="pts-btn pts-btn-primary"><i class="fa fa-plus"></i></a>
				<button type="submit" form="form-blog-post" formaction="<?php echo $copy; ?>" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="pts-btn pts-btn-default"><i class="fa fa-copy"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="pts-btn pts-btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-blog-post').submit() : false;"><i class="fa fa-trash-o"></i></button>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
				<?php }?>
			</div>
    </div>
  </div>
			<div class="">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title"><i class="fa fa-list"></i><?php echo $text_list; ?></h3>
					</div>
					<div class="panel-body">
						<div class="pts-table-responsive">
							<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-blog-post">
								<table class="pts-table pts-table-bordered pts-table-hover">
									<thead>
										<tr>
											<td class="text-center ptsc-attr-tab-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
											<td class="pts-text-left"><?php if ($sort == 'pd.title') { ?>
												<a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
												<?php } else { ?>
												<a href="<?php echo $sort_title; ?>"><?php echo $column_name; ?></a>
											<?php } ?></td>
											<td class="pts-text-left"><?php if ($sort == 'p.sort_order') { ?>
												<a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
												<?php } else { ?>
												<a href="<?php echo $sort_order; ?>"><?php echo $column_sort_order; ?></a>
											<?php } ?></td>
											<td class="pts-text-left"><?php if ($sort == 'bp.status') { ?>
												<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
												<?php } else { ?>
												<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
											<?php } ?></td>
											<td class="pts-text-right"><?php echo $column_action; ?></td>
										</tr>
									</thead>
									<tbody>
										<?php if ($blogposts) { ?>
											<?php foreach ($blogposts as $blogpost) { ?>
												<tr>
													<td class="pts-text-center"><?php if (in_array($blogpost['blog_post_id'], $selected)) { ?>
														<input type="checkbox" name="selected[]" value="<?php echo $blogpost['blog_post_id']; ?>" checked="checked" />
														<?php } else { ?>
														<input type="checkbox" name="selected[]" value="<?php echo $blogpost['blog_post_id']; ?>" />
													<?php } ?></td>
													<td class="pts-text-left"><?php echo $blogpost['title']; ?></td>
													<td class="pts-text-left"><?php echo $blogpost['sort_order']; ?></td>
													<td class="pts-text-left"><?php echo $blogpost['status']; ?></td>
													<td class="pts-text-right"><a href="<?php echo $blogpost['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
												</tr>
											<?php } ?>
											<?php } else { ?>
											<tr>
												<td class="pts-text-center" colspan="8"><?php echo $text_no_results; ?></td>
											</tr>
										<?php } ?>
									</tbody>
								</table>
							</div>
						</form>
						<div class="row">
							<div class="pts-col-sm-6 pts-text-left"><?php echo $pagination; ?></div>
							<div class="pts-col-sm-6 pts-text-right"><?php echo $results; ?></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>