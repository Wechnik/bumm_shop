<?php

namespace Timrod\Occleaner\Analyzer;

use Symfony\Component\Finder\Finder;
use Symfony\Component\Filesystem\Filesystem;
use Timrod\Occleaner\Utils;

class TaskFilesystemJunk extends Task
{
    private $exclude = [];

    public function init()
    {
        $this->finder = new Finder();
        $this->finder->ignoreUnreadableDirs();

        $this->filesystem = new Filesystem();

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
            case 'empty_folders':
                return $this->scanEmptyFolders();
            default:
                return array('status' => 'done',);
        }

        return ['status' => 'done'];
    }

    public function delete(array $list)
    {
        $size = 0;

        foreach ($list as $id) {
            $file = $this->task_storage->get($id);
            $filename = $file ? $file['path'] : false;

            if ($this->filesystem->exists($filename)) {
                $this->filesystem->remove($filename);
                $size += $file['size'];
                $this->task_storage->delete($id);
            }
        }

        return Utils::formatToSize($size);
    }

    private function scanEmptyFolders()
    {
        $folders = array(DIR_APPLICATION, DIR_IMAGE, DIR_CATALOG, DIR_SYSTEM);

        $code = 'tmp_' . $this->task . '_scan';
        $next_step = $this->storage->get($code, 'next_step') ?: 'start';

        // Start
        if ($next_step === 'start') {

            $this->task_storage->clear();
            $this->storage->set($code, 'next_step', 'scan');

            return array(
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
            );
        }

        if ($next_step === 'scan') {

            $part_count = Utils::getPerfomanceValue(10000, $this->config->get('module_timrod_occleaner_performance_filesystem'));
            $last_index = (int)$this->storage->get($code, 'last_index');

            $index = 0;
            $end = (int)($last_index + $part_count);

            foreach ($this->exclude as $exclude) {
                $this->finder->exclude($exclude);
            }

            $this->finder->directories()->in($folders);

            foreach ($this->finder as $dir) {

                if ($index < $last_index) {

                    $index++;
                    continue;

                } elseif ($index >= $last_index && $index < $end) {

                    if ($dir->isReadable()) {

                        $scan = scandir($dir->getRealpath());

                        if (count($scan) == 2 && $scan[0] == '.' && $scan[1] == '..') {

                            $info = array(
                                'filename' => $dir->getFilename(),
                                'path' => $dir->getRealPath(),
                                'size' => $dir->getSize(),
                            );

                            $this->task_storage->add($info);
                        }
                    }

                    $index++;

                } elseif ($index === $end) {

                    $this->storage->set($code, 'last_index', $end);

                    return array(
                        'status' => 'next',
                        'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
                    );
                }

            }

            $this->storage->deleteByCode($code);
            $this->task_storage->updateLastScan();
        }


        return ['status' => 'done'];
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
