require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Location
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :city, :state, :address
  attr_reader :id
  
  def initialize(options = {})
    @id = options["id"]
    @city = options["city"]
    @state = options["state"]
    @address = options["address"]
  end
  
  # Finds an existing entry in the table and creates an object for it.
  #
  # id - Integer, location id
  #
  # Returns a new object. 
  def self.find_as_objects(id)
     result = self.find(id).first
    
     Location.new(result)
   end
   
   # Allows information that was changed in ruby to be saved to SQL.
   #
   # Returns self, an object.
   def save
     CONNECTION.execute("UPDATE locations SET city = '#{self.city}', state = '#{self.state}', address = '#{self.address}' WHERE id = #{self.id};")
      return self
   end
  
  # Deletes a row from the table.
  #
  # Returns a Boolean.
  def delete_location
    if Event.where_find_rows("locations_id", self.id) == []
      self.delete
    else
      false
    end
  end
end