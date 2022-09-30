<?php

namespace Timrod\Occleaner;

class Utils
{
    public static $task_category = array(
        'system_junk' => array('system_cache', 'image_cache', 'vqmod_cache', 'log_files'),
        'images_junk' => array('unused_images'),
        'filesystem_junk' => array('empty_folders'),
        'database_junk' => array('unused_options', 'unused_attributes', 'empty_attribute_groups', 'empty_categories', 'products_without_images', 'expired_sessions'),
        'module_data' => ['results', 'temp', 'stat', 'old_version']
    );

    /**
     * Return task list by category
     * @return string
     */
    public static function getTaskListByCategory($category)
    {
        return isset(self::$task_category[$category]) ? self::$task_category[$category] : array();
    }

    /**
     * Return task category
     * @return string
     */
    public static function getTaskCategory($task)
    {
        foreach (self::$task_category as $category => $task_list) {
            if (in_array($task, $task_list)) {
                return $category;
            }
        }

        return '';
    }

    /**
     * 
     */
    public static function formatToSize($size)
    {
        $sizenames = array(' b', ' Kb', ' Mb', ' Gb', ' Tb', ' Pb', ' Eb', ' Zb', ' Yb');
        $size = floatval($size);
        $item = 0;

        while ($size >= 1024) {
            $size /= 1024;
            $item++;
        }

        $round = $item > 1 ? 1 : 0;

        return $size ? round($size, $round) . $sizenames[$item] : 0;
    }

    /**
     * 
     */
    public static function getClientIp()
    {
        $client_ip = 'UNKNOWN';
        $prepare = '';

        if (array_key_exists('HTTP_X_FORWARDED_FOR', $_SERVER)) {
            $prepare = $_SERVER["HTTP_X_FORWARDED_FOR"];
        } else if (array_key_exists('REMOTE_ADDR', $_SERVER)) {
            $prepare = $_SERVER["REMOTE_ADDR"];
        } else if (array_key_exists('HTTP_CLIENT_IP', $_SERVER)) {
            $prepare = $_SERVER["HTTP_CLIENT_IP"];
        }

        if (filter_var($prepare, FILTER_VALIDATE_IP)) {

            $client_ip = $prepare;
        } else {

            $prepare = str_replace(' ', '', trim($prepare));
            $prepare = explode(',', $prepare);

            if (is_array($prepare)) {
                foreach ($prepare as $ip) {
                    if (filter_var($ip, FILTER_VALIDATE_IP)) {
                        $client_ip = $ip;
                        break;
                    }
                }
            }
        }

        return $client_ip;
    }

    /**
     * 
     */
    public static function getPerfomanceValue($value, $performance, $default_performance = 50)
    {
        $performance = $performance > 0 ? (int)$performance : $default_performance;
        return round($value * ($performance / 100));
    }
}
