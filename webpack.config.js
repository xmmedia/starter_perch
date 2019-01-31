'use strict';
// This is for dev, watch and build (production)
const Encore = require('@symfony/webpack-encore');
const encoreConfigure = require('./webpack.base.config');
const WorkboxPlugin = require('workbox-webpack-plugin');
const merge = require('webpack-merge');

encoreConfigure(Encore);

if (Encore.isProduction()) {
    Encore.addPlugin(new WorkboxPlugin.GenerateSW({
        swDest: '../service-worker.js',
        importWorkboxFrom: 'local',
        chunks: ['public', 'admin'],
        // these options encourage the ServiceWorkers to get in there fast
        // and not allow any straggling "old" SWs to hang around
        clientsClaim: true,
        skipWaiting: true,
        maximumFileSizeToCacheInBytes: 20 * 1024 * 1024, // 20mb

        // chunk name is not used because these are refreshed
        // every time the service worker script is updated
        importScripts: ['/js/src/service_worker_import.js'],

        runtimeCaching: [
            {
                urlPattern: /()/,
                handler: 'networkFirst',
                options: {
                    cacheName: 'pages',
                },
            },
            {
                urlPattern: /\.(?:js|css|svg)$/,
                handler: 'networkFirst',
                options: {
                    cacheName: 'static-resources',
                },
            },
            // page to show if offline
            // {
            //     urlPattern: /(.*)/,
            //     // based on: https://github.com/GoogleChrome/workbox/issues/757#issuecomment-326672407
            //     handler: ({url, event, params}) => {
            //         return fetch(event.request)
            //             .catch((error) => {
            //                 if (event.request.mode === 'navigate') {
            //                     return caches.match('/offline');
            //                 }
            //
            //                 return error;
            //             });
            //     },
            // },
        ],
    }));
}

let config = merge(Encore.getWebpackConfig(), require('./webpack.customize'));

if (Encore.isProduction()) {
    config.devtool = 'source-map';
}

module.exports = config;
