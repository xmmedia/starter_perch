var Encore = require('@symfony/webpack-encore');

Encore
// directory where all compiled assets will be stored
    .setOutputPath('html/build/')

    // what's the public path to this directory (relative to your project's document root dir)
    .setPublicPath('/build')

    // empty the outputPath dir before each build
    .cleanupOutputBeforeBuild()

    // will output as build/admin.js and similar
    .addEntry('public', './html/js/src/public.js')

    // allow sass/scss files to be processed
    .enableSassLoader(function(sassOptions) {}, {
        // see: http://symfony.com/doc/current/frontend/encore/bootstrap.html#importing-bootstrap-sass
        resolve_url_loader: false
    })
    .enablePostCssLoader()
    // allow .vue files to be processed
    .enableVueLoader()

    .enableSourceMaps(true)

    // create hashed filenames (e.g. public.abc123.css)
    .enableVersioning()
;

// export the final configuration
let config = Encore.getWebpackConfig();

config.resolve.alias['vue$'] = 'vue/dist/vue.common.js';

if (Encore.isProduction()) {
    config.devtool = 'source-map';
}

module.exports = config;
