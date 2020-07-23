#!/usr/bin/env rackup
# encoding: utf-8

# This file can be used to start Padrino,
# just execute it from the command line.

require File.expand_path("../config/boot.rb", __FILE__)

# Loads all and register all the defined webhooks
require_relative 'webhooks/all'

## ONLY FOR EXAMPLE
puts "\nWebhooks Triggers\n"
Parse::Webhooks.logging = :debug
Parse::Webhooks.routes.before_find.keys.each do |k|
  puts "- before_find  : #{k}"
end

Parse::Webhooks.routes.after_find.keys.each do |k|
  puts "- after_find   : #{k}"
end

Parse::Webhooks.routes.before_save.keys.each do |k|
  puts "- before_save  : #{k}"
end

Parse::Webhooks.routes.after_save.keys.each do |k|
  puts "- after_save   : #{k}"
end

Parse::Webhooks.routes.before_delete.keys.each do |k|
  puts "- before_delete: #{k}"
end

Parse::Webhooks.routes.after_delete.keys.each do |k|
  puts "- after_delete : #{k}"
end

puts "\nWebhooks Functions\n"
Parse::Webhooks.routes.function.keys.each do |k|
  puts "- function     : #{k}"
end
puts "\n"
## ONLY FOR EXAMPLE

# Run Webhooks application at root path
run Parse::Webhooks
