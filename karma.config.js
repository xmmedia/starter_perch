const webpackConfig = require('./webpack.test.config');

module.exports = function(config) {
    config.set({
        frameworks: ['mocha', 'chai'],
        basePath: 'html/js/tests',
        files: ['index.js'],
        preprocessors: {
            'index.js': ['webpack', 'sourcemap']
        },
        reporters: ['progress', 'spec'], // , 'coverage'
        port: 9876,  // karma web server port
        colors: true,
        logLevel: config.LOG_INFO,
        browsers: ['ChromeHeadless'],
        autoWatch: false,
        // singleRun: false, // Karma captures browsers, runs the tests and exits
        concurrency: Infinity,
        webpack: webpackConfig,
        webpackMiddleware: {
            noInfo: true
        },
        client: {
            captureConsole: true,
            mocha: {
                bail: true
            }
        }
        // coverageReporter: {
        //     dir: './coverage',
        //     reporters: [
        //         { type: 'lcov', subdir: '.' },
        //         { type: 'text-summary' }
        //     ]
        // }
    });
};