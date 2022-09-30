<?php

namespace Timrod\Occleaner\Analyzer;

use Timrod\Occleaner\Storage\Database\Data;
use Timrod\Occleaner\Storage\Database\DataList;
use Timrod\Occleaner\TaskStorage;
use Timrod\Occleaner\Engine\Library;
use Timrod\Occleaner\Debuger;

class Task extends Library
{
    /**
     *
     */
    public function __construct($registry, $task)
    {
        parent::__construct($registry);
        $this->task = $task;

        $this->task_storage = new TaskStorage($this->task, $this->registry);

        $this->storage = new Data($registry);
        $this->storage_list = new DataList($registry);

        $this->debug = new Debuger('timrod_occleaner');
        $this->debug->setDebugMode($this->config->get('module_timrod_occleaner_debug_mode'));

        $this->init();
    }

    /**
     *
     */
    public function init()
    {
    }

    /**
     *
     */
    public function scan()
    {
    }

    /**
     *
     */
    public function delete(array $list)
    {
    }

    /**
     *
     */
    public function fastClean()
    {
    }
}
