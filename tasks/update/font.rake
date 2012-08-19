namespace :update do

  desc "Transfer font files to vendor/assets"
  task :font => "font_awesome:download" do
    require "fileutils"

    source = GemDir.expand_path("Font-Awesome/font")
    destination = GemDir.expand_path("vendor/assets/font")

    puts "* Copying fonts to #{destination}"
    FileUtils.cp_r "#{source}/.", destination
  end
end
