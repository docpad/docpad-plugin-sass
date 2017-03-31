# Export Plugin
module.exports = (BasePlugin) ->
	# Requires
	safeps = require('safeps')
	fs = require('fs')
	{TaskGroup} = require('taskgroup')

	# Define Plugin
	class SassPlugin extends BasePlugin
		# Plugin name
		name: 'sass'

		# Plugin config
		# Only on the development environment use expanded, otherwise use compressed
		config:
			sassPath: null
			scssPath: null
			compass: null
			debugInfo: false
			sourcemap: false
			outputStyle: 'compressed'
			requireLibraries: null
			renderUnderscoreStylesheets: false
			environments:
				development:
					outputStyle: 'expanded'

		# Locale
		locale:
			sassNotInstalled: 'SASS does not appear to be available on your system'
			scssNotInstalled: 'SCSS does not appear to be available on your system'

		# Generate Before
		generateBefore: (opts,next) ->
			# Prepare
			config = @config

			# Group
			tasks = new TaskGroup(concurrency:0).done(next)

			# Determine if compass is installed
			unless config.compass?
				tasks.addTask (complete) ->
					safeps.getExecPath 'compass', (err,path) ->
						config.compass = path?
						return complete()

			# Determine sass executable path
			['sass','scss'].forEach (thing) ->
				unless config[thing+'Path']?
					tasks.addTask (complete) ->
						safeps.getExecPath thing, (err,path) ->
							config[thing+'Path'] = path ? false
							return complete()

			# Fire tasks
			tasks.run()

		# Prevent underscore
		extendCollections: (opts) ->
			# Prepare
			config = @config
			docpad = @docpad

			# Prevent underscore files from being written if desired
			if config.renderUnderscoreStylesheets is false
				@underscoreStylesheets = docpad.getDatabase().findAllLive(filename: /^_(.*?)\.(?:scss|sass)/)
				@underscoreStylesheets.on 'add', (model) ->
					model.set({
						render: false
						write: false
					})

		# Render some content
		render: (opts,next) ->
			# Prepare
			config = @config
			locale = @locale
			{inExtension,outExtension,file} = opts

			# If SASS/SCSS then render
			if inExtension in ['sass','scss'] and outExtension in ['css',null]
				# Fetch useful paths
				fullDirPath = file.get('fullDirPath')

				# Prepare the command and options
				commandOpts = {}
				execPath = config[inExtension+'Path']

				# Check if we have the executable for that extension
				return next(new Error(locale[inExtension+'NotInstalled']))  unless execPath

				# Set referencesOthers if this document imports, as sass concatenates files together
				file.setMetaDefaults('referencesOthers': true)  if opts.content.indexOf('@import') isnt -1

				# Build our command
				command = [].concat(execPath)
				# ^ execPath can be an array or string, see https://github.com/docpad/docpad-plugin-sass/pull/26

				# Sourcemaps or stdin?
				if config.sourcemap
					command.push("#{file.attributes.fullPath}:#{file.attributes.outPath}", '--no-cache', '--update', '--sourcemap')
				else
					command.push('--no-cache', '--stdin')
					commandOpts.stdin = opts.content

				if fullDirPath
					command.push('--load-path')
					command.push(fullDirPath)

				if config.loadPaths
					config.loadPaths.forEach (loadPath) ->
						command.push('--load-path')
						command.push(loadPath)

				if config.compass
					command.push('--compass')

				if config.debugInfo
					command.push('--debug-info')

				if config.outputStyle
					command.push('--style')
					command.push(config.outputStyle)

				if config.requireLibraries
					for name in config.requireLibraries
						command.push('--require')
						command.push(name)

				# Spawn the appropriate process to render the content
				safeps.spawn command, commandOpts, (err,stdout,stderr) ->
					if err
						err.message += '\n\n'+(stderr.toString() or stdout.toString())
						return next(err)

					if config.sourcemap
						fs.readFile file.attributes.outPath, (err, result) ->
							return next(err)  if ( err )
							opts.content = result.toString()
							return next()
					else
						opts.content = stdout.toString()
						return next()

			else
				# Done, return back to DocPad
				return next()
