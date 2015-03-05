# [SASS/SCSS](http://sass-lang.com/) Plugin for [DocPad](https://docpad.org) with [Compass](http://compass-style.org/) support

<!-- BADGES/ -->

[![Build Status](https://img.shields.io/travis/docpad/docpad-plugin-sass/master.svg)](http://travis-ci.org/docpad/docpad-plugin-sass "Check this project's build status on TravisCI")
[![NPM version](https://img.shields.io/npm/v/docpad-plugin-sass.svg)](https://npmjs.org/package/docpad-plugin-sass "View this project on NPM")
[![NPM downloads](https://img.shields.io/npm/dm/docpad-plugin-sass.svg)](https://npmjs.org/package/docpad-plugin-sass "View this project on NPM")
[![Dependency Status](https://img.shields.io/david/docpad/docpad-plugin-sass.svg)](https://david-dm.org/docpad/docpad-plugin-sass)
[![Dev Dependency Status](https://img.shields.io/david/dev/docpad/docpad-plugin-sass.svg)](https://david-dm.org/docpad/docpad-plugin-sass#info=devDependencies)<br/>
[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

<!-- /BADGES -->


Adds support for the [SASS and SCSS](http://sass-lang.com/) CSS pre-processors to [DocPad](https://docpad.org). It also supports the [Compass](http://compass-style.org/) framework.

This SASS/SCSS plugin uses the original ruby implementation, which requires installing ruby and the necessary gems. If you would like to use a native node implementation which would be faster (but no support for 3rd party ruby gems like compass etc) then we'd recommend using [the nodesass plugin](https://github.com/jking90/docpad-plugin-nodesass). [More info here.](https://github.com/docpad/docpad-plugin-sass/issues/11)

Convention:  `.css.(sass|scss)`


## Install

1. [Install Ruby](http://www.ruby-lang.org/en/downloads/)

1. [Install the SASS gem](http://rubygems.org/gems/sass/)

1. [Optional: Install the Compass gem](http://rubygems.org/gems/compass/)

1. Install this plugin

	```
	docpad install sass
	```


## Configure
For information on customising your plugin configuration you can refer to the [DocPad FAQ](http://docpad.org/docs/faq#how-do-i-customise-the-configuration-sent-to-a-plugin)

### Sass and Scss Paths
We automatically detect the path to your sass and scss executables, however sometimes that doesn't work and you will get `ENOENT` errors. If our detection fails and you'll have to manually specify the path to your sass and scss executables with the `sassPath` and `scssPath` config options, [more info here](https://github.com/docpad/docpad-plugin-sass/issues/6).

### Compass Support
We automatically detect if you have [compass](http://compass-style.org/) installed, and if you do, then we'll use it. If our detection fails and you want to still use it, then set the `compass` option to `true`. If you have compass installed but don't want to use it then set the `compass` option to `false`.

### Output Style
You can set the `outputStyle` option to any of the supported [output styles](http://sass-lang.com/docs/yardoc/file.SASS_REFERENCE.html#output_style). Those being `nested`, `expanded`, `compact`, and `compressed`. By default, we use the `compressed` mode for all environments, except the development mode where it is set to `expanded`.

### Require Libraries
You can set the `requireLibraries` option to an array of extra ruby libraries you'd like to include before rendering your sass file. For instance, setting it to `['susy','compass-colors']` will include the [Susy](http://susy.oddbird.net/) and [Compass Colors](https://github.com/chriseppstein/compass-colors) plugins. By default, the value is set to `null` indicating we do not include any libaries.

### Render Underscore Stylesheets
By default we prevent any SASS/SCSS stylesheets that filename starts with underscore character from being rendered and written to the output directory. This is to follow SASS/SCSS convention that such files are just intended to be included inside out stylesheets, and that they are not meant to be rendered by themselves. If you really want to, you can render the underscore stylesheets by setting the `renderUnderscoreStylesheets` option to `true` in your plugin's configuration.

### Sourcemaps
If you want to use sourcemaps, set the `sourcemap` option to `true`.

### Bundlr Support
If you want to use bundler you can set something like this in docpad.coffee:

``` coffee
	plugins:
		sass:
			scssPath: ['bundle','exec','scss']
			sassPath: ['bundle','exec','sass']
```


## Troubleshooting

### I get `ERROR: Cannot load compass.`
Install compass again using: `gem install compass --pre`


<!-- HISTORY/ -->

## History
[Discover the change history by heading on over to the `HISTORY.md` file.](https://github.com/docpad/docpad-plugin-sass/blob/master/HISTORY.md#files)

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

## Contribute

[Discover how you can contribute by heading on over to the `CONTRIBUTING.md` file.](https://github.com/docpad/docpad-plugin-sass/blob/master/CONTRIBUTING.md#files)

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

## Backers

### Maintainers

These amazing people are maintaining this project:

- Benjamin Lupton <b@lupton.cc> (https://github.com/balupton)

### Sponsors

No sponsors yet! Will you be the first?

[![Gratipay donate button](https://img.shields.io/gratipay/docpad.svg)](https://www.gratipay.com/docpad/ "Donate weekly to this project using Gratipay")
[![Flattr donate button](https://img.shields.io/badge/flattr-donate-yellow.svg)](http://flattr.com/thing/344188/balupton-on-Flattr "Donate monthly to this project using Flattr")
[![PayPayl donate button](https://img.shields.io/badge/paypal-donate-yellow.svg)](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=QB8GQPZAH84N6 "Donate once-off to this project using Paypal")
[![BitCoin donate button](https://img.shields.io/badge/bitcoin-donate-yellow.svg)](https://coinbase.com/checkouts/9ef59f5479eec1d97d63382c9ebcb93a "Donate once-off to this project using BitCoin")
[![Wishlist browse button](https://img.shields.io/badge/wishlist-donate-yellow.svg)](http://amzn.com/w/2F8TXKSNAFG4V "Buy an item on our wishlist for us")

### Contributors

These amazing people have contributed code to this project:

- [andruhon](https://github.com/andruhon) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=andruhon)
- [Benjamin Lupton](https://github.com/balupton) <b@lupton.cc> — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=balupton)
- [diessica](https://github.com/diessica) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=diessica)
- [diessicode](https://github.com/diessicode) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=diessicode)
- [Jan Kolkmeier](https://github.com/jouz) <jankolkmeier@gmail.com> — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=jouz)
- [jankolkmeier](https://github.com/jankolkmeier) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=jankolkmeier)
- [jking90](https://github.com/jking90) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=jking90)
- [Johannes Troeger](https://github.com/johannestroeger) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=johannestroeger)
- [Merrick Christensen](https://github.com/iammerrick) <merrick.christensen@gmail.com> — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=iammerrick)
- [moperacz](https://github.com/moperacz) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=moperacz)
- [neilbaylorrulez](https://github.com/neilbaylorrulez) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=neilbaylorrulez)
- [patocallaghan](https://github.com/patocallaghan) — [view contributions](https://github.com/docpad/docpad-plugin-sass/commits?author=patocallaghan)

[Become a contributor!](https://github.com/docpad/docpad-plugin-sass/blob/master/CONTRIBUTING.md#files)

<!-- /BACKERS -->


<!-- LICENSE/ -->

## License

Unless stated otherwise all works are:

- Copyright &copy; 2012+ Bevry Pty Ltd <us@bevry.me> (http://bevry.me)

and licensed under:

- The incredibly [permissive](http://en.wikipedia.org/wiki/Permissive_free_software_licence) [MIT License](http://opensource.org/licenses/mit-license.php)

<!-- /LICENSE -->


