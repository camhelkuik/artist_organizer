
# CONNECTION = SQLite3::Database.new("artist-scheduler.db")

# CONNECTION.execute("CREATE TABLE IF NOT EXISTS events (id INTEGER PRIMARY KEY, name TEXT, applications_id INTEGER, event_date TEXT, check_in_time TEXT,
# locations_id INTEGER, ammenities TEXT, contact_email TEXT, contact_phone TEXT);")

# CONNECTION.execute("CREATE TABLE IF NOT EXISTS applications (id INTEGER PRIMARY KEY, events_id INTEGER, application_fee REAL, event_fee REAL,
# submitted TEXT, accepted TEXT, due_date TEXT, locations_id INTEGER, application_details TEXT);")

# CONNECTION.execute("CREATE TABLE IF NOT EXISTS travels (id INTEGER PRIMARY KEY, events_id INTEGER, locations_id INTEGER, transportation TEXT,
# departure_info TEXT, arrival_info TEXT, hotel_info TEXT, check_in_time TEXT);")

# CONNECTION.execute("CREATE TABLE IF NOT EXISTS locations (id INTEGER PRIMARY KEY, city TEXT, state TEXT, address TEXT, longitude REAL, latitude REAL);")

# CONNECTION.results_as_hash = true


ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'artist_scheduler.db')

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)


unless ActiveRecord::Base.connection.table_exists?(:events)
  ActiveRecord::Base.connection.create_table :events do |t|
    t.string :name
    t.integer :applications_id
    t.string :event_date
    t.string :check_in_time
    t.integer :locations_id
    t.text :ammenities
    t.string :contact_email
    t.string :contact_phone
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:applications)
  ActiveRecord::Base.connection.create_table :applications do |t|
    t.integer :events_id
    t.float :application_fee
    t.float :event_fee
    t.string :submitted
    t.string :accepted
    t.string :due_date
    t.integer :locations_id
    t.string :application_details
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:travels)
  ActiveRecord::Base.connection.create_table :travels do |t|
    t.integer :events_id
    t.integer :locations_id
    t.string :transportation
    t.text :departure_info
    t.text :arrival_info
    t.text :hotel_info
    t.string :check_in_time
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:locations)
  ActiveRecord::Base.connection.create_table :locations do |t|
    t.string :city
    t.string :state
    t.string :address
    t.float :longitude
    t.float :lattitude
  end  
end