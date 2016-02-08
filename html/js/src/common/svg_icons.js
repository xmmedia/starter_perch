var svg_icons = {
    load : function(img_path) {
        // load the icons and put them in a hidden div
        $.get(img_path, function(data) {
            var div = document.createElement('div');
            div.style.cssText = 'height: 0; width: 0; position: absolute; visibility: hidden;';
            div.innerHTML = new XMLSerializer().serializeToString(data.documentElement);
            document.body.insertBefore(div, document.body.childNodes[0]);
        });
    }
};