<?php

namespace Timrod\Occleaner\Analyzer;

use Symfony\Component\Finder\Finder;
use Symfony\Component\Filesystem\Filesystem;
use Timrod\Occleaner\Utils;

class TaskImagesJunk extends Task
{
    private $finder_extensions = array();
    private $image_extensions = array();
    private $exclude = [];

    public function init()
    {
        $this->finder = new Finder();
        $this->finder->ignoreUnreadableDirs();

        $this->filesystem = new Filesystem();

        $this->image_extensions = array('jpg', 'jpeg', 'png', 'gif', 'svg', 'ico');

        foreach ($this->image_extensions as $ext) {
            $this->finder_extensions[] = '*.' . $ext;
            $this->finder_extensions[] = '*.' . strtoupper($ext);
        }

        foreach ($this->image_extensions as $ext) {
            $this->finder_extensions[] = '*.' . $ext;
            $this->finder_extensions[] = '*.' . strtoupper($ext);
        }

        $exclude = $this->config->get('module_timrod_occleaner_performance_exclude');
        $exclude = str_replace(array("\r", "\n", "\r\n"), '', $exclude);
        $exclude = explode(',', $exclude);
        $exclude = array_diff($exclude, array(0, null));

        foreach ($exclude as $dir) {
            $dir = trim($dir, '/');
            $dir = explode('/', $dir);
            unset($dir[0]);
            $dir = implode('/', $dir);
            if ($dir) {
                $this->exclude[] = $dir;
            }
        }
    }

    public function scan()
    {
        switch ($this->task) {
            case 'unused_images':
                return $this->scanUnusedImages();
            default:
                return array('status' => 'done',);
        }
    }

    public function delete(array $list)
    {
        $size = 0;

        foreach ($list as $id) {
            $file = $this->task_storage->get($id);
            $filename = $file ? $file['path'] : false;

            if ($this->filesystem->exists($filename) && is_file($filename)) {
                $this->filesystem->remove($filename);
                $size += $file['size'];
                $this->task_storage->delete($id);
            }
        }

        return Utils::formatToSize($size);
    }

