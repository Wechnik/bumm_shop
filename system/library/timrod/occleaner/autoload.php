<?php

spl_autoload_register(function ($class) {
    if (strstr($class, 'Timrod\\Occleaner')) {
        $class = str_replace('Timrod\\Occleaner\\', '', $class);
        $file = DIR_SYSTEM . 'library/timrod/occleaner/' . str_replace('\\', '/', $class) . '.php';
        
        if (is_file($file)) {
            include_once(modification($file));

            return true;
        } else {
            return false;
        }
    }
});

spl_autoload_extensions('.php');