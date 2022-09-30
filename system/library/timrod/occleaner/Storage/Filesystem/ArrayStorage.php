<?php

namespace Timrod\Occleaner\Storage\Filesystem;

class ArrayStorage implements \IteratorAggregate
{
    private $name;
    private $map;
    private $slice_number;
    private $length;
    private $storage;
    private $loaded;

    private $start = 0;
    private $limit = 0;

    /**
     *
     */
    public function __construct($name, $directory, $options = array())
    {
        $this->name = $name;
        $this->name_map = $name . '.map';
        $this->directory = $directory;
        $this->storage = new FileJson($directory, $options);
        $this->length = 10000;
        $this->loaded = false;
        $this->initMap();
    }

    /**
     *
     */
    public function getArray()
    {
        $array = array();
        foreach ($this->map as $n => $part) {
            foreach ($this->storage->get($this->getSliceName($n)) as $key => $value) {
                $array[] = $value;
            }
        }

        return $array;
    }

    /**
     *
     */
    public function count()
    {
        $count = 0;
        foreach ($this->map as $n => $length) {
            $count += $length;
        }
        return $count;
    }

    /**
     *
     */
    public function range($start, $limit)
    {
        $this->start = $start > 0 && $start < $limit ? $start : 0;
        $this->limit = $limit > $start ? $limit : 0;
    }

    /**
     *
     */
    public function get($index)
    {
        foreach ($this->generator() as $i => $value) {
            if ($i === $index) {
                return $value;
            }
        }

        return false;
    }

    /**
     *
     */
    public function has($index)
    {
        foreach ($this->generator() as $i => $value) {
            if ($i === $index) {
                return true;
            }
        }

        return false;
    }

    /**
     *
     */
    public function push($value)
    {
        $this->load();

        $this->data[] = $value;

        if (count($this->data) === $this->length) {
            $this->dump();
        }
    }

    /**
     *
     */
    public function delete($indexes)
    {
        $delete = $this->toArray($indexes);
        $index = 0;
        foreach ($this->map as $slice_number => $length) {
            $slice = $this->storage->get($this->getSliceName($slice_number));

            $dump = false;
            foreach ($slice as $key => $value) {
                if (in_array($index, $delete)) {
                    unset($slice[$key]);
                    $this->map[$slice_number]--;
                    $dump = true;
                }
                $index++;
            }

            if ($dump) {
                $this->storage->set($this->getSliceName($slice_number), $slice);
                $this->storage->set($this->name_map, $this->map);
            }
        }
    }

    /**
     *
     */
    public function clear()
    {
        $list = $this->storage->glob($this->name . '.slice-*');

        foreach ($list as $name) {
            $this->storage->delete($name);
        }

        $this->storage->delete($this->name_map);
        $this->initMap();
    }

    /**
     *
     */
    public function save()
    {
        $this->dump();
    }

    /**
     *
     */
    public function sort()
    {
        $this->unload();

        foreach ($this->map as $slice_number => $length) {
            $slice = $this->storage->get($this->getSliceName($slice_number));
            $this->storage->set(sprintf('%s.tmp-%s', $this->name, $slice_number), $slice);
            $this->storage->delete($this->getSliceName($slice_number));
        }

        $this->clear();
        $this->initMap();

        $slice_tmp_list = $this->storage->glob($this->name . '.tmp-*');

        foreach ($slice_tmp_list as $name) {
            $slice = $this->storage->get($name);
            foreach ($slice as $key => $value) {
                $this->push($value);
            }

            $this->storage->delete($name);
        }

        $this->dump();
    }

    /**
     *
     */
    public function getIterator()
    {
        if ($this->limit > 0 && $this->limit > $this->start) {
            return $this->generatorRange();
        }

        return $this->generator();
    }

    /**
     *
     */
    private function initMap()
    {
        $this->map = $this->storage->get($this->name_map) ?: array();
    }

    /**
     *
     */
    private function load()
    {
        if ($this->loaded === false) {
            $map = $this->map;
            $count_map = count($map);

            if ($count_map > 0) {
                $last = array_pop($map);

                if ($last < $this->length) {
                    $this->slice_number = $count_map;
                    $this->data = $this->storage->get($this->getSliceName($count_map));
                } else {
                    $this->slice_number = $count_map + 1;
                    $this->data = array();
                }
            } else {
                $this->slice_number = 1;
                $this->data = array();
            }

            $this->loaded = true;
        }
    }

    /**
     *
     */
    private function unload()
    {
        $this->data = array();
        $this->slice_number = 0;
        $this->loaded = false;
    }

    /**
     *
     */
    private function getSliceName($slice = -1)
    {
        $slice = $slice === -1 ? $this->slice_number : $slice;
        return sprintf('%s.slice-%s', $this->name, $slice);
    }

    /**
     *
     */
    private function dump()
    {
        if ($this->data) {
            $this->map[$this->slice_number] = count($this->data);
            $this->storage->set($this->name_map, $this->map);
            $this->storage->set($this->getSliceName(), $this->data);
            $this->slice_number++;
            $this->data = array();
        }
    }

    /**
     *
     */
    private function generator()
    {
        $this->unload();

        foreach ($this->map as $slice_number => $length) {
            $slice = $this->storage->get($this->getSliceName($slice_number));
            do {
                yield key($slice) => current($slice);
            } while (next($slice));
        }
    }

    private function generatorRange()
    {
        $this->unload();

        $index = 0;
        $start = $this->start;
        $end = $this->start + $this->limit;

        foreach ($this->map as $slice_number => $length) {
            $slice = $this->storage->get($this->getSliceName($slice_number));
            do {
                if ($index >= $start) {
                    yield key($slice) => current($slice);
                }
                $index++;
            } while (next($slice) && $index < $end);
        }
    }

    /**
     *
     */
    private function toArray($value)
    {
        return \is_array($value) ? $value : [$value];
    }
}
