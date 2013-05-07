#!/usr/bin/php
<?php

namespace Adduc;
include(dirname(__DIR__) . '/app/vendor/autoload.php');

$app = DomainTracker\App::getInstance();
$config = $app->getConfig();
$root = dirname(__DIR__);
$dbConn = $app->getDbConn();
$cl = new CommandLine();
$schema = 'schema.sql';

switch(isset($argv[1]) ? $argv[1] : '') {

    case 'load':
    case 'restore': {
        $files = array_filter(array(
            $schema,
            'data.required.sql',
            $config['dev_sql_sample_data'],
            $config['dev_sql_private_data']
        ));

        foreach($files as $file) {
            $file = "{$root}/sql/{$file}";
            is_readable($file) || die("{$file} does not exist.");
            if(filesize($file)) {
                $result = $dbConn->query(file_get_contents($file));
                $result || die(end($dbConn->errorInfo()));
                $result->closeCursor();
            }
        }

        break;
    }


    case 'save':
    case 'backup': {

        $file = "{$root}/sql/{$schema}";
        $cmd = exec('which mysqldump', $output, $return);
        if($return !== 0) {
            echo "mysqldump could not be found in current PATH.\n";
        } else {
            $cmd  = "{$cmd} --skip-dump-date -e -d --add-drop-table -n";
            $cmd .= " --single-transaction -u {$config['db_username']}";
            $cmd .= " -p{$config['db_password']}";
            $cmd .= " -h {$config['db_hostname']}";
            $cmd .= " {$config['db_database']}";
            $cmd .= " | sed 's/\\sAUTO_INCREMENT=[0-9]*\\b//' ";
            $cmd .= " > {$file}";
            exec($cmd, $output, $return);
            if($return === 0) {
                echo "Wrote database schema to {$file}\n";
            } else {
                echo "An error occurred while writing to {$file}\n";
            }
        }

        break;
    }

    default: {
    echo "
Basic SQL management script

Supported commands:

 load, restore:
      Restore from file
 save, backup:
      Backup to file\n\n";

    }

}