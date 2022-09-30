<?php

namespace Timrod\Occleaner;

use Timrod\Occleaner\Cache\File;

class Storage
{
    private $adaptor;

    /**
     * 
     */
    public function __construct()
    {
        if (VERSION < '3.0.0.0') {
            $this->adaptor = new File(DIR_SYSTEM . 'storage/timrod_occleaner', ['encode_key' => false]);
        } else {
            $this->adaptor = new File(DIR_STORAGE . 'timrod_occleaner', ['encode_key' => false]);
        }
        
    }

    /**
     * 
     */
    public function get($key)
    {
        return $this->adaptor->get($key);
    }

    /**
     * 
     */
    public function set($key, $data = array())
    {
        return $this->adaptor->set($key, $data);
    }

    /**
     * 
     */
    public function delete($key)
    {
        return $this->adaptor->delete($key);
    }
}
