global.gulp = require('gulp')
global.$ = require('gulp-load-plugins')()

# simple image compression
gulp.task 'images', ->
	gulp.src('source/**/*.png')
	.pipe $.cache($.imagemin(
		optimizationLevel: 3
		progressive:       true
		interlaced:        true
	))
	.pipe(gulp.dest('build/dev'))

# construct deck pages
deckPages = require('./tasks/deckPages')
gulp.task 'md2Html',     deckPages.md2Html
gulp.task 'coffee2Html', deckPages.coffee2Html
gulp.task 'folder2Html', ['md2Html', 'coffee2Html'], deckPages.folder2Html

# live server
gulp.task 'live', ['folder2Html', 'images'], ->
	connect = require('connect')
	devServer = connect()
		.use require('connect-livereload')() # adds the livereload script to html
		.use connect.static('build/dev')
		.use connect.directory('build/dev')

	require('http').createServer(devServer)
	.listen 9000
	.on 'listening', ->
		console.log('Started connect web server on http://localhost:9000')

	reloadServer = $.livereload()
	gulp.watch [deckPages.mdPathPattern, deckPages.coffeePathPattern], (file) ->
		gulp.start 'folder2Html', ->
			reloadServer.changed(file.path)
	gulp.watch deckPages.templatePath, (file) ->
		deckPages.folder2Html()
		reloadServer.changed(file.path)

