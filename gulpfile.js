var gulp = require('gulp'),
    concat = require('gulp-concat-sourcemap'),
    uglify = require('gulp-uglify'),
    sass = require('gulp-sass'),
    sourcemaps = require('gulp-sourcemaps'),
    autoprefixer = require('gulp-autoprefixer'),
    base64 = require('gulp-base64'),
    svgmin = require('gulp-svgmin'),
    size = require('gulp-size'),
    Q = require('q'),
    colors = require('colors');

// paths & options used within the tasks
var paths = {
    scripts : [
        {
            dest : 'html/js',
            destFile : 'public.min.js',
            files :
                [
                    'html/bower_components/jquery/dist/jquery.js',
                    'html/js/src/common/svg_icons.js',
                    'html/js/src/public.js'
                ],
        }
    ],
    styles : [
        {
            src : 'html/css/sass/*.scss',
            dest : 'html/css',
            options : {
                outputStyle : 'compressed'
            }
        }
    ]
};

// Scripts
gulp.task('scripts', function() {
    var deferred = Q.defer();

    setTimeout(function() {
        var script, uglify_options;
        for (var key in paths.scripts) {
            script = paths.scripts[key];

            uglify_options = {
                mangle : true
            };
            for (var _key in script.uglify_options) {
                uglify_options[_key] = script.uglify_options[_key];
            }

            gulp.src(script.files)
                .pipe(sourcemaps.init())
                .pipe(concat(script.destFile))
                .on('error', function (err) {
                    console.log('   ' + 'Concat JS ERROR'.underline.red);
                    console.log('   ' + err.message.underline.red);
                })
                .pipe(uglify(uglify_options))
                .on('error', function (err) {
                    console.log('   ' + 'Uglify JS ERROR'.underline.red);
                    console.log('   Line ' + err.lineNumber + ': ' + err.message.underline.red);
                })
                .pipe(sourcemaps.write('.', {
                    includeContent : false,
                    sourceRoot : 'src/'
                }))
                .pipe(size({
                    showFiles: true
                }))
                .pipe(gulp.dest(script.dest));
        }

        deferred.resolve();
    }, 1);

    return deferred.promise;
});

// Styles
gulp.task('styles', function() {
    var deferred = Q.defer();

    setTimeout(function() {
        var style;
        for (var key in paths.styles) {
            style = paths.styles[key];

            gulp.src(style.src)
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
                .pipe(sourcemaps.write('.', {
                    includeContent : false,
                    sourceRoot : 'sass/'
                }))
                // inline any files with extensions: svg, png#datauri, or jpg#datauri
                .pipe(base64({
                    baseDir : 'html',
                    extensions : ['svg', /\.png#datauri$/i, /\.jpg#datauri$/i],
                    maxImageSize : 8*1024 // bytes
                }))
                .on('error', function (err) {
                    console.log('   ' + 'Base64 ERROR'.underline.red);
                    console.log('   ' + err.message.underline.red);
                })
                .pipe(size({
                    showFiles: true
                }))
                .pipe(gulp.dest(style.dest));
        }

        deferred.resolve();
    }, 1);

    return deferred.promise;
});

// SVGs
gulp.task('svgs', function() {
    return gulp.src('html/images/**/*.svg')
        .pipe(svgmin())
        .pipe(gulp.dest('html/images'));
});

// Rerun the task when a file changes
gulp.task('watch', function() {
    // watch everything in the JS dirs & sub dirs with extension .js, but exclude the .min.js files
    gulp.watch(['html/js/src/**/*.js'], ['scripts']);
    // watch everything in the sass dirs & sub dirs with extension .scss
    gulp.watch(['html/css/sass/**/*.scss'], ['styles']);
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['scripts', 'styles']);