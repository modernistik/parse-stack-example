require 'parse/stack'
# https://github.com/modernistik/parse-stack#connection-setup

# Query caching (optional)
cache = ENV['REDIS_URL'].present? ? Moneta.new(:Redis, url: ENV['REDIS_URL']) : nil

Parse.setup server_url: ENV['PARSE_SERVER_URL'],
                app_id: ENV['PARSE_APP_ID'],
               api_key: ENV['PARSE_API_KEY'],
            master_key: ENV['PARSE_MASTER_KEY'],
               logging: false,
                 cache: cache
