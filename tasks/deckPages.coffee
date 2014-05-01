fs = require('fs')
compileTemplate = require('lodash.template')
DECKS_FOLDER = "source/seeds/decks"

deckPages = {}
deckPages.mdPathPattern = "#{DECKS_FOLDER}/*/README.md"
deckPages.coffeePathPattern = "#{DECKS_FOLDER}/*/spec.coffee"
deckPages.templatePath = "source/views/deck.template.html"

deckPages.md2Html = ->
		gulp.src deckPages.mdPathPattern
		.pipe($.marked())
		.pipe($.rename(extname: '.html'))
		.pipe(gulp.dest(".tmp"))

deckPages.coffee2Html = ->
		gulp.src deckPages.coffeePathPattern
		.pipe($.wrapDocco())
		.pipe($.rename(extname: '.html'))
		.pipe(gulp.dest(".tmp"))

deckPages.folder2Html = ->
		templateFn = compileTemplate(fs.readFileSync(deckPages.templatePath, encoding: 'UTF-8'))

		# for each folder in sets (assumes there are only folders in sets)
		for folder in fs.readdirSync DECKS_FOLDER
			readmeHtml = fs.readFileSync ".tmp/#{folder}/README.html", encoding: 'UTF-8'
			specHtml = fs.readFileSync ".tmp/#{folder}/spec.html", encoding: 'UTF-8'
			spec = require "../#{DECKS_FOLDER}/#{folder}/spec.coffee"
			deckHtml = templateFn
				title:      folder.toUpperCase()
				readme:     readmeHtml
				spec:       specHtml
				cardIds:    (card.$id for key, card of spec.Card)
				deckFolder: folder
			fs.writeFileSync "build/#{target}/#{folder}.html", '\ufeff' + deckHtml, encoding: 'UTF-8'

module.exports = deckPages