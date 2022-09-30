<?php

namespace Timrod\Occleaner;

use Symfony\Component\Stopwatch\Stopwatch;
use Timrod\Occleaner\Logging\Logging;

class Debuger
{
    private $debug_mode = 0;
    private $stopwatch;

    public function __construct($filename)
    {
        $this->filename = DIR_LOGS . DIRECTORY_SEPARATOR . $filename . '.log';
        $this->stopwatch = new Stopwatch();
        $this->log = new Logging('timrod_occleaner');
    }

    /**
     * 
     */
    public function setDebugMode($debug_mode)
    {
        $this->debug_mode = $debug_mode;
    }

    /**
     * 
     */
    public function startSW($name, $category = null)
    {
        if ($this->debug_mode) {
            $this->stopwatch->start($name, $category);
        }

        return $this;
    }

    /**
     * 
     */
    public function stopSW($name, $data = array())
    {
        if ($this->debug_mode) {
            $stopwatch = $this->stopwatch->stop($name);
            $string = sprintf('[Stopwatch] %s | %s', implode(' | ', $data), (string)$stopwatch);
            $this->log->write($string);
        }

        return $this;
    }

    /**
     * 
     */
    public function write($string)
    {
        return $this->log->write($string);
    }
}
