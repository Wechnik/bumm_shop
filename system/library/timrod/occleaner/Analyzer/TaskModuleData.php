<?php

namespace Timrod\Occleaner\Analyzer;

use Symfony\Component\Finder\Finder;
use Symfony\Component\Filesystem\Filesystem;
use Timrod\Occleaner\Utils;

class TaskModuleData extends Task
{
    public function init()
    {
        $this->finder = new Finder();
        $this->filesystem = new Filesystem();
    }

    public function scan()
    {
        $result = array();

        $result['results'] = $this->scanResults();
        $result['temp'] = $this->scanTemp();
        $result['stat'] = $this->scanStat();
        $result['old_version'] = $this->scanOldVersion();

        return $result;
    }

    public function delete(array $list)
    {
        if (in_array('results', $list)) {
            $this->db->query("DELETE FROM " . DB_PREFIX . "timrod_occleaner_filesystem WHERE `ignored` = '0'");
            $this->db->query("DELETE FROM " . DB_PREFIX . "timrod_occleaner_database WHERE `ignored` = '0'");
        }

        if (in_array('temp', $list)) {

            $delete = [];

            foreach ($this->getTempFiles() as $path) {

                $file = new \SplFileInfo($path);

                if ($file->isFile()) {
                    $delete[] = $file->getRealPath();
                }

                if ($file->isDir()) {

                    $this->finder->in($path);

                    foreach ($this->finder as $f) {
                        $delete[] = $f->getRealPath();
                    }
                }
            }

            $this->filesystem->remove($delete);

            //Database
            $query = $this->db->query("DELETE FROM " . DB_PREFIX . "timrod_occleaner_data WHERE `code` LIKE 'tmp_%'");
            $query = $this->db->query("DELETE FROM " . DB_PREFIX . "timrod_occleaner_data_list WHERE `code` LIKE 'tmp_%'");
        }

        if (in_array('old_version', $list)) {

            // Files
            $delete = [];

            foreach ($this->getOldVersionFiles() as $path) {

                $file = new \SplFileInfo($path);

                if ($file->isFile()) {
                    $delete[] = $file->getRealPath();
                }

                if ($file->isDir()) {

                    $this->finder->in($path);

                    foreach ($this->finder as $f) {
                        $delete[] = $f->getRealPath();
                    }
                }
            }

            $this->filesystem->remove($delete);

            //Database
            $this->db->query("DELETE FROM " . DB_PREFIX . "modification WHERE `code` = 'occleaner'");
            $this->db->query("DELETE FROM " . DB_PREFIX . "setting WHERE `code` = 'module_occleaner'");
            $this->db->query("DELETE FROM " . DB_PREFIX . "extension WHERE `code` = 'occleaner'");

            if (VERSION >= '3.0.0.0') {
                $query = $this->db->query("SELECT `extension_install_id` FROM " . DB_PREFIX . "extension_install WHERE `filename` LIKE 'occleaner-1.%'");

                foreach ($query->rows as $row) {
                    $this->db->query("DELETE FROM " . DB_PREFIX . "extension_install WHERE `extension_install_id` = '" . (int)$row['extension_install_id'] . "'");
                    $this->db->query("DELETE FROM " . DB_PREFIX . "extension_path WHERE `extension_install_id` = '" . (int)$row['extension_install_id'] . "'");
                }
            }
        }

        return 'done';
    }

    private function scanResults()
    {
        $result = array(
            'db' => 0,
            'files' => 0,
            'size' => 0
        );

        $query = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "timrod_occleaner_filesystem WHERE `ignored` = '0'");

        $result['db'] += (int)$query->row['count'];

