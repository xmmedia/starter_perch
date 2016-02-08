<?php include('lib/common.php'); ?>
<?php include('perch/runtime.php'); ?>
<?php perch_layout('public.head', [
    // @todo-perch
    'title' => '<Comapny Name>',
    'meta_desc' => 'About the company...',
]); ?>

<body>
    <?php perch_layout('public.header'); ?>

    <?php perch_layout('public.footer'); ?>

    <?php perch_layout('public.javascript'); ?>
</body>
</html>