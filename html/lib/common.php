<?php

define('HTML_ROOT', realpath(dirname(__FILE__).'/../'));

/**
 * Common methods used throughout the code.
 */
class Common
{
    /**
     * @var array
     */
    public static $manifestData;

    /**
     * Escapes & echo's the string using htmlspecialchars().
     * The escaped string is immediately echo'd.
     *
     * @param  string $string The string to be escaped.
     */
    public static function escape($string)
    {
        echo htmlspecialchars($string, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
    }

    /**
     * Shortcut for Common::escape().
     *
     * @param  string $string The string to be escaped.
     */
    public static function e($string)
    {
        echo self::escape($string);
    }

    /**
     * Versions the file based on the manifest.json file.
     * The manifest must be at HTML_ROOT/build/manifest.json.
     * If the file isn't found in the manifest, the original path will be returned.
     *
     * @param  string $path The path to the file inside the html dir.
     */
    public static function version_file($path)
    {
        if (null === self::$manifestData) {
            $manifestFile = HTML_ROOT.'/build/manifest.json';

            self::$manifestData = json_decode(file_get_contents($manifestFile), true);
            if (0 < json_last_error()) {
                throw new \RuntimeException(sprintf('Error parsing JSON from asset manifest file "%s" - %s', $manifestFile, json_last_error_msg()));
            }
        }

        echo isset(self::$manifestData[$path]) ? self::$manifestData[$path] : $path;
    }
}