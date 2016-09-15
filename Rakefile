require 'bundler/setup'
require 'rake'
require 'parse/stack/tasks'

# Load Parse::Stack tasks
Parse::Stack.load_tasks

task :environment do
  require File.expand_path("../config/boot.rb", __FILE__)
end

desc "Start the console"
task :console => :environment do
  ARGV.clear
  # require 'irb'
  # IRB.start
  require "pry"
  Pry.start
end
task :c => :console # alias

desc "Start the server"
task :start do
  exec "WEB_CONCURRENCY=1 puma -v"
end
task :s => :start  # alias
task :default => :start  # alias


task :setup do
  unless File.exists?('.env')
    `cp env.sample .env`
  end
  puts "Edit the '.env' with your Parse credentials."
end
