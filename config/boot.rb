# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)

# Load our dependencies
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

Dotenv.load #loads .env

require_relative 'parse'

puts "\n-----------------------------------"
puts "RACK_ENV : #{RACK_ENV}"
puts "SERVER   : #{Parse::Client.session.server_url}"
puts "PARSE    : #{Parse::Client.session.app_id}"
puts "-----------------------------------\n"

Dir[__dir__ + '/../models/**/*.rb'].each { |f| require(f) }
