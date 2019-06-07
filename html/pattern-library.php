<?php include('lib/common.php'); ?>
<?php include('perch/runtime.php'); ?>
<?php perch_layout('public.head'); ?>

<body>
    <?php perch_layout('public.ie9_warning'); ?>

    <div id="app">
        <?php perch_layout('public.icons'); ?>
        <?php perch_layout('public.header'); ?>

        <main class="max-w-11/12 max:max-w-2xl mx-auto clearfix pt-16">
            <!-- ############################# -->
            <!-- ####### Headings ######### -->
            <!-- ############################# -->
            <h2>Headings</h2>
            <h1>Heading 1</h1>
            <h2>Heading 2</h2>
            <h3>Heading 3</h3>
            <h4>Heading 4</h4>
            <h5>Heading 5</h5>
            <h6>Heading 6</h6>

            <!-- ############################# -->
            <!-- ########## Text ############# -->
            <!-- ############################# -->
            <h2>Text</h2>
            <div class="max-w-lg">
                <p>Paragraph text – 16px – Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut aliquet tincidunt urna, ac molestie elit viverra sed. Maecenas rhoncus nisl purus, eget finibus mauris venenatis sit amet. Nunc tincidunt sed magna a tincidunt. Maecenas nunc ex, imperdiet in scelerisque in, sodales vel arcu. Pellentesque fringilla mattis est eget egestas. Mauris eu lorem quis nisl sagittis euismod. Sed ultricies, augue in condimentum venenatis, turpis lectus sagittis elit, vitae porttitor eros eros quis ipsum. Quisque sagittis enim quis nulla pretium, vel accumsan magna ullamcorper. Donec vitae sollicitudin libero.</p>
                <p>Donec facilisis egestas nulla vel condimentum. Praesent quis lectus nec velit rhoncus ultricies ac quis mi. Mauris mattis lacus magna, venenatis faucibus nisi rhoncus non. Aenean ut facilisis nisl. Nam ullamcorper nunc augue, at dignissim neque cursus nec. Nunc ut lorem at tortor malesuada tempus ac sed felis. Mauris egestas leo eget justo vehicula iaculis. Cras rutrum malesuada pulvinar. Fusce porta augue quis feugiat consectetur. Nam pharetra erat eu efficitur placerat. Phasellus non placerat sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
            </div>

            <div class="max-w-sm mx-auto">
                <p>Narrow content... Donec facilisis egestas nulla vel condimentum. Praesent quis lectus nec velit rhoncus ultricies ac quis mi. Mauris mattis lacus magna, venenatis faucibus nisi rhoncus non. Aenean ut facilisis nisl. Nam ullamcorper nunc augue, at dignissim neque cursus nec. Nunc ut lorem at tortor malesuada tempus ac sed felis. Mauris egestas leo eget justo vehicula iaculis. Cras rutrum malesuada pulvinar. Fusce porta augue quis feugiat consectetur. Nam pharetra erat eu efficitur placerat. Phasellus non placerat sapien. Interdum et malesuada fames ac ante ipsum primis in faucibus.</p>
            </div>

            <strong>Bold Text</strong><br>
            <em>Italic Text</em><br>

            <a href="">Link</a><br>
            <a href=""><strong>Bold Link</strong></a><br>

            <!-- ############################# -->
            <!-- ##### Unordered List ######## -->
            <!-- ############################# -->
            <h2>Unordered List</h2>
            <ul>
                <li>List item 1</li>
                <li>List item 2</li>
                <li>List item 3</li>
                <li>List item 4</li>
            </ul>

            <!-- ############################# -->
            <!-- ###### Ordered List ######### -->
            <!-- ############################# -->
            <h2>Ordered List</h2>
            <ol>
                <li>List item 1</li>
                <li>List item 2</li>
                <li>List item 3</li>
                <li>List item 4</li>
            </ol>

            <!-- ############################# -->
            <!-- ######### Buttons ########### -->
            <!-- ############################# -->
            <h2>Buttons</h2>
            <button class="button">Button Button</button>
            <a href="" class="button">Link Button</a>
            <div style="background: grey; margin-top: 1rem; padding: 1rem;">
                <h2>Buttons on Dark Background</h2>
                <button class="button">Button Button</button>
                <a href="" class="button">Link Button</a>
            </div>
        <!-- ############################# -->
        <!-- ########## Forms ############ -->
        <!-- ############################# -->
            <div class="form-wrap">
                <h2 class="-mt-2">Forms</h2>
                <p>Some instructions...</p>
                <form>

                    <div class="field-wrap">
                        <label for="pattern-library-text">Text Field</label>
                        <ul class="field-errors">
                            <li>Error</li>
                        </ul>
                        <input type="text" id="pattern-library-text">
                        <div class="field-help">Use at least 8 characters.</div>
                    </div>

                    <div class="field-wrap field-wrap-readonly">
                        <label for="pattern-library-text">Read-only Field</label>
                        <input type="text" readonly id="pattern-library-text">
                    </div>

                    <div class="sm:flex">
                        <div class="field-wrap w-1/2 mr-2">
                            <label for="pattern-library-full_width-1">First Field</label>
                            <input type="text" id="pattern-library-full_width-1">
                        </div>
                        <div class="field-wrap w-1/2">
                            <label for="pattern-library-full_width-2">Second Field</label>
                            <input type="text" id="pattern-library-full_width-2">
                        </div>
                    </div>

                    <div class="field-wrap">
                        <label for="pattern-library-prefix-suffix">Field with Prefix Beside</label>
                        <span class="mr-2">Prefix Beside</span><input type="text" class="w-auto" id="pattern-library-prefix-suffix"><span class="ml-2">Suffix</span>
                    </div>
                    <div class="field-wrap">
                        <label for="pattern-library-textarea">Text Area</label>
                        <textarea class="h-32" id="pattern-library-textarea"></textarea>
                    </div>
                    <div class="field-wrap">
                        <label for="pattern-library-select">Select</label>
                        <select id="pattern-library-select">
                            <option value="">Test 1</option>
                            <option value="">Test 2</option>
                        </select>
                    </div>
                    <div class="field-wrap-checkbox">
                        <input type="checkbox" id="pattern-library-checkbox" name="pattern-library-checkbox"><label for="pattern-library-checkbox">Checkbox label</label>
                    </div>
                    <fieldset class="field-wrap-radios">
                        <legend>Horizontal Radios</legend>
                        <div class="flex">
                            <span class="field-wrap-radio"><input type="radio" id="pattern-library-radio-01" name="pattern-library-radio-1"><label for="pattern-library-radio-01">Option 1</label></span>
                            <span class="field-wrap-radio"><input type="radio" id="pattern-library-radio-02" name="pattern-library-radio-1"><label for="pattern-library-radio-02">Option 2</label></span>
                            <span class="field-wrap-radio"><input type="radio" id="pattern-library-radio-03" name="pattern-library-radio-1"><label for="pattern-library-radio-03">Option 3</label></span>
                        </div>
                    </fieldset>

                    <fieldset class="field-wrap-radios">
                        <legend>Vertical Radios</legend>
                        <div class="field-wrap-radio">
                            <input type="radio" id="pattern-library-radio-04" name="pattern-library-radio-2"><label for="pattern-library-radio-04">Radio Button</label>
                        </div>
                        <div class="field-wrap-radio">
                            <input type="radio" id="pattern-library-radio-05" name="pattern-library-radio-2"><label for="pattern-library-radio-05">Radio Button</label>
                        </div>
                        <div class="field-wrap-radio">
                            <input type="radio" id="pattern-library-radio-06" name="pattern-library-radio-2"><label for="pattern-library-radio-06">Radio Button</label>
                        </div>
                        <div class="field-help">Some help...</div>
                    </fieldset>

                    <fieldset class="field-wrap-checkboxes">
                        <legend>Multiple Checkboxes</legend>
                        <div class="field-wrap-checkbox">
                            <input type="checkbox" id="pattern-library-checkbox-01" name="pattern-library-checkbox1[]"><label for="pattern-library-checkbox-01">Checkbox</label>
                        </div>
                        <div class="field-wrap-checkbox">
                            <input type="checkbox" id="pattern-library-checkbox-02" name="pattern-library-checkbox1[]"><label for="pattern-library-checkbox-02">Checkbox</label>
                        </div>
                        <div class="field-wrap-checkbox">
                            <input type="checkbox" id="pattern-library-checkbox-03" name="pattern-library-checkbox1[]"><label for="pattern-library-checkbox-03">Checkbox</label>
                        </div>
                        <div class="field-help">Some help...</div>
                    </fieldset>

                    <div class="field-wrap">
                        <label for="pattern-library-two-fields-1">2 Fields Beside Each Other</label>
                        <input type="text" class="w-auto mr-2" id="pattern-library-two-fields-1">
                        <select class="w-auto" id="pattern-library-two-fields-2">
                            <option value="1">January</option>
                            <option value="2">February</option>
                            <option value="3">....</option>
                        </select>
                    </div>

                    <div class="field-wrap">
                        <label for="pattern-library-separator-1">Fields with Separator</label>
                        <div class="flex items-center">
                            <select class="mr-1" id="pattern-library-separator-1">
                                <option>––</option>
                            </select>
                            <div class="mr-1">–</div>
                            <select class="mr-1" id="pattern-library-separator-2">
                                <option>––</option>
                            </select>
                            <div class="mr-1">–</div>
                            <select id="pattern-library-separator-3">
                                <option>––</option>
                            </select>
                        </div>
                    </div>

                    <fieldset class="mt-6 mb-4 p-4 border border-grey-light">
                        <legend>Fieldset with border</legend>
                        <div class="field-wrap">
                            <label for="pattern-library-fieldset-1">Fieldset Field 1</label>
                            <select id="pattern-library-fieldset-1">
                                <option>––</option>
                            </select>
                        </div>

                        <div class="text-right">
                            <a href="" class="form-action">× Remove</a>
                        </div>
                    </fieldset>

                    <div class="mt-6 mb-4 p-4 pt-3 border border-grey-light">
                        <div class="flex leading-none">
                            <h4 class="mt-0 mb-3">Heading</h4>
                            <div class="ml-auto">
                                <a href="" class="form-action">Action</a>
                            </div>
                        </div>

                        <fieldset class="field-wrap-checkboxes mb-0">
                            <legend>Multiple Checkboxes</legend>
                            <div class="field-wrap-checkbox">
                                <input type="checkbox" id="pattern-library-checkbox-04" name="pattern-library-checkbox2[]"><label for="pattern-library-checkbox-04">Checkbox</label>
                            </div>
                            <div class="field-wrap-checkbox">
                                <input type="checkbox" id="pattern-library-checkbox-05" name="pattern-library-checkbox2[]"><label for="pattern-library-checkbox-05">Checkbox</label>
                            </div>
                            <div class="field-wrap-checkbox">
                                <input type="checkbox" id="pattern-library-checkbox-06" name="pattern-library-checkbox2[]"><label for="pattern-library-checkbox-06">Checkbox</label>
                            </div>
                            <div class="field-help">Some help...</div>
                        </fieldset>
                    </div>

                    <div>
                        <button class="button">Primary Button</button>
                        <a href="" class="form-action">Cancel Link</a>
                        <a href="" class="form-action">Go Back</a>
                        <div class="field-help">Form Button Help.</div>
                    </div>

                </form>
            </div>

            <!-- ############################# -->
            <!-- ######### Pagination ############ -->
            <!-- ############################# -->

            <h2>Pagination</h2>

            <!-- ############################# -->
            <!-- ######### Alerts ############ -->
            <!-- ############################# -->

            <h2>Alerts</h2>
            <div class="alert alert-success">
                <div>Success Message!</div>
                <a href="" class="pl-4">×</a>
            </div>
            <div class="alert alert-info">
                <div>Information Message<br>With two lines</div>
                <a href="" class="pl-4">×</a>
            </div>
            <div class="alert alert-warning">
                <div>Warning Message<br>Don't do that</div>
                <a href="" class="pl-4">×</a>
            </div>
            <div class="alert alert-danger">
                <div>Danger Warning – You are going to break something. Donec ullamcorper nulla non metus auctor fringilla. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec ullamcorper nulla non metus auctor fringilla. Donec sed odio dui. Donec ullamcorper nulla non metus auctor fringilla.</div>
                <a href="" class="pl-4">×</a>
            </div>

        </main>

        <?php perch_layout('public.footer'); ?>
    </div>

    <?php perch_layout('public.javascript'); ?>
</body>
</html>
