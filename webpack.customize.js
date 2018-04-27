'use strict';
const path = require('path');

function resolve (dir) {
    return path.join(__dirname, '.', dir);
}

// Tweak the webpack config output of Encore
// Use as a common place for customizations that apply to all webpack envs.
module.exports = function (config) {
    config.resolve.alias['vue$'] = 'vue/dist/vue.common.js';
    config.resolve.alias['@'] = resolve('html/js/src');

    // See: https://github.com/symfony/webpack-encore/blob/master/lib/config-generator.js#L223
    // See: https://webpack.js.org/configuration/stats/
    config.stats.assets = true;
    config.stats.source = true;
};