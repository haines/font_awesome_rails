require File.expand_path('../lib/font_awesome_rails/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Andrew Haines"]
  gem.email         = ["andrew@haines.org.nz"]
  gem.description   = %q{Font Awesome for Rails}
  gem.summary       = %q{Brings the fantastic Font Awesome iconic font to the Rails asset pipeline, with a bunch of new Sass styles for semantic markup.}
  gem.homepage      = "http://haines.github.com/font_awesome_rails/"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "font_awesome_rails"
  gem.require_paths = ["lib"]
  gem.version       = FontAwesomeRails::VERSION

  gem.add_dependency 'sass', '>= 3.2.0'
  gem.add_dependency 'activesupport', '>= 3.1.0'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec', '>= 2.8.0'
  gem.add_development_dependency 'mocha', '>= 0.12.0'
  gem.add_development_dependency 'nokogiri', '>= 1.5.0'
  gem.add_development_dependency 'rmagick', '>= 2.13.0'
end
