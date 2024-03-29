<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
	<div class="page-header">
		<div class="container-fluid">
			<div class="pull-right"><a href="<?php echo $add; ?>" data-toggle="tooltip" title="<?php echo $button_add; ?>" class="btn btn-primary"><i class="fa fa-plus"></i></a>
				<button type="submit" form="form-blog-post" formaction="<?php echo $copy; ?>" data-toggle="tooltip" title="<?php echo $button_copy; ?>" class="btn btn-default"><i class="fa fa-copy"></i></button>
				<button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-blog-post').submit() : false;"><i class="fa fa-trash-o"></i></button>
				<?php if ($helpcheck) { ?>
					<a href="<?php echo $helplink; ?>" target="_blank" id="button-pts-help" class="btn"><img src="<?php echo $helpimage; ?>" alt="Help" width="85" height="43"></a>
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
		<?php if ($error_warning) { ?>
			<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<?php if ($success) { ?>
			<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
				<button type="button" class="close" data-dismiss="alert">&times;</button>
			</div>
		<?php } ?>
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
			</div>
			<div class="panel-body">
				<form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-blog-post">
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<td style="width: 1px;" class="text-center ptsc-vendorlis-width"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
									<td class="text-left"><?php if ($sort == 'pd.title') { ?>
										<a href="<?php echo $sort_title; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_title; ?>"><?php echo $column_name; ?></a>
									<?php } ?></td>
									<td class="text-left">                   
										<?php echo $column_seller_store; ?>
									</td>
									<td class="text-left"><?php if ($sort == 'p.sort_order') { ?>
										<a href="<?php echo $sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_order; ?>"><?php echo $column_sort_order; ?></a>
									<?php } ?></td>
									<td class="text-left"><?php if ($sort == 'bp.status') { ?>
										<a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
										<?php } else { ?>
										<a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
									<?php } ?></td>
									<td class="text-right"><?php echo $column_action; ?></td>
								</tr>
							</thead>
							<tbody>
								<!-- blog -->
								<?php if (!empty($blogposts)) { ?>
									<?php foreach ($blogposts as $blogpost) { ?>
										<tr>
											<td class="text-center"><?php if (in_array($blogpost['blog_post_id'], $selected)) { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $blogpost['blog_post_id']; ?>" checked="checked" />
												<?php } else { ?>
												<input type="checkbox" name="selected[]" value="<?php echo $blogpost['blog_post_id']; ?>" />
											<?php } ?></td>
											<td class="text-left"><?php echo $blogpost['title']; ?></td>
											<td class="text-left"><?php echo $blogpost['seller_store']; ?></td>
											<td class="text-left"><?php echo $blogpost['sort_order']; ?></td>
											<td class="text-left"><?php echo $blogpost['status']; ?></td>
											<td class="text-right"><a href="<?php echo $blogpost['edit']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a></td>
										</tr>
									<?php } ?>
									<?php } else { ?>
									<tr>
										<td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
									</tr>
								<?php } ?>
							</tbody>
						</table>
					</div>
				</form>
				<div class="row">
					<div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
					<div class="col-sm-6 text-right"><?php echo $results; ?></div>
				</div>
			</div>
		</div>
	</div>
</div>
<?php echo $footer; ?>