<?php include('lib/common.php'); ?>
<?php include('perch/runtime.php'); ?>
<?php perch_layout('public.head', [
    // @todo-perch
    'title' => '<Company Name>',
    'meta_desc' => 'About the company...',
]); ?>

<body>
	<?php perch_layout('public.ie8_warning'); ?>

    <div id="app">
        <?php perch_layout('public.icons'); ?>
        <?php perch_layout('public.header'); ?>

        <?php perch_layout('public.footer'); ?>
    </div>

    <?php perch_layout('public.javascript'); ?>
</body>
</html>