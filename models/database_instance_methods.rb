require "active_support"
require "active_support/inflector"

module DatabaseInstanceMethods
  
  # Get the value of a field for a given row.
  #
  # field - String of the column name.
  #
  # Returns the String value of the cell in the table.
  def get(field)    
    result = CONNECTION.execute("SELECT * FROM #{self.table_name} WHERE id = #{@id}").first
    
    result[field]
  end
  
  def table_name
    table_name = self.class.to_s.pluralize.underscore
  end
  
  def delete
      CONNECTION.execute("DELETE FROM #{self.table_name} WHERE id = #{@id};")
  end
end