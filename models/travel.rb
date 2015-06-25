require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Travel
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :events_id, :locations_id, :transportation, :departure_info, :arrival_info, :hotel_info, :check_in_time
  attr_reader :id
  
  def initialize(options ={})
    @id = options["id"]
    @events_id = options["events_id"]
    @locations_id = options["locations_id"]
    @transportation = options["transportation"]
    @departure_info = options["departure_info"]
    @arrival_info = options["arrival_info"]
    @hotel_info = options["hotel_info"]
    @check_in_time = options["check_in_time"]
  end
  
  # Get all travel records, sorted by event_id, from the database.
  #
  # Returns an Array containing travel objects.
  def self.sorted_event
    results = CONNECTION.execute('SELECT * FROM travels ORDER BY events_id ASC;')
    
    results_as_objects = []
    
    results.each do |result_hash|
     results_as_objects << Travel.new(result_hash)
    end
    
    return results_as_objects
  end
  
  # Allows information that was changed in ruby to be saved to SQL.
  #
  # Returns self, an object.
  def save
    CONNECTION.execute("UPDATE travels SET events_id = #{self.events_id}, locations_id = #{self.locations_id},
    transportation = '#{self.transportation}', departure_info = '#{self.departure_info}', arrival_info = '#{self.arrival_info}', 
    hotel_info = '#{self.hotel_info}', check_in_time = '#{self.check_in_time}' WHERE id = #{self.id};")
     
     return self
  end
  
  # Deletes a row if the event_id is equal to a blank Array
  #
  # Returns a boolean
  def delete_travel
    if Travel.find_rows("event_id", @id) == []
      self.delete
    else
      false
    end   
  end
  
end