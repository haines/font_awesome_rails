#!/usr/bin/env rake
require "bundler/gem_tasks"

Dir[File.expand_path("tasks/**/*.rake", File.dirname(__FILE__))].sort.each {|f| import f }

task :default => :spec
