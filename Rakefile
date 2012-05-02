require 'cucumber/rake/task'
require 'rspec/core/rake_task'

desc 'Default: Run specs and features'
task :default => :test

Cucumber::Rake::Task.new
RSpec::Core::RakeTask.new

task :test => [:cucumber, :spec]