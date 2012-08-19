require_relative "../update_sass_task"

class UpdateSassClassesTask < UpdateSassTask
  def contents
    super do |icon|
      ".icon-#{icon.name}:before { @extend %icon-#{icon.name}; }\n"
    end
  end

  def path
    "app/assets/stylesheets/font-awesome/_icon-classes.scss"
  end
end
