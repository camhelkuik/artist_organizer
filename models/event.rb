require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Event
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :name, :applications_id, :event_date, :check_in_time, :locations_id, :ammenities, :contact_email, :contact_phone
  attr_reader :id
  
  def initialize(options ={})
    @id = options["id"]
    @name = options["name"]
    @applications_id = options["applications_id"]
    @event_date = options["event_date"]
    @check_in_time = options["check_in_time"]
    @locations_id = options["locations_id"]
    @ammenities = options["ammenities"]
    @contact_email = options["contact_email"]
    @contact_phone = options["contact_phone"]
  end
  
  # Get all application records, sorted by due_date, from the database.
  #
  # Returns an Array containing Application objects.
  def self.all_sorted_by_date
    results = CONNECTION.execute('SELECT * FROM events ORDER BY event_date ASC;')
    
    results_as_objects = []
    
    results.each do |result_hash|
     results_as_objects << Event.new(result_hash)
    end
    
    return results_as_objects
  end
  
  # Allows information that was changed in ruby to be saved to SQL.
  #
  # Returns self, an object.
  def save
    CONNECTION.execute("UPDATE events SET name = '#{self.name}', applications_id = #{self.applications_id}, event_date = '#{self.event_date}',
    check_in_time = '#{self.check_in_time}', locations_id = #{self.locations_id}, ammenities = '#{self.ammenities}', 
     contact_email = '#{self.contact_email}', contact_phone = '#{self.contact_phone}' WHERE id = #{self.id};")
     
     return self
  end
  
end