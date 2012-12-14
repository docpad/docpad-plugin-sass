## History

- v2.4.0 December 14, 2012
	- We now detect is sass and scss are actually available to us, and if we try to use one of them when it isn't, we will get an appropriate error
	- We now detect if compass is available, if it is, then we use it
	- Updated bal-util dependency and coffee-script dev dependency
 
- v2.3.1 October 21, 2012
	- Hopefully fixed `EMFILE` errors
	- Changed [bal-util](http://balupton.com/project/bal-util) min version from 1.3.x to 1.3.8

- v2.3.0 September 1, 2012
	- Use the `requireLibraries` option to require sass libaries
		- Thanks to [Jan Jolkmeier](https://github.com/jouz) for [pull request #14](https://github.com/bevry/docpad-extras/pull/14)

- v2.2.1 August 10, 2012
	- Re-added markdown files to npm distribution as they are required for the npm website

- v2.2.0 July 18, 2012
	- Updated for DocPad v6.3.0

- v2.1.0 July 10, 2012
	- Rewrote to use the [SASS gem](http://rubygems.org/gems/sass/) instead of the poorly compliant [sass.js](https://github.com/visionmedia/sass.js)
		 - Also adds support for the [Compass](http://compass-style.org/) CSS authoring framework

- v2.0.1 July 8, 2012
	- Added support for null extensions

- v1.0.1 April 19, 2012
	- Fixed filename option when using DocPad v5

- v1.0.0 April 14, 2012
	- Updated for DocPad v5.0
