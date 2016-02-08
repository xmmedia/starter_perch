<?php

define('HTML_ROOT', realpath(dirname(__FILE__).'/../'));

/**
 * Common methods used throughout the code.
 */
class Common
{
    /**
     * Escapes & echo's the string using htmlspecialchars().
     * The escaped string is immediately echo'd.
     *
     * @param  string $string The string to be escaped.
     *
     * @return void
     */
    public static function escape($string)
    {
        echo htmlspecialchars($string, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    }

    /**
     * Shortcut for Common::escape().
     *
     * @param  string $string The string to be escaped.
     *
     * @return void
     */
    public static function e($string)
    {
        echo self::escape($string);
    }

    /**
     * Versions the file using the format file.version.ext.
     * The file must exist inside the html dir and be readable by PHP.
     * The path is immediately echo'd.
     *
     * @param  string $path The path to the file inside the html dir.
     *
     * @return void
     */
    public static function version_file($path)
    {
        $pathInfo = pathinfo($path);

        if (file_exists(HTML_ROOT.$path)) {
            $mtimeStr = '.'.filemtime(HTML_ROOT.$path);
        } else {
            $mtimeStr = '';
        }

        echo $pathInfo['dirname'].'/'.$pathInfo['filename'].$mtimeStr.'.'.$pathInfo['extension'];
    }
}