    private function scanUnusedImages()
    {
        $code = 'tmp_' . $this->task . '_scan';
        $next_step = $this->storage->get($code, 'next_step') ?: 'start';

        // Start
        if ($next_step === 'start') {

            $this->storage->set($code, 'next_step', 'get_database_tables');
            $this->storage->set($code, 'db_tables', []);
            $this->storage->set($code, 'fs_root_folders', [DIR_APPLICATION, DIR_CATALOG, DIR_SYSTEM]);
            $this->storage->set($code, 'last_index', 0);

            $this->task_storage->clear();

            return array(
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_getting_database_info'),
            );
        }

        // Getting all database tables
        if ($next_step === 'get_database_tables') {

            $this->storage->set($code, 'db_tables', $this->getDatabaseTables());
            $this->storage->set($code, 'next_step', 'split_database_tables');

            return array(
                'step' => $next_step,
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_data_processing'),
            );
        }

        // Split database table for parts
        if ($next_step === 'split_database_tables') {

            $db_tables = $this->storage->get($code, 'db_tables');
            $split = $this->splitDatabaseTables($db_tables);

            $index = 0;
            foreach ($split as $parts) {
                if ($parts) {
                    $this->storage->set($code, 'db_tables_split_' . $index, $parts);
                    $index++;
                }
            }

            $this->storage->set($code, 'next_step', 'find_images_in_db');

            return array(
                'step' => $next_step,
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_database_analysis'),
            );
        }

        // Find images path in database
        if ($next_step === 'find_images_in_db') {

            $split_index = $this->storage->get($code, 'last_index');
            $list = $this->storage->get($code, 'db_tables_split_' . $split_index);

            if ($list) {

                foreach ($list as $table) {

                    $query = $this->db->query("SELECT * FROM `" . $this->db->escape($table['name']) . "` ORDER BY '" . $this->db->escape($table['column_id']) . "' LIMIT " . (int)$table['start'] . "," . (int)$table['limit']);

                    foreach ($query->rows as $rows) {
                        foreach ($rows as $row) {
                            $result = $this->matchPath($row);
                            if ($result) {
                                foreach ($result as $image) {
                                    $this->storage_list->add('tmp_' . $this->task . '_used', strrev($image));
                                }
                            }
                        }
                    }
                }


                $split_index++;
                $this->storage->set($code, 'last_index', $split_index);

                return array(
                    'step' => $next_step,
                    'last_index' => $split_index,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_database_analysis'),
                );

            } else {

                $this->storage->set($code, 'next_step', 'find_images_in_fs');
                $this->storage->set($code, 'last_index', 0);

                return array(
                    'step' => $next_step,
                    'last_index' => $split_index,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
                );
            }
        }

        // Find images path in filesystem
        if ($next_step === 'find_images_in_fs') {

            $root_folders = $this->storage->get($code, 'fs_root_folders');

            if (count($root_folders)) {

                $directory = array_shift($root_folders);

                $this->finder->name('*.php');
                $this->finder->name('*.twig');
                $this->finder->name('*.tpl');
                $this->finder->name('*.css');
                $this->finder->exclude('storage');
                $this->finder->contains('/((\'|")(.*)\.(' . implode('|', $this->image_extensions) . ')(\'|"))/i');
                $this->finder->files()->in($directory);


                foreach ($this->finder as $file) {
                    $result = $this->matchPath($file->getContents());
                    if ($result) {
                        foreach ($result as $image) {
                            $this->storage_list->add('tmp_' . $this->task . '_used', strrev($image));
                        }
                    }
                }

                $this->storage->set($code, 'fs_root_folders', $root_folders);

                return array(
                    'step' => $next_step,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
                );

            } else {

                $this->storage->set($code, 'next_step', 'check_used_images');

                return array(
                    'step' => $next_step,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
                );
            }
        }

        // Check used images
        if ($next_step === 'check_used_images') {

            foreach ($this->image_extensions as $ext) {
                $ext = '.' . $ext;
                $c = 'tmp_' . $this->task . '_used';
                $this->db->query("DELETE FROM " . DB_PREFIX ."timrod_occleaner_data_list WHERE `value` = '" . $this->db->escape(strrev($ext)) . "' AND `code` = '" . $this->db->escape($c) . "'");
            }

            $this->storage->set($code, 'next_step', 'get_exists_images');

            return array(
                'step' => $next_step,
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
            );
        }

        if ($next_step === 'get_exists_images') {

            foreach ($this->finder_extensions as $ext) {
                $this->finder->name($ext);
            }

            $this->finder->exclude('cache');

            foreach ($this->exclude as $exclude) {
                $this->finder->exclude($exclude);
            }

            $this->finder->files()->in(DIR_IMAGE);

            $part_count = Utils::getPerfomanceValue(10000, $this->config->get('module_timrod_occleaner_performance_filesystem'));
            $last_index = (int)$this->storage->get($code, 'last_index');

            $index = 0;
            $end = (int)($last_index + $part_count);

            foreach ($this->finder as $file) {

                if ($index < $last_index) {

                    $index++;
                    continue;

                } elseif ($index >= $last_index && $index < $end) {

                    $this->storage_list->add('tmp_' . $this->task . '_exists', strrev($file->getRealPath()));
                    $index++;

                } elseif ($index === $end) {

                    $this->storage->set($code, 'last_index', $end);

                    return array(
                        'step' => $next_step,
                        'last_index' => $index,
                        'status' => 'next',
                        'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
                    );
                }

            }

            $this->storage->set($code, 'next_step', 'compare_images');
            $this->storage->set($code, 'last_index', 0);

            return array(
                'step' => $next_step,
                'last_index' => $index,
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
            );
        }

        // Compare and find unused images
        if ($next_step === 'compare_images') {

            $part = Utils::getPerfomanceValue(5000, $this->config->get('module_timrod_occleaner_performance_database'));

            $used_list = $this->storage_list->getList('tmp_' . $this->task . '_used', ['start' => 0, 'limit' => $part]);

            if (count($used_list)) {

                foreach ($used_list as $used) {
                    $result = $this->storage_list->search('tmp_' . $this->task . '_exists', $used['value']);

                    foreach ($result as $exists) {
                        $this->storage_list->delete($exists['id']);
                    }

                    $this->storage_list->delete($used['id']);
                }

                return array(
                    'step' => $next_step,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_processing_result'),
                );

            } else {

                $this->storage->set($code, 'next_step', 'writting_results');

                return array(
                    'step' => $next_step,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_writting_results'),
                );

            }
        }

        if ($next_step === 'writting_results') {

            $part = Utils::getPerfomanceValue(5000, $this->config->get('module_timrod_occleaner_performance_database'));
            $list = $this->storage_list->getList('tmp_' . $this->task . '_exists', ['start' => 0, 'limit' => $part]);

            if (count($list)) {

                foreach ($list as $item) {

                    $path = strrev($item['value']);

                    $file = new \SplFileInfo($path);

                    if (@stat($path)) {

                        $info = array(
                            'filename' => $file->getFilename(),
                            'path' => $file->getRealPath(),
                            'size' => $file->getSize(),
                        );

                        $this->task_storage->add($info);
                    }

                    $this->storage_list->delete($item['id']);
                }

                return array(
                    'step' => $next_step,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_processing_result'),
                );

            } else {

                $this->storage->set($code, 'next_step', 'done');

                $this->task_storage->updateLastScan();

                return array(
                    'step' => $next_step,
                    'status' => 'next',
                    'text_next_step' => $this->language->get('text_step_clearing_temporary_data'),
                );

            }
        }

        if ($next_step === 'done') {

            $this->storage->deleteByCode($code);
            $this->storage_list->deleteList('tmp_' . $this->task . '_used');
            $this->storage_list->deleteList('tmp_' . $this->task . '_exists');
            $this->storage_list->deleteList('tmp_' . $this->task . '_exists_dirs');

            return array(
                'step' => $next_step,
                'status' => 'done',
                'text_next_step' => $this->language->get('text_step_update'),
            );
        }

        return array('status' => 'done',);

    }

