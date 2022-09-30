<?php

namespace Timrod\Occleaner\Storage\Filesystem;

use Symfony\Component\Filesystem\Filesystem;

class FileJson
{
    private $directory;
    private $options;
    private $json_encode_flags = JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES;

    /**
     * 
     */
    public function __construct($directory, $options = array())
    {
        $this->directory = rtrim($directory, DIRECTORY_SEPARATOR);
        $this->setOptions($options);

        $this->filesystem = new Filesystem();
        $this->filesystem->mkdir($this->directory);
    }

    /**
     * 
     */
    public function get($key)
    {
        $filename = $this->makeFilename($key);

        if (file_exists($filename)) {

            $content = file_get_contents($filename);

            if ($data = json_decode($content, true)) {
                return $data;
            }
        }

        return false;
    }

    /**
     * 
     */
    public function has($key)
    {
        return $this->filesystem->exists($this->makeFilename($key));
    }

    /**
     * 
     */
    public function set($key, $data)
    {
        $filename = $this->makeFilename($key);

        if ($data = json_encode($data, $this->json_encode_flags)) {
            $this->filesystem->remove($filename);
            file_put_contents($filename, $data);
        }
    }

    /**
     * 
     */
    public function delete($key)
    {
        $filename = $this->makeFilename($key);
        $this->filesystem->remove($filename);
    }

    /**
     * 
     */
    public function glob($pattern)
    {
        $result = array();

        $files = glob($this->directory . DIRECTORY_SEPARATOR . $pattern);

        foreach ($files as $file) {
            $result[] = pathinfo($file, PATHINFO_FILENAME);
        }

        return $result;
    }

    /**
     * 
     */
    private function setOptions($options)
    {
        $this->options = array(
            'encode_filename' => isset($options['encode_filename']) ? boolval($options['encode_filename']) : false,
            'json_pretty_print' => isset($options['json_pretty_print']) ? boolval($options['json_pretty_print']) : true,
            'json_numeric_check' => isset($options['json_numeric_check']) ? boolval($options['json_numeric_check']) : true,
        );

        if ($this->options['json_pretty_print']) {
            $this->json_encode_flags |= JSON_PRETTY_PRINT;
        }

        if ($this->options['json_numeric_check']) {
            $this->json_encode_flags |= JSON_NUMERIC_CHECK;
        }
    }

    /**
     * 
     */
    private function makeFilename($key)
    {
        if ($this->options['encode_filename']) {
            $key = md5($key);
        }

        return $this->directory . DIRECTORY_SEPARATOR . $key . '.json';
    }
}
