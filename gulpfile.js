var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var del = require('del');

var nodemon = require('gulp-nodemon');

var publicPaths = {
    views: 'public/views',
    css: 'public/css',
    dest: 'public'
};

// builds elm files and static resources (i.e. html and css) from src to dist folder
var paths = {
    elm: 'src/elm/*.elm',
    elm_main: 'src/elm/main.elm',
    styles: "./src/styles/*.styl",
    staticAssets: 'src/*.{html,css}'
};

gulp.task('clean', function(cb) {
    del([publicPaths.dest], cb);
});

gulp.task('elm-init', $.elm.init);

gulp.task('elm', ['elm-init'], function() {
    return gulp.src(paths.elm_main)
        .pipe($.plumber())
        .pipe($.elm({ filetype: 'html' }))
        .pipe(gulp.dest(publicPaths.views));
});

gulp.task('staticAssets', function() {
    return gulp.src(paths.staticAssets)
        .pipe($.plumber())
        .pipe(gulp.dest(publicPaths.dest));
});

gulp.task('watch', function() {
    gulp.watch(paths.elm, ['elm']);
    gulp.watch(path.styles, ['styles']);
    gulp.watch(paths.staticAssets, ['static']);
});

gulp.task('start', function() {
    nodemon({
        script: '.',
        ext: 'js',
        env: { 'NODE_ENV': 'development' }
    })
});

gulp.task('styles', function() {
    return gulp.src(paths.styles)
        .pipe($.sourcemaps.init())
        .pipe($.concat('styles'))
        .pipe($.stylus())
        .pipe($.sourcemaps.write('.'))
        .pipe(gulp.dest(publicPaths.css));
});

gulp.task('build', ['elm', 'staticAssets']);
gulp.task('dev', ['build', 'watch']);
gulp.task('default', ['build', 'start']);