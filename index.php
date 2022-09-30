<?php
//if(!isset($_SERVER['HTTPS']) || $_SERVER['HTTPS'] == ""){
//    $redirect = "https://".$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
//    header("HTTP/1.1 301 Moved Permanently");
//    header("Location: $redirect");
//}
// Version
define('VERSION', '2.3.0.2.3');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}

// Install
if (!defined('DIR_APPLICATION')) {
	header('Location: install/index.php');
	exit;
}

// Startup
require_once(DIR_SYSTEM . 'startup.php');

start('catalog');