        $query = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "timrod_occleaner_database WHERE `ignored` = '0'");

        $result['db'] += (int)$query->row['count'];

        return $result;
    }

    private function scanTemp()
    {
        $result = array(
            'db' => 0,
            'files' => 0,
            'size' => 0
        );

        // Files
        foreach ($this->getTempFiles() as $path) {

            $file = new \SplFileInfo($path);

            if ($file->isFile()) {
                $result['size'] += $file->getSize();
                $result['files']++;
            }

            if ($file->isDir()) {

                $this->finder->in($path);

                foreach ($this->finder as $f) {
                    $result['size'] += $f->getSize();
                    $result['files']++;
                }
            }
        }

        $result['size'] = Utils::formatToSize($result['size']);

        //Database
        $query = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "timrod_occleaner_data WHERE `code` LIKE 'tmp_%'");
        $result['db'] += (int)$query->row['count'];

        $query = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "timrod_occleaner_data_list WHERE `code` LIKE 'tmp_%'");
        $result['db'] += (int)$query->row['count'];

        return $result;
    }

    private function scanStat()
    {
        $result = array(
            'db' => 0,
            'files' => 0,
            'size' => 0
        );

        return $result;
    }

    private function scanOldVersion()
    {
        $result = array(
            'db' => 0,
            'files' => 0,
            'size' => 0
        );

        // Files
        foreach ($this->getOldVersionFiles() as $path) {

            $file = new \SplFileInfo($path);

            if ($file->isFile()) {
                $result['size'] += $file->getSize();
                $result['files']++;
            }

            if ($file->isDir()) {

                $this->finder->in($path);

                foreach ($this->finder as $f) {
                    $result['size'] += $f->getSize();
                    $result['files']++;
                }
            }
        }

        $result['size'] = Utils::formatToSize($result['size']);

        // Database
        $query = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "modification WHERE `code` = 'occleaner'");
        $result['db'] += (int)$query->row['count'];

        $query = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "setting WHERE `code` = 'module_occleaner'");
        $result['db'] += (int)$query->row['count'];

        $query = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "extension WHERE `code` = 'occleaner'");
        $result['db'] += (int)$query->row['count'];

        if (VERSION >= '3.0.0.0') {
            $query = $this->db->query("SELECT `extension_install_id` FROM " . DB_PREFIX . "extension_install WHERE `filename` LIKE 'occleaner-1.%'");

            foreach ($query->rows as $row) {
                $result['db']++;
                $ret = $this->db->query("SELECT COUNT(*) AS count FROM " . DB_PREFIX . "extension_path WHERE `extension_install_id` = '" . (int)$row['extension_install_id'] . "'");
                $result['db'] += (int)$ret->row['count'];
            }
        }

        return $result;
    }

    private function getTempFiles()
    {
        $list = array();

        if (VERSION < '3.0.0.0') {
            $list[] = DIR_SYSTEM . 'storage/timrod/occleaner';
            $list[] = DIR_SYSTEM . 'storage/timrod_occleaner';
        } else {
            $list[] = DIR_STORAGE . 'timrod/occleaner';
            $list[] = DIR_STORAGE . 'timrod_occleaner';
        }

        return $list;
    }

    private function getOldVersionFiles()
    {
        $list = array(
            // before v. 2.x.x
            DIR_APPLICATION . 'controller/extension/module/occleaner.php',
            DIR_APPLICATION . 'language/en-gb/extension/module/occleaner.php',
            DIR_APPLICATION . 'language/ru-ru/extension/module/occleaner.php',
            DIR_APPLICATION . 'model/extension/module/occleaner.php',
            DIR_APPLICATION . 'view/template/extension/module/occleaner.tpl',
            DIR_APPLICATION . 'view/template/extension/module/occleaner.twig',

            DIR_APPLICATION . 'controller/module/occleaner.php',
            DIR_APPLICATION . 'language/en-gb/module/occleaner.php',
            DIR_APPLICATION . 'language/ru-ru/module/occleaner.php',
            DIR_APPLICATION . 'model/module/occleaner.php',
            DIR_APPLICATION . 'view/template/module/occleaner.tpl',

            DIR_APPLICATION . 'view/image/occleaner/',
            DIR_APPLICATION . 'view/javascript/occleaner/',
            DIR_APPLICATION . 'view/stylesheet/occleaner/',

            DIR_SYSTEM . 'occleaner.ocmod.xml',

            // after v. 2.1.24
            DIR_APPLICATION . 'view/template/module/timrod_occleaner/page_system_junk.tpl',
            DIR_APPLICATION . 'view/template/module/timrod_occleaner/page_images_junk.tpl',
            DIR_APPLICATION . 'view/template/module/timrod_occleaner/page_filesystem_junk.tpl',
            DIR_APPLICATION . 'view/template/module/timrod_occleaner/page_database_junk.tpl',

            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_system_junk.tpl',
            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_images_junk.tpl',
            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_filesystem_junk.tpl',
            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_database_junk.tpl',

            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_system_junk.twig',
            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_images_junk.twig',
            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_filesystem_junk.twig',
            DIR_APPLICATION . 'view/template/extension/module/timrod_occleaner/page_database_junk.twig',
        );

        return $list;
    }
}
