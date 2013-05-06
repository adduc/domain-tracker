<?php

namespace Adduc\DomainTracker;

class View {

    protected
        $app,
        $file;

    public function __construct($file, App $app = null) {
        $this->app = is_null($app) ? App::getInstance() : $app;

        $this->file = "{$this->app->getAppRoot()}/templates/{$file}.php";

        if(!file_exists($this->file) || !is_readable($this->file)) {
            throw new Exception\ViewDoesNotExist($this->file);
        }
    }

    public function render(array $variables) {
        extract($variables);
        include($this->file);
    }
}
