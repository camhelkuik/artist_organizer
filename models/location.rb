require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Location
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :city, :state, :address, :longitude, :latitude
  attr_reader :id
  
  def initialize(options = {})
    @id = options["id"]
    @city = options["city"]
    @state = options["state"]
    @address = options["address"]
    @longitude = options["longitude"]
    @latitude = options["latitude"]
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
   
  # Get all location records, sorted by city, from the database.
  #
  # Returns an Array containing location objects.
  def self.sorted
    results = CONNECTION.execute('SELECT * FROM locations ORDER BY city ASC;')
    
    return self.results_as_objects(results)  
  end
  
  def self.get_long_lat
    results = Geocoder.search(address, city, state)  
  end
  
  # Allows information that was changed in ruby to be saved to SQL.
  #
  # Returns self, an object.
  def save
    CONNECTION.execute("UPDATE locations SET city = '#{self.city}', state = '#{self.state}', address = '#{self.address}',
    longitude = #{self.longitude}, latitude = #{self.latitude} WHERE id = #{self.id};")
     return self
  end
  
  # Deletes a row from the table.
  #
  # Returns a Boolean.
  def delete_location
    if Event.find_rows("locations_id", @id) == []
      self.delete
    else
      false
    end
  end
end