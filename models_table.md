#Event Model
###events
ID          | name | applications_id | date | check_in_time | locations_id  | ammenities | contact_email | contact_phone 
-----------------------------------------------------------------------------------------------------------------------------------
primary key | text | foreign key     | real | text          | foreign key   | text       | text          | text


#Application Model
###applications
ID          | events_id   | application_fee | event_fee | submitted?      | accepted?       | due_date | locations_id | app_details
-------------------------------------------------------------------------------------------------------------------------------------
primary key | foregin key | real            | real      |integer (boolean)|integer (boolean)| real     | foregin key  | text


#Travel Model
###travels
ID          | events_id   | locations_id | transportation | departure_info | arrival_info | hotel_info | check_in_time
-------------------------------------------------------------------------------------------------------------------------
primary key | foregin key | foregin key  | text           | text           | text         | text       | text


#Location Model
###locations
ID          | city     | state      | address 
----------------------------------------------
primary key | text     | text       | text