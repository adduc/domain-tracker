<?php

namespace Adduc\DomainTracker;

class Singleton {

    protected static $instance = null;

    protected function __construct() {}

    protected function __clone() {
        throw new \Exception("Cannot clone Singleton object.");
    }

    final public static function getInstance() {

        if (!isset(static::$instance)) {
            $rc = new \ReflectionClass(get_called_class());
            static::$instance = $rc->newInstanceWithoutConstructor();
            call_user_func_array(array(static::$instance, '__construct'), func_get_args());
        }

        return static::$instance;
    }
}
