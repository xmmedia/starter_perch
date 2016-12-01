<?php
    // @todo-perch
    define('PERCH_LICENSE_KEY', '');

    define('PERCH_DB_PREFIX', 'perch2_');

    define('PERCH_TZ', 'America/Edmonton');

    define('PERCH_EMAIL_FROM', '<email@example.com>');
    define('PERCH_EMAIL_FROM_NAME', '<Company Name>');

    define('PERCH_LOGINPATH', '/perch');
    define('PERCH_PATH', str_replace(DIRECTORY_SEPARATOR.'config', '', __DIR__));
    define('PERCH_CORE', PERCH_PATH.DIRECTORY_SEPARATOR.'core');

    define('PERCH_RESFILEPATH', PERCH_PATH.DIRECTORY_SEPARATOR.'resources');
    define('PERCH_RESPATH', PERCH_LOGINPATH.'/resources');

    define('PERCH_HTML5', true);
    //define('PERCH_XHTML_MARKUP', false);
    define('PERCH_RWD', false);
    define('PERCH_SSL', true);
    // see https://docs.grabaperch.com/docs/installing-perch/configuration/security/
    define('PERCH_PARANOID', true);

    define('PERCH_SCHEDULE_SECRET', '<secret>');

    define('PERCH_EMAIL_METHOD', 'smtp');
    define('PERCH_EMAIL_HOST', 'smtp.sparkpostmail.com');
    define('PERCH_EMAIL_AUTH', true);
    define('PERCH_EMAIL_SECURE', 'tls');
    define('PERCH_EMAIL_PORT', 587);

    require_once('config_private.php');