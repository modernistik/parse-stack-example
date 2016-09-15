require 'parse/stack'

Dir[__dir__ + '/functions/**/*.rb'].each { |f| require(f) }
Dir[__dir__ + '/hooks/**/*.rb'].each { |f| require(f) }
