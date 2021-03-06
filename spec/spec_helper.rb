require "bundler/setup"
require "font_awesome_rails"

Dir[File.expand_path("../tasks/**/*.rb", File.dirname(__FILE__))].each {|task| require task }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus

  config.order = "random"

  config.mock_with :mocha
end
