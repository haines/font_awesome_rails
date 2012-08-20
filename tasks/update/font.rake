namespace :update do

  desc "Transfer font files to vendor/assets"
  task :font => "font_awesome:download" do
    require "fileutils"

    source = "Font-Awesome/font"
    destination = "vendor/assets/font"

    puts "* Copying fonts to #{destination}"
    FileUtils.cp_r "#{GemDir.expand_path(source)}/.", GemDir.expand_path(destination)
  end
end
