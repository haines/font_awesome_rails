namespace :update do

  desc "Copy classic Font Awesome styles"
  task :classic => "classic:all"

  namespace :classic do

    task :all => ["font_awesome:download", :sass, :ie7]

    task :sass do
      require_relative "update_classic_sass_task"
      UpdateClassicSassTask.new.run
    end

    task :ie7 do
      require "fileutils"

      source = "Font-Awesome/css/font-awesome-ie7.css"
      destination = "vendor/assets/stylesheets/font-awesome/ie7.css"

      puts "* Updating #{destination}"
      FileUtils.cp GemDir.expand_path(source), GemDir.expand_path(destination)
    end

  end

end
