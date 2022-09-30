<?php

namespace Timrod\Occleaner;

use Timrod\Occleaner\Analyzer\TaskSystemJunk;
use Timrod\Occleaner\Analyzer\TaskImagesJunk;
use Timrod\Occleaner\Analyzer\TaskFilesystemJunk;
use Timrod\Occleaner\Analyzer\TaskDatabaseJunk;
use Timrod\Occleaner\Analyzer\TaskModuleData;
use Timrod\Occleaner\Engine\Library;

class Analyzer extends Library
{
    /**
     * 
     */
    public function __construct($registry)
    {
        parent::__construct($registry);
    }

    /**
     * 
     */
    public function scan($task)
    {
        set_time_limit(60);
        
        if (Utils::getTaskCategory($task) === 'system_junk') {
            $class = new TaskSystemJunk($this->registry, $task);
            return $class->scan();
        }

        if (Utils::getTaskCategory($task) === 'images_junk') {
            $class = new TaskImagesJunk($this->registry, $task);
            return $class->scan();
        }

        if (Utils::getTaskCategory($task) === 'filesystem_junk') {
            $class = new TaskFilesystemJunk($this->registry, $task);
            return $class->scan();
        }

        if (Utils::getTaskCategory($task) === 'database_junk') {
            $class = new TaskDatabaseJunk($this->registry, $task);
            return $class->scan();
        }

        if ($task === 'module_data') {
            $class = new TaskModuleData($this->registry, $task);
            return $class->scan();
        }
    }

    /**
     * 
     */
    public function delete($task, array $list)
    {
        if (Utils::getTaskCategory($task) === 'system_junk') {
            $class = new TaskSystemJunk($this->registry, $task);
            return $class->delete($list);
        }

        if (Utils::getTaskCategory($task) === 'images_junk') {
            $class = new TaskImagesJunk($this->registry, $task);
            return $class->delete($list);
        }

        if (Utils::getTaskCategory($task) === 'filesystem_junk') {
            $class = new TaskFilesystemJunk($this->registry, $task);
            return $class->delete($list);
        }

        if (Utils::getTaskCategory($task) === 'database_junk') {
            $class = new TaskDatabaseJunk($this->registry, $task);
            return $class->delete($list);
        }

        if ($task === 'module_data') {
            $class = new TaskModuleData($this->registry, $task);
            return $class->delete($list);
        }
    }

    /**
     * Ignore selected data
     * @return integer Count of items added
     */
    public function ignore($task, $list = array())
    {
        $data = new TaskStorage($task, $this->registry);

        $count = 0;

        foreach ($list as $id) {
            if ($data->ignore($id)) {
                $count++;
            }
        }

        return $count;
    }

    /**
     * Remove selected from ignore list
     * @return integer Count of items added
     */
    public function notIgnore($task, $list = array())
    {
        $data = new TaskStorage($task, $this->registry);

        $count = 0;

        foreach ($list as $id) {
            if ($data->notIgnore($id)) {
                $count++;
            }
        }

        return $count;
    }

    /**
     * Delete all items
     * @return array Returns task completion status and cleared size
     */
    public function deleteAll($task)
    {
        if (Utils::getTaskCategory($task) === 'system_junk') {
            $class = new TaskSystemJunk($this->registry, $task);
            return $class->deleteAll();
        }

        if (Utils::getTaskCategory($task) === 'images_junk') {
            $class = new TaskImagesJunk($this->registry, $task);
            return $class->deleteAll();
        }

        if (Utils::getTaskCategory($task) === 'filesystem_junk') {
            $class = new TaskFilesystemJunk($this->registry, $task);
            return $class->deleteAll();
        }

        if (Utils::getTaskCategory($task) === 'database_junk') {
            $class = new TaskDatabaseJunk($this->registry, $task);
            return $class->deleteAll();
        }
    }
}
