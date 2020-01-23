'use strict';
const path = require('path');
const BundleAnalyzerPlugin = require('webpack-bundle-analyzer').BundleAnalyzerPlugin;

function resolve (dir) {
    return path.join(__dirname, '.', dir);
}

// Base configuration of Encore/Webpack
module.exports = function (Encore) {
    Encore
    // directory where all compiled assets will be stored
        .setOutputPath('html/build/')

        // what's the public path to this directory (relative to your project's document root dir)
        .setPublicPath('/build')

        // always create hashed filenames (e.g. public.a1b2c3.css)
        .enableVersioning(true)

        // empty the outputPath dir before each build
        .cleanupOutputBeforeBuild()

        // don't output the runtime chunk as we only include 1 JS file per page
        .disableSingleRuntimeChunk()

        // will output as build/admin.js and similar
        .addEntry('public', './html/js/src/public.js')

        // allow sass/scss files to be processed
        .enableSassLoader(function(sassOptions) {}, {
            // see: http://symfony.com/doc/current/frontend/encore/bootstrap.html#importing-bootstrap-sass
            resolveUrlLoader: false,
        })
        .enablePostCssLoader()
        // allow .vue files to be processed
        .enableVueLoader()

        .enableSourceMaps(true)

        .addLoader({
            test: /\.svg$/,
            use: [
                {
                    loader: 'svgo-loader',
                    options: {
                        plugins: [
                            // config targeted at icon files, but should work for others
                            { removeUselessDefs: false },
                            { cleanupIDs: false },
                        ],
                    },
                },
            ],
        })

        .addAliases({
            '@': resolve('html/js/src'),
            'vue$': 'vue/dist/vue.esm.js',
        })

        // this is because the main chunk doesn't get a different hash even though a referenced chunk has a different hash
        // JS chunks, images and fonts will use a global hash
        // CSS will use their content hash
        // see: https://medium.com/webpack/predictable-long-term-caching-with-webpack-d3eee1d3fa31
        // & https://github.com/webpack/webpack/issues/4253
        // & https://github.com/erm0l0v/webpack-md5-hash/issues/9
        // & https://github.com/ctrlplusb/react-async-component/issues/57
        // & many others
        .configureFilenames({
            js: '[name].[hash:8].js',
            css: '[name].[contenthash:8].css',
            images: 'images/[name].[hash:8].[ext]',
            fonts: 'fonts/[name].[hash:8].[ext]',
        })

        .addPlugin(new BundleAnalyzerPlugin({
            analyzerMode: 'static',
            openAnalyzer: false,
        }))
    ;

    if (Encore.isProduction()) {
        Encore
    }
};
