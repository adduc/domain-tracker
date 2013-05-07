<?php

namespace Adduc\DomainTracker;

class App extends Singleton {

    protected
        $app_root,
        $config,
        $db_conn;

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

    public function getDbConn() {
        if(is_null($this->db_conn)) {
            $dsn = sprintf(
                "mysql:dbname=%s;host=%s",
                $this->config['db_database'],
                $this->config['db_hostname']
            );
            $this->db_conn = new \PDO($dsn,
                $this->config['db_username'],
                $this->config['db_password']
            );
        }
        return $this->db_conn;
    }

}
