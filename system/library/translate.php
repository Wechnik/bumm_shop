<?php

class Translate {

    public function getLat($word) {
        $word = (string) $word; // преобразуем в строковое значение
        $word = strip_tags($word); // убираем HTML-теги
        $word = str_replace(array("\n", "\r", " "), "", $word); // убираем перевод каретки
        $word = preg_replace("/\s+/", ' ', $word); // удаляем повторяющие пробелы
        $word = trim($word); // убираем пробелы в начале и конце строки
        $word = function_exists('mb_strtolower') ? mb_strtolower($word) : strtolower($word); // переводим строку в нижний регистр (иногда надо задать локаль)
        $word = strtr($word, array('а'=>'a','б'=>'b','в'=>'v','г'=>'g','д'=>'d','е'=>'e','ё'=>'e','ж'=>'j','з'=>'z','и'=>'i','й'=>'y','к'=>'k','л'=>'l','м'=>'m','н'=>'n','о'=>'o','п'=>'p','р'=>'r','с'=>'s','т'=>'t','у'=>'u','ф'=>'f','х'=>'h','ц'=>'c','ч'=>'ch','ш'=>'sh','щ'=>'shch','ы'=>'y','э'=>'e','ю'=>'yu','я'=>'ya','ъ'=>'','ь'=>''));
        $word = preg_replace("/[^0-9a-z-_ ]/i", "", $word); // очищаем строку от недопустимых символов
        $word = str_replace(array(" ", "-"), "", $word); // заменяем пробелы знаком минус
        return $word; // возвращаем результат
    }

}