    private function getDatabaseTables()
    {
        $return = array();

        $query = $this->db->query("SHOW TABLES FROM `" . DB_DATABASE . "`");

        foreach ($query->rows as $result) {

            if (utf8_substr($result['Tables_in_' . DB_DATABASE], 0, strlen(DB_PREFIX)) == DB_PREFIX) {

                if (isset($result['Tables_in_' . DB_DATABASE])) {

                    $ignore = array(
                        DB_PREFIX . 'timrod_occleaner_filesystem',
                        DB_PREFIX . 'timrod_occleaner_database',
                        DB_PREFIX . 'timrod_occleaner_task_info',
                        DB_PREFIX . 'timrod_occleaner_task_storage',
                        DB_PREFIX . 'timrod_occleaner_task_storage_list',

                        DB_PREFIX . 'customer',
                        DB_PREFIX . 'customer_activity',
                        DB_PREFIX . 'customer_affiliate',
                        DB_PREFIX . 'customer_approval',
                        DB_PREFIX . 'customer_group',
                        DB_PREFIX . 'customer_history',
                        DB_PREFIX . 'customer_ip',
                        DB_PREFIX . 'customer_login',
                        DB_PREFIX . 'customer_online',
                        DB_PREFIX . 'customer_search',
                        DB_PREFIX . 'customer_transaction',
                        DB_PREFIX . 'customer_wishlist',
                        DB_PREFIX . 'customer_ip',

                        DB_PREFIX . 'order',
                        DB_PREFIX . 'order_history',
                        DB_PREFIX . 'order_option',
                        DB_PREFIX . 'order_product',
                        DB_PREFIX . 'order_status',
                        DB_PREFIX . 'order_total',

                        DB_PREFIX . 'product_attribute',
                        DB_PREFIX . 'product_discount',
                        DB_PREFIX . 'product_option_value',
                        DB_PREFIX . 'product_reward',
                        DB_PREFIX . 'product_special',
                        DB_PREFIX . 'product_to_category',
                        DB_PREFIX . 'product_to_store',
                        DB_PREFIX . 'product_to_translate',
                        DB_PREFIX . 'search_word',
                        DB_PREFIX . 'search_word_to_product',
                        DB_PREFIX . 'seo_url',
                        DB_PREFIX . 'session',

                        DB_PREFIX . 'zone',
                        DB_PREFIX . 'zone_to_geo_zone',

                        DB_PREFIX . 'customer_simple_fields',
                        DB_PREFIX . 'novaposhta_warehouses',
                        DB_PREFIX . 'novaposhta_cities',

                        'ocfilter_option_value_to_product_id',

                        DB_PREFIX . 'econt_order',
                        DB_PREFIX . 'econt_city_office',
                        DB_PREFIX . 'econt_city',
                        DB_PREFIX . 'econt_street',
                        DB_PREFIX . 'econt_region',
                        DB_PREFIX . 'isense_gdpr_policy_acceptances',
                        DB_PREFIX . 'url_404',
                    );

                    $table = $result['Tables_in_' . DB_DATABASE];

                    if (in_array($table, $ignore)) {
                        continue;
                    }

                    $query = $this->db->query("SELECT COUNT(*) AS total FROM `" . $this->db->escape($table) . "`");
                    $total_rows = $query->row['total'];

                    $query = $this->db->query("SHOW COLUMNS FROM `" . $this->db->escape($table) . "`");
                    $column_id = $query->row['Field'];

                    $return[] = array(
                        'name' => $table,
                        'total_rows' => $total_rows,
                        'column_id' => $column_id,
                    );
                }
            }
        }

        return $return;
    }

