require "font_awesome_rails/version"

begin
  require "nokogiri"
rescue LoadError
  require "font_awesome_rails/nokogiri"
end

require "font_awesome_rails/engine" if defined?(Rails)
require "font_awesome_rails/icon"
require "font_awesome_rails/font"
require "font_awesome_rails/glyph"

module FontAwesomeRails
  def self.root
    File.expand_path "../..", __FILE__
  end
end
