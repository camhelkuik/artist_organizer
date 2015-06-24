require "pry"
require "sinatra"
require "sinatra/reloader"

#SQL/databse
require "sqlite3"
require_relative "database_setup.rb"

#Models
require_relative "models/application.rb"

#Controllers
require_relative "controllers.main.rb"
require_relative "controllers.applications.rb"