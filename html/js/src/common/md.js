$(function() {
    // modal dialogs/tooltips
    $('.js-md-close').on('click', function(e) {
        e.preventDefault();
        md.close();
    });
    $('.js-md-overlay').on('click', function() {
        md.close();
    });
});

var md = {
    get_md : function() {
        return $('.js-md-modal');
    },
    open : function() {
        admin_md.get_md().addClass('md-modal-show');

        admin_md.add_scroll();

        $(document).one('keyup', function(e) {
            if (e.keyCode == 27) {
                admin_md.close();
            }
        });
        $(window).on('resize', function() {
            if (this.md_resize) clearTimeout(this.md_resize);
            this.md_resize = setTimeout(function() {
                admin_md.add_scroll();
            }, 500);
        });
    },
    close : function() {
        admin_md.get_md().removeClass('md-modal-show md-scroll')
            .find('.js-md-content_wrap').html('');
    },
    add_scroll : function() {
        var md = admin_md.get_md();
        if ($('.js-md-content_wrap').height() > md.height()) {
            md.addClass('md-modal-scroll');
        } else {
            md.removeClass('md-modal-scroll');
        }
    }
};