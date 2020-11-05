<?php include('lib/common.php'); ?>
<?php include('perch/runtime.php'); ?>
<?php perch_layout('public.head'); ?>

<body>
    <?php perch_layout('public.ie9_warning'); ?>

    <div id="app">
        <?php perch_layout('public.icons'); ?>
        <?php perch_layout('public.header'); ?>

        <main class="clearfix"></main>

        <?php perch_layout('public.footer'); ?>
    </div>

    <?php perch_layout('public.javascript'); ?>
</body>
</html>
