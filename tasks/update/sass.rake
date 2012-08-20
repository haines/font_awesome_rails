namespace :update do
  task :sass do
    require_relative "update_sass_task"
    UpdateSassTask.new.run
  end
end
