global.gulp = require('gulp')
global.$ = require('gulp-load-plugins')()

gulp.task 'default', require('./tasks/deckPages')