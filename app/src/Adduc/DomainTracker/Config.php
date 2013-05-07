<?php

namespace Adduc\DomainTracker;

class Config implements \ArrayAccess {

    protected
        $file,
        $config = array(),
        $writable = false;

    public function __construct($file) {
        if(!is_file($file) || !is_readable($file)) {
            throw new Exception\ConfigIsNotReadable($file);
        }

        $this->file = $file;
        $this->config = parse_ini_file($file);
        $this->writable = is_writable($file);
    }

    public function offsetExists($offset) {
        return array_key_exists($offset, $this->config);
    }

    public function offsetGet($offset) {
        return isset($this->config[$offset])
            ? $this->config[$offset] : null;
    }

    public function offsetSet($offset, $value) {
        if($this->writable) {
            $this->config[$offset] = $value;
        } else {
            throw new Exception\ConfigIsNotWritable($this->file);
        }
    }

    public function offsetUnset($offset) {
        if($this->writable) {
            unset($this->config[$offset]);
        } else {
            throw new Exception\ConfigIsNotWritable($this->file);
        }
    }

}
