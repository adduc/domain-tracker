<?php
namespace Adduc\MVC\Exception;

switch(true) {
    case $dev_mode && $matches['error'] instanceof Exception: {
        if($message = $matches['error']->friendlyMessage()) {
            echo $message;
            break;
        }
    }

    case $dev_mode: {
        echo "<pre>{$matches['error']}</pre>";
        break;
    }

    default: {
        echo "An internal error occurred.";
        break;
    }

}