    private function splitDatabaseTables($tables)
    {
        $return = array();

        $max_count = Utils::getPerfomanceValue(5000, $this->config->get('module_timrod_occleaner_performance_database'));

        $part_index = 0;
        $current_count = 0;

        foreach ($tables as $table) {

            if (isset($return[$part_index]) === false) {
                $return[$part_index] = array();
            }

            if ($table['total_rows'] === 0) {
                continue;
            }

            $start = 0;
            $limit = $max_count;

            if ($table['total_rows'] > $max_count) {

                $part_index++;
                $current_count = 0;

                $parts = ceil($table['total_rows'] / $max_count);

                if ($parts <= 2) {

                    $limit = $max_count * 2;

                    $return[$part_index][] = array(
                        'name' => $table['name'],
                        'start' => $start,
                        'limit' => $limit,
                        'total' => $table['total_rows'],
                        'column_id' => $table['column_id']
                    );

                    $part_index++;
                } else {

                    for ($i = 1; $i <= $parts; $i++) {

                        $start = $i > 1 ? (($i - 1) * $max_count) + 1 : 0;
                        $limit = $i > 1 ? (($i - 1) * $max_count) + $max_count : $max_count;

                        $return[$part_index][] = array(
                            'name' => $table['name'],
                            'start' => $start,
                            'limit' => $limit,
                            'total' => $table['total_rows'],
                            'column_id' => $table['column_id']
                        );

                        $part_index++;
                    }
                }
            } else {

                if ($table['total_rows'] + $current_count > $max_count) {
                    $part_index++;
                    $current_count = 0;
                }

                $return[$part_index][] = array(
                    'name' => $table['name'],
                    'start' => $start,
                    'limit' => $limit,
                    'total' => $table['total_rows'],
                    'column_id' => $table['column_id']
                );

                $current_count += $table['total_rows'];
            }
        }

        return $return;
    }

    private function matchPath($string)
    {
        $return = array();

        //$string = str_replace(array("\r\n", "\r", "\n"), '',  $string);
        $string = html_entity_decode($string);
        $string = str_replace('\\', '', $string);

        $ext = implode('|', $this->image_extensions);
        //$attr = 'src=|data-src=|data-lazy=|resize[(]|href=|url[(]';

        $regexp_list = array(
            '/^(?<path>(\S*(\/.*?\/)*)(.*)\.(' . $ext . '))$/iu',
            /*'/(' . $attr . ')(?<path>(\'|")([^"\']*\.(' . $ext . '))(\'|"))/iu',
            '/(?<path>(\'|")(http:\/\/|https:\/\/)(.+?\.(' . $ext . '))(\'|"))/iu'*/
            '/(?<path>\'[^\']{2,}\.(' . $ext . ')\')/iu',
            '/(?<path>"[^"]{2,}\.(' . $ext . ')")/iu'
        );

        foreach ($regexp_list as $regexp) {
            $result = preg_match_all($regexp, $string, $match);

            if ($result && isset($match['path'])) {
                foreach ($match['path'] as $path) {
                    $return[] = $path;
                }
            }
        }

        $server_name = str_replace('www.', '', $this->request->server['SERVER_NAME']);

        foreach ($return as $key => $path) {
            // Decode url chars
            $path = rawurldecode($path);

            // Remove host
            $path = str_replace('www.', '', $path);
            $path = preg_replace('/(.*)((http|https):\/\/)(' . $server_name . ')/i', '', $path);

            // Remove double slashes
            $path = str_replace('//', '/', $path);

            // Remove php tags
            $path = preg_replace('/{{.*}}|<\?.*\?>/i', '', $path);

            // Remove quotes & dots
            $path =  trim($path, '"\'./');

            // lower case extension
            $path = str_replace(array_map('strtoupper', $this->image_extensions), $this->image_extensions, $path);

            // exclude
            if (in_array($path, $this->image_extensions) || preg_match('/file:\/\/|http:\/\/|https:\/\/|(\$[\w]+->)/iu', $path)) {
                unset($return[$key]);
            } else {
                $return[$key] = $path;
            }
        }

        return $return;
    }

    public function deleteAll()
    {
        $return = array('status' => 'next', 'count' => 0, 'size' => '');

        $storage_code = 'tmp_' . $this->task . '_delete_all';

        $size = (int)$this->storage->get($storage_code, 'size');

        $limit = Utils::getPerfomanceValue(500, $this->config->get('module_timrod_occleaner_performance_request'));
        $this->task_storage->filter(['start' => 0, 'limit' => $limit]);
        $result = $this->task_storage->getList();

        if ($result['count_items'] > 0) {
            foreach ($result['list'] as $file) {
                $filename = $file['path'];
                $size += filesize($filename);
                $this->filesystem->remove($filename);
                $this->task_storage->delete($file['id']);
            }

            $this->storage->set($storage_code, 'size', $size);
        } else {
            $this->storage->deleteByCode($storage_code);
            $return['size'] = Utils::formatToSize($size);
            $return['status'] = 'done';
        }

        return $return;
    }
}
