require "rubygems"
require "bundler/setup"

require "pry"
require "sinatra"
require "sinatra/reloader"
require 'active_support/core_ext/object/blank'
require "geocoder"

configure :development do
 ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'photosite.db')
end

configure :production do
 db = URI.parse(ENV['DATABASE_URL'])
 ActiveRecord::Base.establish_connection(
 :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
 :host => db.host,
 :username => db.user,
 :password => db.password,
 :database => db.path[1..-1],
 :encoding => 'utf8'
 )
end

#SQL/databse
require "sqlite3"
require "active_record"
require "pg"
require_relative "database_setup.rb"

#Models
require_relative "models/application.rb"
require_relative "models/location.rb"
require_relative "models/travel.rb"
require_relative "models/event.rb"

#Controllers
require_relative "controllers/main.rb"
require_relative "controllers/applications.rb"
require_relative "controllers/locations.rb"
require_relative "controllers/travels.rb"
require_relative "controllers/events.rb"

