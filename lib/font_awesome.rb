begin
  require "nokogiri"
rescue LoadError
  require "font_awesome/nokogiri"
end

require "font_awesome/font"
require "font_awesome/hex_code"
require "font_awesome/icon"
require "font_awesome/sass_extensions"
