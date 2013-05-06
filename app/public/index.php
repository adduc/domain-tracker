<?php

use Doctrine\Common\Inflector\Inflector;
use Adduc\DomainTracker\Exception;
use Adduc\DomainTracker\Controller\Controller;

include(dirname(__DIR__) . '/vendor/autoload.php');

function get($arr, $val, $fallback) {
    return array_key_exists($val, $arr) ? $arr[$val] : $fallback;
}

$ns = "\\Adduc\\DomainTracker\\Controller\\";

$class = get($_GET, 'controller', 'index');
$class = Inflector::classify($class);
$class = "{$ns}{$class}";

$rc = class_exists($class, true) ? new ReflectionClass($class) : false;

if(!class_exists($class, true)) {
    throw new Exception\ControllerDoesNotExist($class);
} elseif(!is_subclass_of($class, "{$ns}Controller", true)) {
    throw new Exception\ControllerDoesNotInherit($class);
}

$action = get($_GET, 'action', 'index');

$controller = new $class();
$controller->invoke($action);
