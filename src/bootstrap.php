<?php

if(!isset($_SERVER['REQUEST_TIME_FLOAT'])) {
	$_SERVER['REQUEST_TIME_FLOAT'] = microtime(true);
}

defined('APP') || define('APP', dirname(__DIR__));
include(APP . '/vendor/autoload.php');



register_shutdown_function(function() {

	// Peak Memory Usage
	$peak = memory_get_peak_usage();
	$peak = number_format($peak / 1024 / 1024, 3);
	
	$to_log['peak'] = "Peak Memory: {$peak} MiB";

	// Time to render
	$render = microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'];
	$render = number_format($render * 1000, 3);

	$to_log['render'] = "Render Time: {$render} ms";
	
	error_log("[" . implode("] [", $to_log) . "]");
});

