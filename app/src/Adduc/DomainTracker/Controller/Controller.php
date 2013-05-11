<?php

namespace Adduc\DomainTracker\Controller;
use Adduc\DomainTracker\App;
use Adduc\MVC\Controller as BaseController;

abstract class Controller extends BaseController {

    protected $app;

    public function __construct() {
        $this->app = App::getInstance();
    }

}
