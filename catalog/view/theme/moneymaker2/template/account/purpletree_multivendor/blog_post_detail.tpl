<?php echo $header; ?>
<div class="pts-blog-main">
	<div class="pts-container container">
		<ul class="breadcrumb pts-breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
				<li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
			<?php } ?>
		</ul>
		<?php if ($success) { ?>
			<div class="alert pts-alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
		<?php } ?>
		<div class="pts-row row">
			<div id="pcontent" class="pts-col-sm-9 col-sm-9 ptsblogcontent"><?php echo $content_top; ?>
				<h1 class="pts-static-heading"><?php echo $heading_title; ?></h1>
				<img src="<?php echo $image; ?>" class="img img-responsive" />
				<?php echo $description; ?>
				<?php echo $post_date; ?>
				<?php if($post_tags) { ?>
					<?php foreach($post_tags as $tag) { ?>
						<?php if($tag) { ?>
							<span class="pts-blog-tag"><?php echo $tag; ?></span>
						<?php } ?>
					<?php } ?>
				<?php } ?>
				<div>
					<span class="label-error"><h3><?php echo $text_comment_heading; ?>: <?php echo $comment_count; ?></h3></span>
					<hr />
				</div>
				<?php if($post_comments) { ?>
					<?php foreach($post_comments as $post_comment) { ?>
						<div class="pts-well pts-well-sm">
							<div><strong><?php echo $post_comment['name']; ?></strong></div>			
							<div><?php echo $post_comment['date']; ?></div>
							<div><?php echo $post_comment['text']; ?></div>
						</div>
					<?php } ?>
					<?php } else { ?>
					<?php echo $text_comment_empty; ?>
				<?php } ?>
				<div class="pts-col-sm-12">
					<span class="label-error"><h3><?php echo $text_comment_reply; ?></h3></span>
				</div>
				<div class="pts-col-sm-12">
					<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
						<fieldset>
							<div class="pts-form-group required">
								<label class="pts-col-sm-2 pts-control-label" for="input-name"><?php echo $entry_name; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="pts-form-control" />
									<?php if ($error_name) { ?>
										<div class="text-danger"><?php echo $error_name; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="pts-form-group required">
								<label class="pts-col-sm-2 pts-control-label" for="input-email"><?php echo $entry_email; ?></label>
								<div class="pts-col-sm-10">
									<input type="text" name="email_id" value="<?php echo $email_id; ?>" placeholder="<?php echo $entry_email; ?>" id="input-email" class="pts-form-control ptsc-blogdetail-martop" />
									<?php if ($error_email_id) { ?>
										<div class="text-danger"><?php echo $error_email_id; ?></div>
									<?php } ?>
								</div>
							</div>
							<div class="pts-form-group required">
								<label class="pts-col-sm-2 pts-control-label" for="input-text"><?php echo $entry_text; ?></label>
								<div class="pts-col-sm-10">
									<textarea name="text" placeholder="<?php echo $entry_text; ?>" id="input-text" class="pts-form-control ptsc-blogdetail-martop"><?php echo $text; ?></textarea>
									<?php if ($error_text) { ?>
										<div class="text-danger"><?php echo $error_text; ?></div>
									<?php } ?>
								</div>
							</div>
						</fieldset>
						<div class="buttons clearfix">
							<div class="pts-pull-right">
								<input type="submit" value="<?php echo $button_comment; ?>" class="pts-btn pts-btn-primary" />
							</div>
						</div>
					</form>
				</div>
			<?php echo $content_bottom; ?></div>
			<div class="pts-col-sm-3" id="content">
				<div class="">
					<?php if ($pts_blogs) { ?>
						<h1 class="pts-blog-right-heading"><?php echo $text_popupar_posts; ?></h1>
						<div class="pts-blog-popular-post">
							<div class="pts-blog-categorylist">
								<?php foreach ($pts_blogs as $popular_blog) { ?>
									
									<a href="<?php echo $popular_blog['href']; ?>">
										<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12 ptsc-temppro-timg">
											<div class="pts-col-md-12 pts-col-sm-12 pts-col-xs-12 pts-col-lg-12">
												<b><?php echo $popular_blog['date']; ?></b>
												<h5><?php echo $popular_blog['title']; ?></h5>
											</div>
											<div class="pts-col-md-12 pts-col-sm-12 pts-col-xs-12 pts-col-lg-12">
												<div class="ptsblogcontent"><img src="<?php echo $popular_blog['thumb']; ?>"></div>
											</div>
											
										</div>
									</a>
									
								<?php } ?>
							</div>
						</div>
					<?php } ?>
				</div>
				<!--   <div class="">
					<?php if ($pts_tags) { ?>
						<h3 class="pts-blog-right-heading"><?php echo $text_popupar_tags; ?></h3>
						<div class="pts-blog-tags">
						<?php foreach ($pts_tags as $popular_tag) { ?>
							<?php foreach ($popular_tag['tags'] as $tag) { ?>
								<?php if($tag) { ?>
									<a href="<?php echo $popular_tag['href']; ?>"><?php echo $tag; ?></a>
								<?php } ?>
							<?php } } ?>
							</div>
					<?php } ?>
				</div> -->
			</div></div>
	</div>
</div>
<script>
	jQuery(".pts-blog-category-plus").click(function(){
		$(this).next().css("display","block");
		$(this).css("display","none");
	});
	jQuery(".pts-blog-category-minus").click(function(){
		$(this).prev().css("display","block");
		$(this).css("display","none");
	});
</script>

<?php echo $footer; ?>