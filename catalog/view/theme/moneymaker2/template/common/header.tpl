<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
	<meta charset="UTF-8" />
	<meta name="yandex-verification" content="705a6db0fa9247f0" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title><?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?></title>
	<base href="<?php echo $base; ?>" />
	<?php if ($description) { ?>
		<meta name="description" content="<?php echo $description; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
	<?php } ?>
	<?php if ($keywords) { ?>
		<meta name="keywords" content= "<?php echo $keywords; ?>" />
	<?php } ?>
	<meta property="og:title" content="<?php echo $title; if (isset($_GET['page'])) { echo " - ". ((int) $_GET['page'])." ".$text_page;} ?>" />
	<meta property="og:type" content="website" />
	<meta property="og:url" content="<?php echo $og_url; ?>" />
	<?php if ($og_image) { ?>
		<meta property="og:image" content="<?php echo $og_image; ?>" />
	<?php } else { ?>
		<meta property="og:image" content="<?php echo $logo; ?>" />
	<?php } ?>
	<meta property="og:site_name" content="<?php echo $name; ?>" />
	<!-- mmr2 2.6.2 ocs2.3 -->
	<?php if ($moneymaker2_common_minify) { ?>
		<?php foreach ($moneymaker2_minify['ext_css'] as $value) { ?>
	<link href="<?php echo $value['href']; ?>" type="text/css" rel="<?php echo $value['rel']; ?>" media="<?php echo $value['media']; ?>" />
	<?php } ?>
	<link href="min/?g=moneymaker2_css<?php echo $moneymaker2_minify['int_css'] ? "&f=".implode(',', $moneymaker2_minify['int_css']) : ''; ?>" rel="stylesheet">
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	<?php foreach ($moneymaker2_minify['ext_js'] as $value) { ?>
		<script src="<?php echo $value; ?>"></script>
	<?php } ?>
		<script src="min/?g=moneymaker2_js<?php echo $moneymaker2_minify['int_js'] ? "&f=".implode(',', $moneymaker2_minify['int_js']) : ''; ?>"></script>
	<?php } else { ?>
		<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>
	<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
		<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js"></script>
		<script src="catalog/view/javascript/jquery/moneymaker2/velocity.min.js"></script>
	<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="catalog/view/theme/moneymaker2/stylesheet/fonts.css" rel="stylesheet">
		<script src="catalog/view/javascript/common.moneymaker2.js?v=262"></script>
	<?php foreach ($styles as $style) { ?>
	<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
	<?php } ?>
	<?php foreach ($links as $link) { ?>
	<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
	<?php } ?>
	<?php foreach ($scripts as $script) { ?>
		<script src="<?php echo $script; ?>"></script>
	<?php } ?>
	<?php } ?>
	<?php foreach ($analytics as $analytic) { ?>
		<?php echo $analytic; ?>
	<?php } ?>
	<style type="text/css">
		.image-additional {max-width: none;}
		.image-additional .mfp-iframe{position: relative;}
		.image-additional .mfp-iframe span {background-image: url(/catalog/view/theme/default/image/play.png);background-repeat: no-repeat;width: 100%;height: 100%;margin: -5px;position: absolute;z-index: 10;background-size: 50px;background-position: 50%;opacity: 0.8;-moz-transition: all ease 0.3s;-webkit-transition: all ease-in-out 0.3s;transition: all ease-in-out 0.3s;-o-transition: all ease 0.3s;-MS-transition: all ease 0.3s;}
		.image-additional .mfp-iframe:hover span {opacity: 0;-moz-transition: all ease 0.3s;-webkit-transition: all ease-in-out 0.3s;transition: all ease-in-out 0.3s;-o-transition: all ease 0.3s;-MS-transition: all ease 0.3s;}
	</style>
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700%7CRoboto+Condensed:400,700" media="all">
	<style type="text/css">
		body {
			font-family: 'Roboto Condensed', sans-serif;
		}
	</style>
</head>

<?php if($_SERVER['REMOTE_ADDR'] != '127.0.0.1') { ?>
	<script type="text/javascript">
		<?php echo $config_ga_analytics; ?>
	</script>
	<!— Yandex.Metrika counter —>
	<script type="text/javascript">
		<?php echo $config_ya_metric; ?>
	</script>
	<noscript>
		<div><img src="https://mc.yandex.ru/watch/35685800" style="position:absolute; left:-9999px;" alt="" /></div>
	</noscript>
	<!— /Yandex.Metrika counter —>
<?php } ?>

