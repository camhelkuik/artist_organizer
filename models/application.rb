require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Application
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  
  
end