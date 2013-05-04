<?php
include(dirname(__DIR__) . '/vendor/autoload.php');

function get($arr, $val, $fallback) {
	return array_key_exists($val, $arr) ? $arr[$val] : $fallback;
}

$controller = get($_GET, 'controller', false);
$action = get($_GET, 'action', false);



switch($action) {
	default: {
		
	}
}
