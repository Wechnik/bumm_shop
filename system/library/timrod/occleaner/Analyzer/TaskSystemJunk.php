<?php

namespace Timrod\Occleaner\Analyzer;

use Symfony\Component\Finder\Finder;
use Symfony\Component\Filesystem\Filesystem;
use Timrod\Occleaner\Utils;

class TaskSystemJunk extends Task
{
    public function init()
    {
        $this->finder = new Finder();
        $this->filesystem = new Filesystem();
    }

    public function  scan()
    {
        $directory = $this->getDirectoryPath($this->task);
        $code = 'tmp_' . $this->task . '_scan';
        $next_step = $this->storage->get($code, 'next_step') ?: 'start';

        if (false === $this->filesystem->exists($directory)) {
            return array('status' => 'done');
        }

        if ($next_step === 'start') {

            $this->storage->set($code, 'next_step', 'get_files');
            $this->storage->set($code, 'last_index', 1);
            $this->task_storage->clear();

            return array(
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
            );
        }

        if ($next_step === 'get_files') {

            $this->finder->files()->in($directory)->notName('index.html');
            $part_count = Utils::getPerfomanceValue(10000, $this->config->get('module_timrod_occleaner_performance_filesystem'));
            $last_index = (int)$this->storage->get($code, 'last_index');

            $index = 1;
            $end = (int)($last_index + $part_count);

            foreach ($this->finder as $file) {

                if ($index < $last_index) {

                    $index++;
                    continue;

                } elseif ($index >= $last_index && $index < $end) {

                    $path = $file->isLink() ? $file->getPathname() : $file->getRealPath();

                    $info = array(
                        'filename' => $file->getFilename(),
                        'path' => $path,
                        'size' => $file->getSize(),
                        'sort' => $index
                    );

                    $this->task_storage->add($info);
                    
                    $index++;

                } elseif ($index === $end) {

                    $this->storage->set($code, 'last_index', $end);

                    return array(
                        'status' => 'next',
                        'text_next_step' => $this->language->get('text_step_filesystem_analysis'),
                    );
                }
            }

            $this->storage->set($code, 'next_step', 'done');
            $this->task_storage->updateLastScan();

            return array(
                'status' => 'next',
                'text_next_step' => $this->language->get('text_step_clearing_temporary_data'),
            );

        }

        if ($next_step === 'done') {

            $this->storage->deleteByCode($code);

            return array(
                'status' => 'done',
                'text_next_step' => $this->language->get('text_step_update'),
            );
        }

        return array('status' => 'done',);
    }

    private function getDirectoryPath($code)
    {
        switch ($code) {
            case 'log_files':
                return DIR_LOGS;
            case 'system_cache':
                return DIR_CACHE;
            case 'image_cache':
                return DIR_IMAGE . 'cache';
            case 'vqmod_cache':
                return preg_replace("#/$#", "", $this->request->server['DOCUMENT_ROOT']) . DIRECTORY_SEPARATOR . 'vqmod' . DIRECTORY_SEPARATOR . 'vqcache' . DIRECTORY_SEPARATOR;
            default:
                return false;
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
