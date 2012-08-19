namespace :update do
  namespace :sass do
    task :placeholders do
      require_relative "update_sass_placeholders_task"
      UpdateSassPlaceholdersTask.new.run
    end
  end
end
