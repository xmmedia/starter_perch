'use strict';
// This is the webpack config used for JS unit tests

const Encore = require('@symfony/webpack-encore');
const encoreConfigure = require('./webpack.base.config');
const webpackCustomize = require('./webpack.customize');

// Initialize Encore before requiring the .config file
Encore.configureRuntimeEnvironment('dev-server');

encoreConfigure(Encore);

const webpack = require('webpack');
const merge = require('webpack-merge');
const ManifestPlugin = require('@symfony/webpack-encore/lib/webpack/webpack-manifest-plugin');
const baseWebpackConfig = Encore.getWebpackConfig();

webpackCustomize(baseWebpackConfig);

const webpackConfig = merge(baseWebpackConfig, {
    // use inline sourcemap for karma-sourcemap-loader
    devtool: '#inline-source-map',
    resolveLoader: {
        alias: {
            // necessary to to make lang="scss" work in test when using vue-loader's ?inject option
            // see discussion at https://github.com/vuejs/vue-loader/issues/724
            'scss-loader': 'sass-loader'
        }
    },
    plugins: [
        new webpack.DefinePlugin({
            'process.env': {
                NODE_ENV: '"testing"'
            }
        })
    ]
});

// no need for app entry during tests
delete webpackConfig.entry;

// Set writeToFileEmit option of the ManifestPlugin to false
for (const plugin of webpackConfig.plugins) {
    if ((plugin instanceof ManifestPlugin) && plugin.opts) {
        plugin.opts.writeToFileEmit = false;
    }
}

module.exports = webpackConfig;