<body class="<?php echo $class; ?>">
<div class="modal-wrapper">
	<div class="modal-window">
		<div id="loader"></div>
	</div>
	<div class="overlay"></div>
</div>
<header>
	<nav id="top" class="navbar navbar-default navbar-full<?php if ($moneymaker2_header_strip_fixed) { ?> navbar-fixed-top<?php } ?>">
		<div class="container">
			<div class="navbar-header">
				<?php if (!$moneymaker2_header_strip_expanded) { ?>
					<a id="main-menu-toggle" href="javascript:void(0);" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-top-collapse, .navbar-menu-collapse"><i class="fa fa-fw fa-bars"></i></a>
					<a href="javascript:void(0);" class="modal-cart visible-xs">
						<i class="fa fa-fw fa-shopping-cart" ></i>
<!--						--><?php //if($count_cart_products != 0) { ?>
<!--							<small class="fa-stack">-->
<!--								<i class="fa fa-circle fa-stack-2x"></i>-->
<!--								<span class="fa-stack-1x">--><?php //echo $moneymaker2_header_cart_items; ?><!--</span>-->
<!--							</small>-->
<!--						--><?php //} ?>
					</a>
					<?php if ($moneymaker2_header_strip_toggle_search) { ?>
						<a href="javascript:void(0);" class="modal-search visible-xs"><i class="fa fa-fw fa-search" ></i></a>
					<?php } ?>
					<?php if($product_page) { ?>
						<a href="javascript:void(0);" class="smart_filter visible-xs"><i class="fa fa-fw fa-filter"></i></a>
					<?php } ?>
				
				<?php } ?>
				
				<div id="logo">
					<?php if ($moneymaker2_header_logo_custom) { ?>
						<?php if ($home == $moneymaker2_header_url) { ?>
							<span class="fa-stack fa-lg"><i class="fa fa-circle fa-inverse fa-stack-2x"></i><i class="fa fa-<?php echo $moneymaker2_header_logo_custom_icon; ?> fa-stack-1x"></i></span>
							<span class="text-primary"><?php echo $moneymaker2_header_logo_custom_header; ?></span>
							<small><?php echo $moneymaker2_header_logo_custom_caption; ?></small>
						<?php } else { ?>
							<a href="<?php echo $home; ?>">
								<span class="fa-stack fa-lg"><i class="fa fa-circle fa-inverse fa-stack-2x"></i><i class="fa fa-<?php echo $moneymaker2_header_logo_custom_icon; ?> fa-stack-1x"></i></span>
								<span class="text-primary"><?php echo $moneymaker2_header_logo_custom_header; ?></span>
								<small><?php echo $moneymaker2_header_logo_custom_caption; ?></small>
							</a>
						<?php } ?>
					<?php } else { ?>
						<?php if ($logo) { ?>
							<?php if ($home == $moneymaker2_header_url) { ?>
								<img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" />
							<?php } else { ?>
								<a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a>
							<?php } ?>
						<?php } else { ?>
							<h2><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h2>
						<?php } ?>
					<?php } ?>
				</div>
			</div>
			<div class="hidden-xs"></div>
			<div class="collapse navbar-collapse navbar-top-collapse">
				<ul class="nav navbar-nav">
					<?php if ($moneymaker2_header_menu_links_top_enabled&&$moneymaker2_header_links) { ?>
						<?php foreach ($moneymaker2_header_links as $value) { ?>
							<?php if (strpos($value['caption'], '::')) { ?>
								<?php $subvalue['title'] = substr($value['caption'], 0, strpos($value['caption'], '::')); ?>
								<?php $subvalue['caption'] = explode(', ', substr($value['caption'], strpos($value['caption'], '::')+3, strlen($value['caption']))); ?>
								<?php $subvalue['link'] = $value['multilink'] ? explode(', ', $value['multilink']) : explode(', ', $value['link']); ?>
								<?php if (count($subvalue['caption'])==count($subvalue['link'])) { ?>
									<li class="dropdown">
										<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $subvalue['title']; ?> <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu">
											<?php for ($i = 0; $i < count($subvalue['caption']); $i++) { ?>
												<li><a href="<?php echo $subvalue['link'][$i]; ?>"><?php echo $subvalue['caption'][$i]; ?></a></li>
											<?php } ?>
										</ul>
									</li>
								<?php } ?>
							<?php } else { ?>
								<li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['caption']; ?></a></li>
							<?php } ?>
						<?php } ?>
					<?php } ?>
				</ul>
				<?php if ($moneymaker2_header_search_moved) { ?>
					<div id="search" class="navbar-form navbar-left">
						<div class="form-group">
							<ul class="keep-open list-unstyled">
								<li>
									<div class="input-group collapse">
										<input type="text" name="search" value="" placeholder="<?php echo $text_search; ?>" class="form-control"><span class="input-group-btn"><button type="button" class="btn btn-primary" ><i class="fa fa-search"></i></button></span>
									</div>
								</li>
							</ul>
						</div>
					</div>
				<?php } ?>
				

				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown" id="top-links">
						<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-fw fa-bars"></i> <span class="<?php echo $moneymaker2_header_strip_menu_class; ?>"><?php echo $text_menu; ?> <i class="fa fa-angle-down"></i></span></a>
						<ul class="dropdown-menu keep-open">
							<?php if ($moneymaker2_header_menu_links_enabled&&$moneymaker2_header_links) { ?>
								<li class="dropdown-header"><?php echo $moneymaker2_header_menu_links_caption; ?></li>
								<?php foreach ($moneymaker2_header_links as $value) { ?>
									<li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['caption']; ?></a></li>
								<?php } ?>
								<li class="divider"></li>
							<?php } ?>
							<?php if ($moneymaker2_header_strip_language==1) { ?>
								<?php echo $language; ?>
							<?php } ?>
							<?php if ($moneymaker2_header_strip_currency==1) { ?>
								<?php echo $currency; ?>
							<?php } ?>
							<?php if (!$logged) { ?>
								<li class="dropdown-header"><?php echo $text_account; ?></li>
								<li class="col-md-4 col-sm-4 col-xs-4 text-center"><a href="<?php echo $login; ?>" rel="nofollow"><i class="fa fa-fw fa-sign-in"></i><br> <?php echo $text_login; ?> <br> <?php echo $text_register; ?></a></li>
							<?php } else { ?>
								<li class="dropdown-header"><?php echo $moneymaker2_text_customer_name; ?></li>
								<li class="col-md-4 col-sm-4 col-xs-4 text-center"><a href="<?php echo $account; ?>" rel="nofollow"><i class="fa fa-fw fa-user"></i><br> <?php echo $text_account; ?></a></li>
							<?php } ?>
							<?php if (!$moneymaker2_common_wishlist_hide) { ?>
								<li class="col-md-4 col-sm-4 col-xs-4 text-center"><a href="<?php echo $wishlist; ?>" rel="nofollow"><i class="fa fa-fw fa-heart"></i><br> <span id="wishlist-total"><span><?php echo $text_wishlist; ?></span></span></a></li>
							<?php } ?>

								<li class="col-md-4 col-sm-4 col-xs-4 text-center"><div class="prmn-cmngr"><?= $prmn_cmngr ?></div></li>

							<?php if (!$moneymaker2_common_compare_hide) { ?>
								<li><a href="<?php echo $compare; ?>" rel="nofollow"><i class="fa fa-fw fa-area-chart"></i> <span id="compare-total"><?php echo $text_compare; ?></span></a></li>
							<?php } ?>
							<?php if ($logged) { ?>
								<li class="divider"></li>
								<li class="col-md-4 col-sm-4 col-xs-4 text-center"><a href="<?php echo $logout; ?>" rel="nofollow"><i class="fa fa-fw fa-sign-out"></i> <?php echo $text_logout; ?></a></li>
							<?php } ?>
						</ul>
					</li>
					<?php if($product_page) { ?>
						<li class="smart_filter hidden-xs" id="smart_filter">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button">
								<i class="fa fa-fw fa-filter"></i>
							</a>
						</li>
					<?php } ?>
					
					<?php if ($moneymaker2_header_categories_panel&&$moneymaker2_header_strip_expanded&&!$moneymaker2_header_categories_panel_expanded) { ?>
						<li class="dropdown visible-xs">
							<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="collapse" data-target=".navbar-menu-collapse"><i class="fa fa-fw fa-th-large"></i> <?php echo $moneymaker2_header_categories_menu_caption ? $moneymaker2_header_categories_menu_caption : $text_category; ?> <i class="fa fa-angle-down"></i></a>
						</li>
					<?php } ?>
					<?php echo $search; ?>
					<?php echo $cart; ?>
				</ul>
			</div>
		</div>
	</nav>
	<?php if ($moneymaker2_header_categories_panel) { ?>
		<nav class="navbar navbar-default navbar-full categories-menu<?php if ($moneymaker2_header_categories_panel_fixed&&$moneymaker2_header_strip_fixed) { ?> navbar-fixed-top<?php } ?>" id="menu">
			<div class="container">
				<div class="collapse navbar-collapse navbar-menu-collapse">
					<ul class="nav navbar-nav">
						<?php if (!$moneymaker2_header_categories_panel_mod&&!$moneymaker2_header_categories_panel_hideparents) { ?>
							<?php foreach ($categories as $key => $category) { ?>
								<li class="dropdown">
									<?php if ($category['children']) { ?>
										<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?> <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu keep-open">
											<li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
											<?php foreach ($category['children'] as $children) { ?>
												<li><a class="text-muted" href="<?php echo $children['href']; ?>"><small>&ndash; <?php echo $children['name']; ?></small></a></li>
											<?php } ?>
										</ul>
									<?php } else { ?>
										<a href="<?php echo $category['href']; ?>"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></a>
									<?php } ?>
								</li>
							<?php } ?>
						<?php } else if (!$moneymaker2_header_categories_panel_hideparents) { ?>
							<?php foreach ($categories as $key => $category) { ?>
								<li class="dropdown navbar-full-fw">
									<?php if ($category['children']) { ?>
										<a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?> <i class="fa fa-angle-down"></i></a>
										<ul class="dropdown-menu keep-open">
											<li>
												<div>
													<div class="row">
														<ul class="col-parent-category col-sm-<?php echo $moneymaker2_header_categories_panel_columns['sm'][0]; ?> col-md-<?php echo $moneymaker2_header_categories_panel_columns['md'][0]; ?> col-lg-<?php echo $moneymaker2_header_categories_panel_columns['lg'][0]; ?> list-unstyled">
															<li class="text-center"><a href="<?php echo $category['href']; ?>"><?php if (!$moneymaker2_header_categories_panel_hidethumbs&&$category['image']) { ?><div class="hidden-xs"><img class="img-thumbnail" src="<?php echo $category['image']; ?>" alt="<?php echo $category['name']; ?>" /></div><?php } ?><div class="btn btn-link btn-block"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_child_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i><?php } ?> <?php echo $category['name']; ?></div></a></li>
															<?php if ($category['description']) { ?>
																<li><p><small><?php echo $category['description']; ?></small></p></li>
															<?php } ?>
														</ul>
														<?php foreach ($category['children'] as $key => $children) { ?>
															<ul class="col-sm-<?php echo $moneymaker2_header_categories_panel_columns['sm'][0]; ?> col-md-<?php echo $moneymaker2_header_categories_panel_columns['md'][0]; ?> col-lg-<?php echo $moneymaker2_header_categories_panel_columns['lg'][0]; ?> list-unstyled">
																<?php if ($children['href']) { ?><li class="text-center"><a href="<?php echo $children['href']; ?>"><?php if (!$moneymaker2_header_categories_panel_hidethumbs&&$children['child_image']) { ?><div class="hidden-xs"><img class="img-thumbnail" src="<?php echo $children['child_image']; ?>" alt="<?php echo $children['name']; ?>" /></div><?php } ?><div class="btn btn-<?php if(isset($children['style'])&&$children['style']) { ?><?php echo $children['style']; ?><?php } else { ?>default<?php } ?> btn-block"><?php if ($moneymaker2_common_categories_icons_enabled&&$children['icon']&&$moneymaker2_header_categories_panel_child_icons) { ?><i class="fa fa-fw fa-<?php echo $children['icon']; ?>"></i><?php } ?> <?php echo $children['name']; ?></div></a></li><?php } ?>
																<?php if (!$moneymaker2_header_categories_panel_hidechilds) { ?>
																	<?php if ($children['children']) { ?>
																		<?php foreach ($children['children'] as $child) { ?>
																			<li><a class="text-muted" href="<?php echo $child['href']; ?>"><small>&ndash; <?php echo $child['name']; ?></small></a></li>
																		<?php } ?>
																	<?php } ?>
																<?php } ?>
																<?php if(isset($children['text'])&&$children['text']) { ?>
																	<li><?php echo $children['text']; ?></li>
																<?php } ?>
															</ul>
															<?php if (($key+2)%$moneymaker2_header_categories_panel_columns['sm'][1]==0) { ?><div class="clearfix visible-sm"></div><?php } ?>
															<?php if (($key+2)%$moneymaker2_header_categories_panel_columns['md'][1]==0) { ?><div class="clearfix visible-md"></div><?php } ?>
															<?php if (($key+2)%$moneymaker2_header_categories_panel_columns['lg'][1]==0) { ?><div class="clearfix visible-lg"></div><?php } ?>
														<?php } ?>
													</div>
												</div>
											</li>
										</ul>
									<?php } else { ?>
										<a href="<?php echo $category['href']; ?>"><?php if ($moneymaker2_common_categories_icons_enabled&&$category['icon']&&$moneymaker2_header_categories_panel_icons) { ?><i class="fa fa-fw fa-<?php echo $category['icon']; ?>"></i> <?php } ?><?php echo $category['name']; ?></a>
									<?php } ?>
								</li>
							<?php } ?>
						<?php } ?>
						<?php foreach ($moneymaker2_header_panellinks as $value) { ?>
							<li><a href="<?php echo $value['multilink'] ? $value['multilink'] : $value['link']; ?>"><i class="fa fa-fw fa-<?php echo $value['icon']; ?>"></i> <?php echo $value['caption']; ?></a></li>
						<?php } ?>
					</ul>
				</div>
			</div>
		</nav>
	<?php } ?>
