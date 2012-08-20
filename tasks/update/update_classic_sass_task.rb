require_relative "../task"

class UpdateClassicSassTask < Task
  def run
    puts "* Updating #{path}"

    open_file(path, "w") {|file| file.write styles }
  end

  def styles
    contents.match(%r{/\*  Font Awesome styles.*}m) {|matched| matched.to_s }
  end

  def contents
    open_file("Font-Awesome/sass/font-awesome.scss") {|file| file.read }
  end

  def path
    "vendor/assets/stylesheets/font-awesome/_classic.scss"
  end
end
