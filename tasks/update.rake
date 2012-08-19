require_relative "gem_dir"

desc "Update Font Awesome and generate code"
task :update => "update:all"

namespace :update do
  task :all => [:font_awesome, :font, :hex_codes, :metrics, :sass]
end
