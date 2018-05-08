'use strict';
// This is the webpack config used for running the webpack dev-server
// Requests to the dev server are proxied through Apache

const Encore = require('@symfony/webpack-encore');
const encoreConfigure = require('./webpack.base.config');
const webpackCustomize = require('./webpack.customize');

encoreConfigure(Encore);

// Tweak the default webpack config a bit for the dev-server
Encore
    .setPublicPath('https://dev.example.com/dev-server')
    .setManifestKeyPrefix('build/')
    .enableVersioning(false);

let config = Encore.getWebpackConfig();

webpackCustomize(config);

module.exports = config;