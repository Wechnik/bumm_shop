<?php

namespace Timrod\Occleaner\Logging;

class Logging
{
    private $filename;

    /**
     * 
     */
    public function __construct($filename)
    {
        $this->filename = DIR_LOGS . DIRECTORY_SEPARATOR . $filename . '.log';
    }

    /**
     * 
     */
    public function write($string)
    {
        $date = new \DateTime();
        $date->setTimestamp(time());
        $time = $date->format('Y-m-d H:i:s');
        $string = sprintf('%s - %s' . PHP_EOL, $time, $string);

        return file_put_contents($this->filename, $string, FILE_APPEND);
    }
}
