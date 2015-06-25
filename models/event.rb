require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Event
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :name, :application_id, :date, :check_in_time, :location_id, :ammenities, :contact_email, :contact_phone
  attr_reader :id
  
  def initialize(options ={})
    @id = options["id"]
    @name = options["name"]
    @application_id = options["application_id"]
    @date = options["date"]
    @check_in_time = options["check_in_time"]
    @location_id = options["location_id"]
    @ammentities = options["ammentities"]
    @contact_email = options["contact_email"]
    @contact_phone = options["contact_phone"]
  end
  
  # Get all application records, sorted by due_date, from the database.
  #
  # Returns an Array containing Application objects.
  def self.all_sorted_by_date
    results = CONNECTION.execute('SELECT * FROM applications ORDER BY date ASC;')
    
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
    CONNECTION.execute("UPDATE events SET name = '#{self.name}', application_id = #{self.application_id},date = #{self.date},
    check_in_time = '#{self.check_in_time}', location_id = #{self.location_id}, ammenities = '#{self.ammenities}', 
     contact_email = '#{self.contact_email}', contact_phone = '#{self.contact_phone}' WHERE id = #{self.id};")
     
     return self
  end
  
end