// postcss.config.js
const purgecss = require('@fullhuman/postcss-purgecss')({
    // Specify the paths to all of the template files in your project & any other modules containing CSS class names
    content: [
        'html/**/*.php',
        'html/perch/templates/**/*.html',
        'html/perch/templates/**/*.php',
        'html/perch/addons/**/*.html',
        'html/perch/addons/**/*.php',
        'html/js/src/**/*.vue',
        'html/js/src/**/*.js',
        'node_modules/vue-js-modal/dist/index.js',
        // 'node_modules/vue-multiselect/dist/vue-multiselect.min.js',
        'node_modules/flatpickr/dist/flatpickr.js',
    ],

    // Include any special characters you're using in this regular expression
    defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || [],

    whitelistPatterns: [
        // vue transition classes: https://vuejs.org/v2/guide/transitions.html#Transition-Classes
        /-enter/,
        /-leave/,
    ],
});

module.exports = {
    plugins: [
        require('tailwindcss'),
        require('autoprefixer'),
        ...process.env.NODE_ENV === 'production' ? [purgecss] : [],
    ],
    sourceMap : 'prev',
};
