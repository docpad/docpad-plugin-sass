# History

## v2.7.4 March 5, 2015
- Updated dependencies

## v2.7.3 May 23, 2014
- Better error reporting for sass's bad error reporting

## v2.7.2 May 7, 2014
- Fix sourcemaps
	- Thanks to [moperacz](https://github.com/moperacz) and [Matt Andrews](https://github.com/matthew-andrews) for [pull request #27](https://github.com/docpad/docpad-plugin-sass/pull/27)

## v2.7.1 January 28, 2014
- We now default `referencesOthers` to true if the less file imports other files

## v2.7.0 December 12, 2013
- Added support for sourcemaps
	- Thanks to [Jimmy King](https://github.com/jking90) for [pull request #15](https://github.com/docpad/docpad-plugin-sass/pull/15)

## v2.6.2 December 12, 2013
- Added bundlr support
	- Thanks to [Pat O'Callaghan](https://github.com/patocallaghan), [Andrew Kondratev](https://github.com/andruhon), [Carl](https://github.com/erutan) for [pull request #19](https://github.com/docpad/docpad-plugin-sass/pull/19) and [pull request #26](https://github.com/docpad/docpad-plugin-sass/pull/26)
- Updated dependencies
- Repackaged

## v2.6.1 Unknown
- Already published for some reason???

## v2.6.0 June 29, 2013
- SASS/SCSS files starting with an underscore and containing a dash are now correctly not renderered and written
	- Thanks to [Savio van Hoi](https://github.com/saviomuc) for [issue #12](https://github.com/docpad/docpad-plugin-sass/issues/12), and [Daniel Lindenkreuz](https://github.com/dlindenkreuz) and [michaud](https://github.com/michaud) for [issue #4](https://github.com/docpad/docpad-plugin-sass/issues/4)

## v2.5.1 June 29, 2013
- Updated dependencies

## v2.5.0 June 24, 2013
- Updated dependencies

## v2.4.5 April 5, 2013
- Dependency upgrades

## v2.4.4 April 1, 2013
- Dependency upgrades

## v2.4.3 March 7, 2013
- More stringent empty checks of paths
- Repackaged
- Dependency upgrades
	-  `bal-util` ~1.16.1 to ~1.16.8

## v2.4.2 January 26, 2013
- Node v0.9 support
- Updated dependencies
	- [bal-util](https://github.com/balupton/bal-util) from ~1.15.4 to ~1.16.1

## v2.4.1 December 14, 2012
- Added `debugInfo` config option
	- Closes [pull request #1](https://github.com/docpad/docpad-plugin-sass/pull/1) thanks to [Johannes Troeger](https://github.com/designaholic)

## v2.4.0 December 14, 2012
- We now detect is sass and scss are actually available to us, and if we try to use one of them when it isn't, we will get an appropriate error
- We now detect if compass is available, if it is, then we use it
- Updated bal-util dependency and coffee-script dev dependency

## v2.3.1 October 21, 2012
- Hopefully fixed `EMFILE` errors
- Changed [bal-util](http://balupton.com/project/bal-util) min version from 1.3.x to 1.3.8

## v2.3.0 September 1, 2012
- Use the `requireLibraries` option to require sass libaries
	- Thanks to [Jan Jolkmeier](https://github.com/jouz) for [pull request #14](https://github.com/bevry/docpad-extras/pull/14)

## v2.2.1 August 10, 2012
- Re-added markdown files to npm distribution as they are required for the npm website

## v2.2.0 July 18, 2012
- Updated for DocPad v6.3.0

## v2.1.0 July 10, 2012
- Rewrote to use the [SASS gem](http://rubygems.org/gems/sass/) instead of the poorly compliant [sass.js](https://github.com/visionmedia/sass.js)
	 - Also adds support for the [Compass](http://compass-style.org/) CSS authoring framework

## v2.0.1 July 8, 2012
- Added support for null extensions

## v1.0.1 April 19, 2012
- Fixed filename option when using DocPad v5

## v1.0.0 April 14, 2012
- Updated for DocPad v5.0
