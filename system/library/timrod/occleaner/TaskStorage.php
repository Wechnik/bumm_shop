<?php

namespace Timrod\Occleaner;

class TaskStorage
{
	private $adaptor;

	public function __construct($taskName, $registry)
	{
		switch (Utils::getTaskCategory($taskName)) {
            case 'system_junk':
            case 'images_junk':
            case 'filesystem_junk':
                $adaptor = 'Filesystem';
				break;
			case 'database_junk':
                if ($taskName === 'expired_sessions') {
                    $adaptor = 'DatabaseLive';
                } else {
                    $adaptor = 'Database';
                }
				break;
            case 'module_data':
            default:
                return false;
		}		
		
		$class = 'Timrod\\Occleaner\\Storage\\Database\\Task' . $adaptor;

		if (class_exists($class)) {
			$this->adaptor = new $class($taskName, $registry);
			$this->db = $registry->get('db');
		} else {
			throw new \Exception('Error: Could not load "TaskStorage" adaptor ' . $adaptor . ' !');
		}
	}

	public function filter($data)
	{
		return $this->adaptor->filter($data);
	}

	public function add($data)
	{
		return $this->adaptor->add($data);
	}

	public function delete($id)
	{
		return $this->adaptor->delete($id);
	}

	public function clear()
	{
		return $this->adaptor->clear();
	}

	public function ignore($id)
	{
		return $this->adaptor->ignore($id);
	}

	public function notIgnore($id)
	{
		return $this->adaptor->notIgnore($id);
	}

	public function get($id)
	{
		return $this->adaptor->get($id);
	}

	public function getList()
	{
		return $this->adaptor->getList();
	}

	public function getTotal()
	{
		return $this->adaptor->getTotal();
	}

	public function getLastScan()
	{
		return $this->adaptor->getLastScan();
	}

	public function updateLastScan()
	{
		return $this->adaptor->updateLastScan();
	}
}
