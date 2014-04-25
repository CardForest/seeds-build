

_ = require('highland')
path = require('path')
File = require('vinyl')
fs = require('fs')
processTemplate = require('lodash.template')
map = require('vinyl-map')
hljs = require('highlight.js')
hljs.configure tabReplace: '  '

md2HtmlPartial = ->
	gulp.src('./source/seeds/decks/*/README.md')
	.pipe($.marked())

coffee2HtmlPartial = ->
	gulp.src('./source/seeds/decks/*/code.coffee')
	.pipe map (buf) -> hljs.fixMarkup(hljs.highlight('coffeescript', buf.toString()).value)

combineHtmlPartials = (streams...) ->
	template = fs.readFileSync("./source/views/deck.template.html")
	_(streams.map((s) -> _(s))).merge()
	.group((file) -> path.basename(path.dirname(file.path)))
	.flatMap (grouped) ->
		_(for dirname, files of grouped
			partials = {}
			for file in files
				partials[path.basename(file.path)] = String(file.contents)
			new File 
				path: dirname + '.html'
				contents: new Buffer(processTemplate(template,
					readme: partials['README.md']
					code:  partials['code.coffee']
					cardIds: ['a','s']
				)))

module.exports = ->
	combineHtmlPartials(md2HtmlPartial(), coffee2HtmlPartial())
	.pipe(gulp.dest('build/dev'))