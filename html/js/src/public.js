import Vue from 'vue';

import svg_icons from './common/svg_icons.vue';

// SASS/CSS
import '../../css/sass/public.scss';

new Vue({
    el: '#app',
    components: {
        'svg-icons': svg_icons,
    }
});