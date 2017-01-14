var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var del = require('del');

var nodemon = require('gulp-nodemon');

var publicPaths = {
    js: 'public/js',
    css: 'public/css',
    dest: 'public'
};

// builds elm files and static resources (i.e. html and css) from src to dist folder
var paths = {
    elm: 'src/elm/*.elm',
    elm_main: 'src/elm/main.elm',
    styles: "./src/styles/*.styl",
    views: 'src/views/*.html'
};

gulp.task('clean', function(cb) {
    del([publicPaths.dest], cb);
});

gulp.task('elm-init', $.elm.init);

gulp.task('elm', ['elm-init'], function() {
    return gulp.src(paths.elm_main)
        .pipe($.plumber())
        .pipe($.elm())
        .pipe(gulp.dest(publicPaths.js));
});

gulp.task('views', function() {
    return gulp.src(paths.views)
        .pipe($.plumber())
        //.on('data', (file) => console.log('------------>', file))
        .pipe(gulp.dest(publicPaths.dest));
});

gulp.task('watch', function() {
    gulp.watch(paths.elm, ['elm']);
    gulp.watch(paths.styles, ['styles']);
    gulp.watch(paths.views, ['views']);
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

gulp.task('build', ['elm', 'styles', 'views']);
gulp.task('dev', ['build', 'start', 'watch']);
gulp.task('default', ['build', 'start']);