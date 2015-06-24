CONNECTION = SQLite3::Database.new("artist-scheduler.db")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS events (id PRIMARY KEY, name TEXT, applications_id INTEGER, date REAL, check_in_time TEXT, 
locations_id INTEGER, ammenities TEXT, contact_email TEXT, contact_phone TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS applications (id PRIMARY KEY, events_id INTEGER, application_fee REAL, event_fee REAL, 
submitted? INTEGER, accepted? TEXT, due_date REAL, locations_id INTEGER, application_deatils TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS travels (id PRIMARY KEY, events_id INTEGER, locations_id INTEGER, transportation TEXT, 
departure_info TEXT, arrival_info TEXT, hotel_info TEXT, check_in_time TEXT);")

CONNECTION.execute("CREATE TABLE IF NOT EXISTS locations (id PRIMARY KEY, city TEXT, state TEXT, adderss TEXT);")

CONNECTION.results_as_hash = true