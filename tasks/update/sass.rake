namespace :update do

  desc "Generate sass rules"
  task :sass => "sass:all"

  namespace :sass do
    task :all => [:placeholders, :classes]
  end

end
