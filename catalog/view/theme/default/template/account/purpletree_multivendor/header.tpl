<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>

<meta charset="UTF-8" />
<title> <?php echo $heading_title1; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<?php  foreach($stylespts as $stylepts):  ?>
<link href="<?php echo $stylepts['href']; ?>" type="text/css" rel="<?php echo $stylepts['rel']; ?>" media="<?php echo $stylepts['media']; ?>" />
<?php  endforeach;  ?>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />
<script type="text/javascript" src="catalog/view/javascript/purpletree/jquery/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/purpletree/bootstrap/js/bootstrap.min.js"></script>
<link href="catalog/view/javascript/purpletree/bootstrap1/css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="catalog/view/javascript/purpletree/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
<script src="catalog/view/javascript/purpletree/jquery/datetimepicker/moment/moment.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/purpletree/jquery/datetimepicker/moment/moment-with-locales.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/purpletree/jquery/datetimepicker/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/purpletree/jquery/datetimepicker/bootstrap-datetimepicker.min.css" type="text/css" rel="stylesheet" media="screen" />
<?php  if ($direction =='rtl'):  ?>
<link href="catalog/view/javascript/purpletree/bootstrap/css/bootstrap.min-a.css" type="text/css" rel="stylesheet" />
<link href="catalog/view/theme/default/stylesheet/purpletree/custom-a.css" type="text/css" rel="stylesheet" />
<link href="catalog/view/javascript/purpletree/css/stylesheet/adminstylesheet-a.css" type="text/css" rel="stylesheet" />
<?php  else:  ?>
<link href="catalog/view/javascript/purpletree/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="catalog/view/theme/default/stylesheet/purpletree/custom.css" type="text/css" rel="stylesheet" />
<link href="catalog/view/javascript/purpletree/css/stylesheet/adminstylesheet.css" type="text/css" rel="stylesheet" />
<?php  endif  ?>
<link href="catalog/view/javascript/purpletree/css/stylesheet/commonstylesheet.css" type="text/css" rel="stylesheet" />
			<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<?php  foreach($scriptspts as $scriptpts):  ?>
<script src="<?php echo $scriptpts; ?>" type="text/javascript"></script>
<?php  endforeach;  ?>
			<script src="catalog/view/javascript/purpletree/common.js" type="text/javascript"></script>
<?php foreach ($analytics as $analytic) { ?>
<?php echo $analytic; ?>
<?php } ?>
</head>
<body>
<div id="container">
<header id="header" class="navbar navbar-static-top">
  <div class="container-fluid">	
	 <div id="header-logo" class="pts-navbar-header"> 
		 <?php if ($logo) { ?>
			  <a class="pts-pull-left navbar-brand ptsc-header-padding" href="<?php echo $home; ?>" /><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive ptsc-header-height"/></a>
		 <?php } else { ?>
			  <h1><a  class="pts-pull-left navbar-brand ptsc-header-padding" href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
		 <?php } ?>
	 </div>
    <a href="#" id="button-menu" class="hidden-md hidden-lg"><span class="fa fa-bars"></span></a>
		<?php  if(isset($logged)):  ?>
    <ul class="nav navbar-nav pts-navbar-nav pts-navbar-right pts-pull-right accountptsdrop">
      <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<?php echo $image; ?>" alt="<?php echo isset($firstname)?$firstname:''; ?> <?php echo isset($lastname)?$lastname:''; ?>" title="<?php echo isset($username)?$username:''; ?>" id="user-profile" class="img-circle" /><?php echo isset($firstname)?$firstname:''; ?> <?php echo isset($lastname)?$lastname:''; ?> <i class="fa fa-caret-down fa-fw"></i></a>
        <ul class="dropdown-menu dropdown-menu-right">
             <li><a target="_blank" href="<?php echo $sellerprofile; ?>"><i class="fa fa-user"></i> <?php echo $text_sellerprofile; ?></a></li>
          <?php if(isset($storename)) { ?>
          <li class="dropdown-header"><?php echo $text_store; ?></li>
		  <li><a href="<?php echo $storeurl; ?>" target="_blank"><?php echo $storename; ?></a></li>
		  <?php } ?>
        </ul>
      </li>
      <li><a href="<?php echo $logout; ?>"><i class="fa fa-sign-out"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_logout; ?></span></a></li>
    </ul>
    <?php  endif;  ?>
	<div class="ptssellertop pts-pull-right">
		<?php echo (isset($currency)?$currency:''); ?>
		<?php echo (isset($language)?$language:''); ?>
	</div>
  </div>
</header>
