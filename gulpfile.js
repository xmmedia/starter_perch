var gulp = require('gulp'),
    concat = require('gulp-concat-sourcemap'),
    uglify = require('gulp-uglify'),
    sass = require('gulp-sass'),
    sourcemaps = require('gulp-sourcemaps'),
    autoprefixer = require('gulp-autoprefixer'),
    base64 = require('gulp-base64'),
    svgmin = require('gulp-svgmin'),
    size = require('gulp-size'),
    colors = require('colors'),
    argv = require('yargs').argv,
    rename = require('gulp-rename'),
    gutil = require('gulp-util'),
    webpack = require('webpack'),
    merge = require('merge-stream');

var firstRun = true,
    webpackConfig = require('./webpack.config'),
    stylesConfig;

if (argv.dev) {
    // note: this produces very large JS files on dev
    webpackConfig.devtool = 'eval-inline-source-map';
    // webpackConfig.debug = true;

} else {
    webpackConfig.plugins.unshift(
        new webpack.DefinePlugin({
            'process.env': {
                // This has effect on the lib size
                'NODE_ENV': JSON.stringify('production')
            }
        }),
        new webpack.optimize.DedupePlugin()
    );
}

// SCSS/CSS/style settings
stylesConfig = [
    {
        src : 'html/css/sass/*.scss',
        dest : 'html/css',
        options : {
            outputStyle : 'compressed'
        }
    }
];

// Webpack/scripts
gulp.task('webpack', function(callback) {
    return webpack(webpackConfig, function(err, stats) {
        if(err) throw new gutil.PluginError('webpack:build', err);

        gutil.log('[webpack]', stats.toString({
            colors: true
        }));

        if (firstRun) {
            firstRun = false;
            callback();
        }
    });
});

// Styles
gulp.task('styles', function() {
    var stream = new merge();

    var style;
    for (var key in stylesConfig) {
        style = stylesConfig[key];

        stream.add(gulp.src(style.src)
            .pipe(sourcemaps.init())
            .pipe(sass(style.options))
            .on('error', function (err) {
                console.log('   ' + 'SASS ERROR'.underline.red);
                console.log('   ' + err.message.underline.red);
            })
            .pipe(autoprefixer())
            .on('error', function (err) {
                console.log('   ' + 'Autoprefixer ERROR'.underline.red);
                console.log('   ' + err.message.underline.red);
            })
            .pipe(sourcemaps.write('.'))
            // inline any files with extensions: svg#datauri, png#datauri, or jpg#datauri
            .pipe(base64({
                baseDir : 'html',
                extensions : [
                    /\.svg#datauri$/i,
                    /\.png#datauri$/i,
                    /\.jpg#datauri$/i
                ],
                maxImageSize : 8*1024 // bytes
            }))
            .on('error', function (err) {
                console.log('   ' + 'Base64 ERROR'.underline.red);
                console.log('   ' + err.message.underline.red);
            })
            .pipe(size({
                showFiles: true
            }))
            .pipe(gulp.dest(style.dest)));
    }

    return stream;
});

// SVGs
gulp.task('svgs', function() {
    return gulp.src('html/images/**/*.svg')
        .pipe(svgmin())
        .pipe(gulp.dest('html/images'));
});

// copy files into place as needed
// gulp.task('copyfiles', function() {
//     var stream = new merge();
//
//     Flatpickr
//     stream.add(gulp.src('./node_modules/flatpickr/dist/flatpickr.min.css')
//         .pipe(rename('flatpickr.scss'))
//         .pipe(gulp.dest('./html/css/sass/lib/flatpickr')));
//
//     return stream;
// });

// Rerun the task when a file changes
gulp.task('watch', function() {
    // set webpack to watch
    webpackConfig.watch = true;
    gulp.start('webpack');

    // watch everything in the sass dirs & sub dirs with extension .scss, but exclude the lib dir
    gulp.watch(['html/css/sass/**/*.scss', '!html/css/sass/lib/**/*.scss'], ['styles']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['webpack', 'styles']);