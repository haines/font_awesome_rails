require_relative "../task"
require "font_awesome/icon"

class UpdateSassTask < Task
  def run
    puts "* Updating #{path}"

    open_file(path, "w") {|file| file.write contents.join }
  end

  def contents(&block)
    FontAwesome::Icon.all.map &block
  end
end
