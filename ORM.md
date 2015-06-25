#ORM
ORM stands for Object Relational Mapping. ORM transfers data from one kind of system to another. For example my ORM is used to relate Ruby object classes to data tables in SQL and the object instances are related to the rows in the tables. 

An example of how this works would be the all class method. This method uses Ruby to get information from the SQL table. In this case it is accessing the entire table and not just a particular row.

```ruby
def all
    table_name = self.to_s.pluralize.underscore
     
    results = CONNECTION.execute("SELECT * FROM #{table_name}")
    results_as_objects = []
        
    results.each do |result_hash|
     results_as_objects << self.new(result_hash)
    end
     
    return results_as_objects
end
```
The first two lines in the above code acesses the database and returns all of the rows in the table as an Array of Hashes. The rest of the above code then turns the Array of Hashes into an Array of Objects. The Object's attributes are the columns of the table and the object itself is one row of the table. 
 