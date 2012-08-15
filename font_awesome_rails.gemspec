require File.expand_path('../lib/font_awesome_rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Haines"]
  gem.email         = ["andrew@haines.org.nz"]
  gem.description   = %q{Font Awesome for Rails}
  gem.summary       = %q{Brings the fantastic Font Awesome iconic font to the Rails asset pipeline, with a bunch of new Sass styles for semantic markup.}
  gem.homepage      = "http://github.com/haines/font_awesome_rails"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "font_awesome_rails"
  gem.require_paths = ["lib"]
  gem.version       = FontAwesomeRails::VERSION
end
