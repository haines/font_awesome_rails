require "font_awesome_rails/version"
require "font_awesome_rails/engine" if defined?(Rails)

require "font_awesome"

module FontAwesomeRails
  def self.root
    File.expand_path "../..", __FILE__
  end
end
