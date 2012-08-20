require_relative "../task"
require "font_awesome/icon"

class UpdateSassTask < Task
  def run
    puts "* Updating #{path}"

    open_file(path, "w") {|file| file.write contents }
  end

  def contents
    FontAwesome::Icon.all.map do |icon|
      "%icon-#{icon.name} { content: '#{icon.hex_code.to_css}'; }\n"
    end.join
  end

  def path
    "app/assets/stylesheets/font-awesome/_icons.scss"
  end
end
