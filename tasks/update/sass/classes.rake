namespace :update do
  namespace :sass do
    task :classes do
      require_relative "update_sass_classes_task"
      UpdateSassClassesTask.new.run
    end
  end
end
