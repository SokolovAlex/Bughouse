var gulp = require('gulp');
var elm = require('gulp-elm');
var plumber = require('gulp-plumber');
var del = require('del');

var nodemon = require('gulp-nodemon');

// builds elm files and static resources (i.e. html and css) from src to dist folder
var paths = {
    views: 'public/views',
    dest: 'public',
    elm: 'src/elm/**/*.elm',
    staticAssets: 'src/*.{html,css}'
};

gulp.task('clean', function(cb) {
    del([paths.dest], cb);
});

gulp.task('elm-init', elm.init);

gulp.task('elm', ['elm-init'], function() {
    return gulp.src(paths.elm)
        .pipe(plumber())
        .pipe(elm({filetype : 'html'}))
        .pipe(gulp.dest(paths.views));
});

gulp.task('staticAssets', function() {
    return gulp.src(paths.staticAssets)
        .pipe(plumber())
        .pipe(gulp.dest(paths.dest));
});

gulp.task('watch', function() {
    gulp.watch(paths.elm, ['elm']);
    gulp.watch(paths.staticAssets, ['static']);
});

gulp.task('start', function () {
    nodemon({
        script: '.'
        , ext: 'js'
        , env: { 'NODE_ENV': 'development' }
    })
});

gulp.task('build', ['elm', 'staticAssets']);
gulp.task('dev', ['build', 'watch']);
gulp.task('default', ['build', 'start']);