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
        md.get_md().addClass('md-modal-show');

        md.add_scroll();

        $(document).one('keyup', function(e) {
            if (e.keyCode == 27) {
                md.close();
            }
        });
        $(window).on('resize', function() {
            if (this.md_resize) clearTimeout(this.md_resize);
            this.md_resize = setTimeout(function() {
                md.add_scroll();
            }, 500);
        });
    },
    close : function() {
        md.get_md().removeClass('md-modal-show md-scroll')
            .find('.js-md-content_wrap').html('');
    },
    add_scroll : function() {
        var md_wrap = md.get_md();
        if ($('.js-md-content_wrap').height() > md_wrap.height()) {
            md_wrap.addClass('md-modal-scroll');
        } else {
            md_wrap.removeClass('md-modal-scroll');
        }
    }
};