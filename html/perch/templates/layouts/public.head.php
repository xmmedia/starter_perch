<?php


// setup some default page perch vars/attributes
$domain        = 'https://'.$_SERVER["HTTP_HOST"];
$url           = $domain.$_SERVER["REQUEST_URI"];
// @todo-perch
$site_name     = '<Company Name>';
$twitter_name  = '';
$og_image_default = '/images/open_graph.png';

PerchSystem::set_var('domain', $domain);
PerchSystem::set_var('url', $url);
PerchSystem::set_var('site_name', $site_name);
PerchSystem::set_var('og_image_default', $og_image_default);
PerchSystem::set_var('twitter_name', $twitter_name);

?>
<!DOCTYPE html>
<html lang="en" prefix="og: http://ogp.me/ns#">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php perch_layout_var('title'); ?></title>

    <?php perch_page_attributes(); ?>

    <link rel="author" href="/humans.txt">

    <link href="<?php Common::version_file('/css/public.css'); ?>" rel="stylesheet">
</head>