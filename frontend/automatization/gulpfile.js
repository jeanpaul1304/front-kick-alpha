var
	resources = {
		jade : '../resources/jade/',
		stylus : '../resources/stylus/',
		coffee : '../resources/coffee/',
		img : '../resources/assets/img/',
		sprite : '../resources/assets/sprites/',
		svg : '../resources/assets/svg/',
		fonts : '../resources/assets/fonts/'
	},
	public = {
		path : '../../public/',
		html : '../../public/views/',
		css : '../../public/css/',
		fonts : '../../public/css/fonts/',
		js : '../../public/js/',
		img : '../../public/img/'
	};

var
	gulp = require('gulp'),
	jade = require('gulp-jade'),
	coffee = require('gulp-coffee'),
	uglify = require('gulp-uglify'),
	stylus = require('gulp-stylus'),
	plumber = require('gulp-plumber'),
	runSequence = require('run-sequence'),
	spritesmith = require('gulp.spritesmith'),
	imagemin = require('gulp-imagemin'),
	iconfont = require('gulp-iconfont'),
	iconfontCss = require('gulp-iconfont-css'),
	browserSync = require('browser-sync'),
	es = require('event-stream');

var reload = browserSync.reload;

// task watch
gulp.task('watch', function() {
	gulp.watch([
		resources.jade + '**/*.jade',
		resources.jade + '**/**/*.jade'
	], ['jade', reload]);

	gulp.watch([
		resources.stylus + '**/*.styl',
		resources.stylus + '**/**/*.styl'
	], ['stylus', reload]);

	gulp.watch([
		resources.coffee + '*.coffee',
		resources.coffee + '**/*.coffee'
	], ['coffee', reload]);
});

gulp.task('jade', function() {
	var app = gulp.src([
		resources.jade + '*.jade'
	])
	.pipe(plumber())
	.pipe(jade({
		pretty: true
	}))
	.pipe(gulp.dest(public.path));

	var views = gulp.src([
		resources.jade + 'modules/**/*.jade'
	])
	.pipe(plumber())
	.pipe(jade({
		pretty: true
	}))
	.pipe(gulp.dest(public.html));

	return es.concat(app, views);
});

gulp.task('stylus', function() {
	return gulp.src([
		resources.stylus + '*.styl'
	])
	.pipe(plumber())
	.pipe(stylus({
		compress: true
	}))
	.pipe(gulp.dest(public.css));
});

// task coffee
gulp.task('coffee', function() {
	return gulp.src([
		resources.coffee + '*.coffee',
		resources.coffee + '**/*.coffee'
	])
	.pipe(plumber())
	.pipe(coffee())
	.pipe(uglify())
	.pipe(gulp.dest(public.js));
});

// task browser-sync | browser-sync
gulp.task('browser-sync', function() {
	return browserSync.init({
		keepalive: true,
		server: {
			baseDir: public.path
		}
	});
});

//task imagemin
gulp.task('imagemin', function() {
	return gulp.src([
		resources.img + '*.jpg',
		resources.img + '*.png',
		resources.img + '*.gif'
	])
	.pipe(imagemin({
		progressive : true,
		optimizationLevel : 4
	}))
	.pipe(gulp.dest(public.img));
});

// task iconfont | gulp-iconfont
gulp.task('iconfont', function() {
	return gulp.src([
		resources.svg + '*.svg'
	])
	.pipe(plumber())
	.pipe(iconfontCss({
		fontName: 'icons',
		targetPath: '../../../frontend/resources/stylus/base/_icons.styl',
		fontPath: 'fonts/'
	}))
	.pipe(iconfont({
		fontName: 'icons',
		fontHeight: 1000,
		normalize: true,
		centerHorizontally: true
	}))
	.pipe(gulp.dest(public.css + 'fonts/'));
});

// task sprite | gulp.spriteminth
gulp.task('sprite', function () {
  var spriteData = gulp.src(resources.sprite + '*.png')
  .pipe(plumber())
  .pipe(spritesmith({
  	imgPath: '../img/sprite.png',
    imgName: 'sprite.png',
    cssName: '_sprite.styl'
  }));
  spriteData.img
  	.pipe(plumber())
    .pipe(imagemin())
    .pipe(gulp.dest(public.img));
  spriteData.css
  	.pipe(plumber())
    .pipe(gulp.dest(resources.stylus + 'base/'));
});

gulp.task('fonts', ['iconfont'], function() {
	return gulp.src([
		resources.fonts + '*/*'
	])
	.pipe(gulp.dest(public.fonts));
});

//task default
gulp.task('default', function (cb) {
	runSequence('jade', 'stylus', 'coffee', 'imagemin','fonts','sprite','iconfont' );
});

// task server
gulp.task('server', function (cb) {
		runSequence('browser-sync', 'watch', cb);
});