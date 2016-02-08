<?php include('lib/common.php'); ?>
<?php include('perch/runtime.php'); ?>
<?php perch_layout('public.head', [
    // @todo-perch
    'title' => 'An Error Occurred: "404 Not Found" | <Comapny Name>',
]); ?>

<body>
    <?php perch_layout('public.header'); ?>

    <div class="main_content">
        <div class="grid">
            <div class="col">
                <h1>Oops! An Error Occurred</h1>

                <h2>The server returned a "404 Not Found".</h2>
                <p>Something is broken. Please let us know what you were doing when this error occurred. We will fix it as soon as possible. Sorry for any inconvenience caused.</p>
            </div>
        </div>
    </div>

    <?php perch_layout('public.footer'); ?>

    <?php perch_layout('public.javascript'); ?>
</body>
</html>