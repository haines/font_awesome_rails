require_relative "../update_sass_task"

class UpdateSassPlaceholdersTask < UpdateSassTask
  def contents
    super do |icon|
      "%icon-#{icon.name} { content: '#{icon.hex_code.to_css}'; }\n"
    end
  end

  def path
    "app/assets/stylesheets/font-awesome/_icon-placeholders.scss"
  end
end
