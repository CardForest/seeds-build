global.gulp = require('gulp')
global.$ = require('gulp-load-plugins')()

gulp.task 'images', ->
	gulp.src('source/**/*.png')
	.pipe $.cache($.imagemin(
		optimizationLevel:  3
		progressive:        true
		interlaced: true
	))
	.pipe(gulp.dest('build/dev'))


gulp.task 'default', ['images'], require('./tasks/deckPages')