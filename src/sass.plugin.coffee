# Export Plugin
module.exports = (BasePlugin) ->
	# Requires
	safeps = require('safeps')
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
			tasks = new TaskGroup().setConfig(concurrency:0).once('complete',next)

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
				commandOpts = {stdin:opts.content}
				execPath = config[inExtension+'Path']

				# Check if we have the executable for that extension
				return next(new Error(locale[inExtension+'NotInstalled']))  unless execPath

				# Build our command
				command = [execPath, '--stdin', '--no-cache']
				if fullDirPath
					command.push('--load-path')
					command.push(fullDirPath)
				if config.compass
					command.push('--compass')
				if config.debugInfo
					command.push('--debug-info')
        if config.sourcemap
          command.push('--sourcemap')
				if config.outputStyle
					command.push('--style')
					command.push(config.outputStyle)
				if config.requireLibraries
					for name in config.requireLibraries
						command.push('--require')
						command.push(name)

				# Spawn the appropriate process to render the content
				safeps.spawn command, commandOpts, (err,stdout,stderr,code,signal) ->
					return next(err)  if err
					opts.content = stdout
					return next()

			else
				# Done, return back to DocPad
				return next()
