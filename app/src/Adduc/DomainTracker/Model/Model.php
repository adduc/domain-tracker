<?php

namespace Adduc\DomainTracker\Model;
use Adduc\DomainTracker;

abstract class Model {

    protected
        $app,
        $primary_key,
        $fields = array();

    public function __construct(App $app) {
        $this->app = $app;
    }

    public function getPrimaryKey() {
        return $this->primary_key;
    }

    /**
     * Return fields expected for this model, along with an optional
     * "filter_to" array to return only fields present in that array.
     */
    public function getFields($filter_to = array()) {

    }

}
