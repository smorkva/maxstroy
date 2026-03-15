<?php
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_DEPRECATED);
ini_set('display_errors', '0');

// Version
define('VERSION', '2.3.0.2');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}
define("deviceType", "computer");
// Startup
require_once(DIR_SYSTEM . 'startup.php');
//echo DIR_SYSTEM;
start('catalog');