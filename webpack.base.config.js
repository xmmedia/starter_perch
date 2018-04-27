'use strict';
const path = require('path');
const glob = require('glob-all');
const PurgecssPlugin = require('purgecss-webpack-plugin');

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

        // will output as build/admin.js and similar
        .addEntry('public', './html/js/src/public.js')

        // allow sass/scss files to be processed
        .enableSassLoader(function(sassOptions) {}, {
            // see: http://symfony.com/doc/current/frontend/encore/bootstrap.html#importing-bootstrap-sass
            resolveUrlLoader: false
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
        });

    if (Encore.isProduction()) {
        // Custom PurgeCSS extractor for Tailwind that allows special characters in class names
        class TailwindExtractor {
            static extract(content) {
                return content.match(/[A-z0-9-:\/]+/g) || [];
            }
        }

        Encore
            .addPlugin(new PurgecssPlugin({
                // Specify the locations of any files you want to scan for class names.
                paths: glob.sync([
                    path.join(__dirname, 'html/perch/templates/**/*.html'),
                    path.join(__dirname, 'html/perch/templates/**/*.php'),
                    path.join(__dirname, 'html/perch/addons/**/*.html'),
                    path.join(__dirname, 'html/perch/addons/**/*.php'),
                    path.join(__dirname, 'html/js/src/**/*.vue'),
                    path.join(__dirname, 'html/js/src/**/*.js'),
                ]),
                extractors: [
                    {
                        extractor: TailwindExtractor,
                        // Specify the file extensions to include when scanning for class names
                        extensions: ['html', 'js', 'php', 'vue'],
                    }
                ]
            }));
    }
};