require "sass"
require "font_awesome_rails/sass_extensions/functions"

module Sass::Script::Functions
  include FontAwesomeRails::SassExtensions::Functions
end
