require_relative "database_class_methods.rb"
require_relative "database_instance_methods.rb"

class Application
  extend DatabaseClassMethods
  include DatabaseInstanceMethods
  
  attr_accessor :application_fee, :event_fee, :submitted, :accepted, :due_date, :application_details, :events_id, :locations_id
  attr_reader :id
  
  def initialize(options ={})
    @id = options["id"]
    @events_id = options["events_id"]
    @application_fee = options["application_fee"]
    @event_fee = options["event_fee"]
    @submitted = options["sumitted"]
    @accepted = options["accepted"]
    @due_date = options["due_date"]
    @locations_id = options["locations_id"]
    @application_details = options["application_details"]
  end
  
  # Finds an existing entry in the table and creates an object for it.
  #
  # id - Integer, the music id
  #
  # Returns a new Object. 
  def self.find_as_objects(id)
    result = self.find(id).first
    
    Application.new(result)
  end
  
  # Allows all the rows of a certain column to be read.
  #
  # field_name - String, the column name to search for the specified id
  # id         - Integer, the id to be read.
  #
  # Returns an Array of objects of all the entries in a specified column.
  def self.find_rows(field_name, id)
    results = self.find_rows(field_name, id)
    results_as_objects = []

    results.each do |result_hash|
    results_as_objects << Application.new(result_hash)
    end

    return results_as_objects
  end
  
  # Get all application records, sorted by due_date, from the database.
  #
  # Returns an Array containing Application objects.
  def self.all_sorted_by_date
    results = CONNECTION.execute('SELECT * FROM applications ORDER BY due_date ASC;')
    
    results_as_objects = []
    
    results.each do |result_hash|
      results_as_objects << Application.new(result_hash)
    end
    
    return results_as_objects
  end
  
  # Allows information that was changed in ruby to be saved to SQL.
  #
  # Returns self, an object.
  def save
    CONNECTION.execute("UPDATE applications SET events_id = #{@events_id}, application_fee = #{@application_fee}, event_fee = #{@event_fee},
     submitted = '#{@submitted}', accepted = '#{@accepted}', due_date = '#{@due_date}', locations_id = #{@locations_id}, application_details = '#{@application_details}'
     WHERE id = #{@id};")
     return self
  end
  
  # Deletes a row if the value is only equal to "no".
  #
  # Returns a boolean
  def delete_app
    if Application.find_rows("accepted", @id) == "no"
      self.delete
    else
      false
    end   
  end
  
end