</header>

<div  id="search">
	<div id="myModalBoxSearch" class="modal fade">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="search-modal-window">
					<div class="input-group collapse">
						<input autofocus="autofocus" type="text" name="search" value="" placeholder="Поиск" class="form-control" />
						<span class="input-group-btn">
                          <button type="button" class="btn btn-primary"><i class="fa fa-search"></i></button>
                        </span>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div  id="search">
	<div id="myModalBoxPhones" class="modal fade">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

			</div>
		</div>
	</div>
</div>

<div id="myModalBoxCart" class="modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="search-modal-window">
				<?php echo $popup_cart; ?>
			</div>
		</div>
	</div>
</div>

<script>
	$('.modal-phones').on('click', function(){
		$('#myModalBoxPhones').modal({
			backdrop: true,
			keyboard: true,
			show: true
		});
	});
	$('.modal-search').on('click', function(){
		$('#myModalBoxSearch').modal({
			backdrop: true,
			keyboard: true,
			show: true
		});
		
		$('#myModalBoxSearch').on('shown.bs.modal', function() {
			$(this).find('input').focus();
		});
		
		
	});
	$('.modal-cart').on('click', function(){
		$('#myModalBoxCart').modal({
			backdrop: true,
			keyboard: true,
			show: true
		});
	});
