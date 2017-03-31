# [SASS/SCSS](http://sass-lang.com/) Plugin for [DocPad](https://docpad.org) with [Compass](http://compass-style.org/) support

<!-- BADGES/ -->

<span class="badge-travisci"><a href="http://travis-ci.org/docpad/docpad-plugin-sass" title="Check this project's build status on TravisCI"><img src="https://img.shields.io/travis/docpad/docpad-plugin-sass/master.svg" alt="Travis CI Build Status" /></a></span>
<span class="badge-npmversion"><a href="https://npmjs.org/package/docpad-plugin-sass" title="View this project on NPM"><img src="https://img.shields.io/npm/v/docpad-plugin-sass.svg" alt="NPM version" /></a></span>
<span class="badge-npmdownloads"><a href="https://npmjs.org/package/docpad-plugin-sass" title="View this project on NPM"><img src="https://img.shields.io/npm/dm/docpad-plugin-sass.svg" alt="NPM downloads" /></a></span>
<span class="badge-daviddm"><a href="https://david-dm.org/docpad/docpad-plugin-sass" title="View the status of this project's dependencies on DavidDM"><img src="https://img.shields.io/david/docpad/docpad-plugin-sass.svg" alt="Dependency Status" /></a></span>
<span class="badge-daviddmdev"><a href="https://david-dm.org/docpad/docpad-plugin-sass#info=devDependencies" title="View the status of this project's development dependencies on DavidDM"><img src="https://img.shields.io/david/dev/docpad/docpad-plugin-sass.svg" alt="Dev Dependency Status" /></a></span>
<br class="badge-separator" />
<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-gratipay"><a href="https://www.gratipay.com/bevry" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/badge/gratipay-donate-yellow.svg" alt="Gratipay donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>
<br class="badge-separator" />
<span class="badge-slackin"><a href="https://slack.bevry.me" title="Join this project's slack community"><img src="https://slack.bevry.me/badge.svg" alt="Slack community badge" /></a></span>

<!-- /BADGES -->


Adds support for the [SASS and SCSS](http://sass-lang.com/) CSS pre-processors to [DocPad](https://docpad.org). It also supports the [Compass](http://compass-style.org/) framework.

This SASS/SCSS plugin uses the original ruby implementation, which requires installing ruby and the necessary gems. If you would like to use a native node implementation which would be faster (but no support for 3rd party ruby gems like compass etc) then we'd recommend using [the nodesass plugin](https://github.com/jking90/docpad-plugin-nodesass). [More info here.](https://github.com/docpad/docpad-plugin-sass/issues/11)

Convention:  `.css.(sass|scss)`. Make sure that you your files are located in `documents` (or `render`) folder as extensions-based rendering happens only [inside this folder](https://docpad.org/docs/overview#the-render-directory).


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

<h2>History</h2>

<a href="https://github.com/docpad/docpad-plugin-sass/blob/master/HISTORY.md#files">Discover the release history by heading on over to the <code>HISTORY.md</code> file.</a>

<!-- /HISTORY -->


<!-- CONTRIBUTE/ -->

<h2>Contribute</h2>

<a href="https://github.com/docpad/docpad-plugin-sass/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /CONTRIBUTE -->


<!-- BACKERS/ -->

<h2>Backers</h2>

<h3>Maintainers</h3>

These amazing people are maintaining this project:

<ul><li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-sass">view contributions</a></li></ul>

<h3>Sponsors</h3>

No sponsors yet! Will you be the first?

<span class="badge-patreon"><a href="https://patreon.com/bevry" title="Donate to this project using Patreon"><img src="https://img.shields.io/badge/patreon-donate-yellow.svg" alt="Patreon donate button" /></a></span>
<span class="badge-opencollective"><a href="https://opencollective.com/bevry" title="Donate to this project using Open Collective"><img src="https://img.shields.io/badge/open%20collective-donate-yellow.svg" alt="Open Collective donate button" /></a></span>
<span class="badge-gratipay"><a href="https://www.gratipay.com/bevry" title="Donate weekly to this project using Gratipay"><img src="https://img.shields.io/badge/gratipay-donate-yellow.svg" alt="Gratipay donate button" /></a></span>
<span class="badge-flattr"><a href="https://flattr.com/profile/balupton" title="Donate to this project using Flattr"><img src="https://img.shields.io/badge/flattr-donate-yellow.svg" alt="Flattr donate button" /></a></span>
<span class="badge-paypal"><a href="https://bevry.me/paypal" title="Donate to this project using Paypal"><img src="https://img.shields.io/badge/paypal-donate-yellow.svg" alt="PayPal donate button" /></a></span>
<span class="badge-bitcoin"><a href="https://bevry.me/bitcoin" title="Donate once-off to this project using Bitcoin"><img src="https://img.shields.io/badge/bitcoin-donate-yellow.svg" alt="Bitcoin donate button" /></a></span>
<span class="badge-wishlist"><a href="https://bevry.me/wishlist" title="Buy an item on our wishlist for us"><img src="https://img.shields.io/badge/wishlist-donate-yellow.svg" alt="Wishlist browse button" /></a></span>

<h3>Contributors</h3>

These amazing people have contributed code to this project:

<ul><li><a href="http://blog.kondratev.pro">Andrew Kondratev</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=andruhon" title="View the GitHub contributions of Andrew Kondratev on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="http://balupton.com">Benjamin Lupton</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=balupton" title="View the GitHub contributions of Benjamin Lupton on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="https://github.com/diessica">diessica</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=diessica" title="View the GitHub contributions of diessica on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="https://github.com/diessicode">diessicode</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=diessicode" title="View the GitHub contributions of diessicode on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="http://kolkmeier.com">Jan Kolkmeier</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=jankolkmeier" title="View the GitHub contributions of Jan Kolkmeier on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="https://github.com/jankolkmeier">jankolkmeier</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=jankolkmeier" title="View the GitHub contributions of jankolkmeier on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="https://github.com/jking90">jking90</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=jking90" title="View the GitHub contributions of jking90 on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="http://johannestroeger.de">Johannes Troeger</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=johannestroeger" title="View the GitHub contributions of Johannes Troeger on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="http://www.merrickchristensen.com">Merrick Christensen</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=iammerrick" title="View the GitHub contributions of Merrick Christensen on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="https://github.com/moperacz">Marcin Operacz</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=moperacz" title="View the GitHub contributions of Marcin Operacz on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="www.myplanetdigital.com">Neil Taylor</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=neilbaylorrulez" title="View the GitHub contributions of Neil Taylor on repository docpad/docpad-plugin-sass">view contributions</a></li>
<li><a href="http://littleglitch.io">Pat O'Callaghan</a> — <a href="https://github.com/docpad/docpad-plugin-sass/commits?author=patocallaghan" title="View the GitHub contributions of Pat O'Callaghan on repository docpad/docpad-plugin-sass">view contributions</a></li></ul>

<a href="https://github.com/docpad/docpad-plugin-sass/blob/master/CONTRIBUTING.md#files">Discover how you can contribute by heading on over to the <code>CONTRIBUTING.md</code> file.</a>

<!-- /BACKERS -->


<!-- LICENSE/ -->

<h2>License</h2>

Unless stated otherwise all works are:

<ul><li>Copyright &copy; 2012+ <a href="http://bevry.me">Bevry Pty Ltd</a></li></ul>

and licensed under:

<ul><li><a href="http://spdx.org/licenses/MIT.html">MIT License</a></li></ul>

<!-- /LICENSE -->
