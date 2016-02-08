<!DOCTYPE html>
<html lang="en" prefix="og: http://ogp.me/ns#">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php perch_layout_var('title'); ?></title>

    <meta property="og:title" content="<?php perch_layout_var('title'); ?>">
    <meta property="og:type"  content="website">
    <meta property="og:url"   content="<?php Common::e($_SERVER['SCRIPT_URI']); ?>">
    <!-- @todo-perch -->
    <meta property="og:site_name" content="<Company Name>">
    <meta property="og:image" content="/images/open_graph.png">

    <?php if (perch_layout_has('meta_desc')) { ?>
        <meta name="description" value="<?php perch_layout_var('meta_desc'); ?>">
        <meta property="og:description" content="<?php perch_layout_var('meta_desc'); ?>">
    <?php } ?>

    <link rel="author" href="/humans.txt">

    <link href="<?php Common::version_file('/css/public.css'); ?>" rel="stylesheet">
</head>