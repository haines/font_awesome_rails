namespace :update do

  desc "Update Font Awesome"
  task :font_awesome => "font_awesome:download" do
    puts "* Updating Font Awesome repo"
    system("cd Font-Awesome && git pull")
  end

  namespace :font_awesome do

    desc "Download Font Awesome"
    task :download do
      unless File.exists?(GemDir.expand_path("Font-Awesome"))
        puts "* Cloning Font Awesome repo"
        system("git clone git://github.com/FortAwesome/Font-Awesome.git")
      end
    end

  end
end