</script>
<?php if($product_page) { ?>
	<script>
		$('.smart_filter').on('click', function(){
			$('#myModalBox').modal({
				backdrop: true,
				keyboard: true,
				show: true
			});
		});
	</script>
<?php } ?>
<style type="text/css">
	.whatsapp-href {
		display: none;
	}
	.image-check-option {
		width: 100%;
	}
	#myModalBoxSearch .search-modal-window {
		padding: 20px;
	}
	@media (max-width:768px){
		.cust-header-phone {
			font-size: 16px;
			margin-left: 0;
			padding: 20px 0;
		}
		.cust-header-phone span {
			color: #426ed4;
			/*border-bottom: 1px dashed #337ab7;*/
		}
		
		.cust-header-phone .city-name {
			float: left;
			border: none;
			width: 35%;
			color: #777;
			font-size: 22px;
		}
		.cust-header-phone .city-phone {
			float: left;
			width: 50%;
		}
		
		.first-call-number {
			margin-bottom: 50px;
		}
		.cust-header-phone li {
			font-size: 24px;
		}
		
		.cust-header-phone .whatsapp-href {
			position: relative;
			float: left;
			display: block;
			margin-left: 5px;
		}
		.whatsapp-button {
			right: 13px;
			bottom: 121px;
			transform: translate(-50%, -50%);
			background: #25D366;
			border-radius: 50%;
			width: 25px;
			height: 25px;
			color: #fff;
			text-align: center;
			line-height: 25px;
			font-size: 20px;
			z-index: 9999;
			margin-top: 10px;
		}
		.whatsapp-button a {
			color: #fff;
		}
		.cust-header-phone li .whatsapp-button i {
			margin-left: 0px;
		}
		.whatsapp-button:before,
		.whatsapp-button:after {
			content: " ";
			display: block;
			position: absolute;
			border: 50%;
			border: 1px solid #25D366; /*цвет анимированных волн от кнопки*/
			left: -20px;
			right: -20px;
			top: -20px;
			bottom: -20px;
			border-radius: 50%;
			animation: animate 1.5s linear infinite;
			opacity: 0;
			backface-visibility: hidden;
		}
		
		.whatsapp-button:after{
			animation-delay: .5s;
		}
		
		@keyframes animate
		{
			0%
			{
				transform: scale(0.2);
				opacity: 0;
			}
			50%
			{
				opacity: 1;
			}
			100%
			{
				transform: scale(0.8);
				opacity: 0;
			}
		}
		
	}

</style>
