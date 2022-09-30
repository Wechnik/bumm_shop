<?php

namespace Timrod\Occleaner\Installer;

use Symfony\Component\Filesystem\Filesystem;

class Installer
{
    public function __construct($registry)
    {
        $this->db = $registry->get('db');
        $this->filesystem = new Filesystem();
    }

    public function install()
    {
        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "timrod_occleaner_filesystem` (
            `id` int(11) NOT NULL AUTO_INCREMENT, 
            `filename` varchar(128) NOT NULL,
            `path` varchar(255) NOT NULL,
            `size` int(11) NOT NULL,
            `task` varchar(64) NOT NULL,
			`ignored` tinyint(1) NOT NULL,
            PRIMARY KEY (`id`),
			CONSTRAINT un_path UNIQUE (`path`, `task`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "timrod_occleaner_database` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`name` varchar(255) NOT NULL,
			`item_id` int(11) NOT NULL,
			`task` varchar(64) NOT NULL,
			`ignored` tinyint(1) NOT NULL,
			PRIMARY KEY (`id`),
			CONSTRAINT un_item_id UNIQUE (`item_id`, `task`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "timrod_occleaner_data` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`code` varchar(64) NOT NULL,		
			`key` varchar(128) NOT NULL,
			`value` text NOT NULL,
			`serialized` tinyint(1) NOT NULL,
			PRIMARY KEY (`id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");

        $this->db->query("CREATE TABLE IF NOT EXISTS `" . DB_PREFIX . "timrod_occleaner_data_list` (
			`id` int(11) NOT NULL AUTO_INCREMENT,			
			`code` varchar(64) NOT NULL,
			`value` varchar(255) NOT NULL,
			PRIMARY KEY (`id`),
			CONSTRAINT un_value UNIQUE (`value`, `code`)			
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci");
            
        $this->garbage();
    }

    public function uninstall()
    {
        // Settings
        if (VERSION < '3.0.0.0') {
            $code = "module_timrod_occleaner";
            $this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` = '" . $this->db->escape($code) . "'");
        }

        // Tables
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "timrod_occleaner_filesystem`;");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "timrod_occleaner_database`;");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "timrod_occleaner_data`;");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "timrod_occleaner_data_list`;");

        $this->garbage();
    }

    public function garbage()
    {
        // Database
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "timrod_occleaner_task_info`;");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "timrod_occleaner_storage`;");
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "timrod_occleaner_storage_list`;");
    }
}
