<?php
class ControllerOtaupdaterAndroid extends Controller {
	public function index()
    {

        $file_name = $this->request->get['product'] . '.content';
        $get_version_date = $this->request->get['version'];

        if(file_exists (DIR_OTAUDATER . $file_name))
        {
            $file = file_get_contents(DIR_OTAUDATER . $file_name);

            $OtaPackageVersion = str_replace('OtaPackageVersion=', '', mb_substr (stristr($file, 'OtaPackageVersion='), 0 , 28));

            $file_version_date = strtotime(str_replace('.', '-', $OtaPackageVersion ));
            $get_version_date = strtotime(str_replace('.', '-', $get_version_date ));

            if($file_version_date < $get_version_date)
            {

                $this->file_force_download(DIR_OTAUDATER . $file_name);
            }
        }


    }

    private function file_force_download($file) {
        if (file_exists($file)) {
            // сбрасываем буфер вывода PHP, чтобы избежать переполнения памяти выделенной под скрипт
            // если этого не сделать файл будет читаться в память полностью!
            if (ob_get_level()) {
                ob_end_clean();
            }
            // заставляем браузер показать окно сохранения файла
            header('Content-Description: File Transfer');
            header('Content-Type: application/octet-stream');
            header('Content-Disposition: attachment; filename=' . basename($file));
            header('Content-Transfer-Encoding: binary');
            header('Expires: 0');
            header('Cache-Control: must-revalidate');
            header('Pragma: public');
            header('Content-Length: ' . filesize($file));
            // читаем файл и отправляем его пользователю
            if ($fd = fopen($file, 'rb')) {
                while (!feof($fd)) {
                    print fread($fd, 1024);
                }
                fclose($fd);
            }
            exit;
        }
    }

}
