namespace :update do

  desc "Update font metrics"
  task :metrics do
    require_relative "update_metrics_task"
    UpdateMetricsTask.new.run
  end
end
