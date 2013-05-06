<?php

namespace Adduc\DomainTracker;

class App extends Singleton {

    protected
        $app_root,
        $config;

    protected function __construct($app_root, Config $config = null) {
        $this->app_root = $app_root;

        $this->config = is_null($config)
            ? new Config($app_root . "/config/config.ini") : $config;
    }

    public function getAppRoot() {
        return $this->app_root;
    }

    public function getConfig() {
        return $this->config;
    }

}
