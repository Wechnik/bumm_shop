<?php

	header("Content-Type: text/html; charset=utf-8");

	$path = $_SERVER["DOCUMENT_ROOT"];
	$directory = new \RecursiveDirectoryIterator($path);
	$iterator = new \RecursiveIteratorIterator($directory);

	foreach ($iterator as $info) {

		$name_file = substr($info->getfileName(), 0, strrpos($info->getfileName(), "."));

		$name_search = array("optimizer", "www_pandoge_com"); // Список файлов

		foreach($name_search as $key_name) {

			if(preg_match("/".$key_name."/", $name_file)) {
		
				echo $info->getPathname()."<br>";

			}

		}

	}

?>