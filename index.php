<?php
// Version
define('VERSION', '2.3.0.2');

// Configuration
if (is_file('config.php')) {
	require_once('config.php');
}
//define("deviceType", "computer");
// Startup
require_once(DIR_SYSTEM . 'startup.php');
//echo DIR_SYSTEM;
start('catalog');