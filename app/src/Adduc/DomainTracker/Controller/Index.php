<?php

namespace Adduc\DomainTracker\Controller;

class Index extends Controller {

    /**
     * Landing page,
     * nothing to do other than serve.
     */
    public function indexAction() {}


    public function errorAction() {
        $config = $this->app->getConfig();
        $this->viewVars['dev_mode'] = $config['dev_mode'];
    }

}
