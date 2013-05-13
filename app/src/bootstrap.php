<?php

/**
 * Bootstrap code to initialize app.
 */

namespace Adduc\DomainTracker;

if(php_sapi_name() != 'cli') {
    register_shutdown_function(function() {

        // Peak Memory Usage
        $peak = memory_get_peak_usage();
        $peak = number_format($peak / 1024 / 1024, 3);

        $to_log['peak'] = "Peak Memory: {$peak} MiB";

        // Time to render
        $render = microtime(true) - $_SERVER['REQUEST_TIME_FLOAT'];
        $render = number_format($render * 1000, 3);

        $to_log['render'] = "Render Time: {$render} ms";

        error_log("[" . implode("] [", $to_log) . "]");

    });
}

/*
set_exception_handler(function(\Exception $e) {
    if(php_sapi_name() == 'cli') {

    }
});
*/



/** Initialize app */
$app = App::getInstance(dirname(__DIR__));
$config = $app->getConfig();

ini_set('display_errors', $config['dev_mode'] ? 1 : 0);
