_ = require('highland')
processTemplate = require('lodash.template')
fs = require('fs')
path = require('path')

md2HtmlPartial = ->
	gulp.src 'source/seeds/decks/*/README.md'
	.pipe($.marked())

coffee2HtmlPartial = ->
	gulp.src 'source/seeds/decks/*/spec.coffee'
	.pipe($.wrapDocco())

combineHtmlPartials = (streams...) ->
	template = fs.readFileSync 'source/views/deck.template.html'
	_(streams.map((s) -> _(s))).merge()
	.pipe $.groupAggregate
		group: (file) -> path.basename(path.dirname(file.path))
		aggregate: (group, files) ->
			spec = require "../source/seeds/decks/#{group}/spec.coffee"
			partials = {}
			for file in files
				partials[path.basename(file.path)] = String(file.contents)
			return {
				path: group + '.html'
				contents: new Buffer(processTemplate(template,
					readme: partials['README.md']
					spec:  partials['spec.coffee']
					cardIds: (card.$id for key, card of spec.Card)
				))
			}

module.exports = ->
	combineHtmlPartials(md2HtmlPartial(), coffee2HtmlPartial())
	.pipe($.header('\ufeff')) # adding BOM (instead of <meta charset= ...)
	.pipe(gulp.dest('build/dev'))