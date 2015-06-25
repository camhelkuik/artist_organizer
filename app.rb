require "pry"
require "sinatra"
require "sinatra/reloader"
require 'active_support/core_ext/object/blank'

#SQL/databse
require "sqlite3"
require_relative "database_setup.rb"

#Models
require_relative "models/application.rb"
require_relative "models/location.rb"
require_relative "models/travel.rb"

#Controllers
require_relative "controllers/main.rb"
require_relative "controllers/applications.rb"
require_relative "controllers/locations.rb"
require_relative "controllers/travels.rb"