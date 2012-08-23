# Font Awesome for Rails
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/haines/font_awesome_rails)

font_awesome_rails brings the fantastic [Font Awesome](http://fortawesome.github.com/Font-Awesome) iconic font to the Rails asset pipeline, with a bunch of new Sass styles for semantic markup.


## Semantic markup

Wouldn't be great if instead of
```html
<a class="btn" href="..."><i class="icon-pencil"></i> Edit</a>
```
you could just write
```html
<a class="edit btn" href="...">Edit</a>
```
so that down the line you can restyle your edit links with impunity (and save yourself some keystrokes while you're at it)?

Thanks to the mixins provided by font_awesome_rails, you can!
```scss
.edit.btn {
  @include icon(pencil);
}
```


## Installation

Add this line to your application's Gemfile:
```ruby
gem 'font_awesome_rails'
```
And then execute:
```bash
$ bundle
```

Finally, add this line to your application.css.scss:
```scss
@import 'font-awesome';
```
Note that you need to `@import` it with Sass and not `*= require` it with Sprockets.


## Usage

For usage examples, see the [project page](http://haines.github.com/font_awesome_rails/).


## Compatibility

If you've already integrated your app with [Bootstrap](http://twitter.github.com/bootstrap)
and/or Font Awesome, you can get the classic `.icon-*` styles back by adding
```scss
@import 'font-awesome/classic';
```
to your application.css.scss.

If you're unlucky enough to need IE 7 compatibility, it's under `font-awesome/ie7`.
Classic styles only (no mixins) so you can `@import` or `*= require` it as you see fit.
