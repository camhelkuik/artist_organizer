#Event Model
###events
ID          | name_of_event | applications_id | date    | check_in_time | loations_id  | ammenities | contact_email | contact_phone 
-----------------------------------------------------------------------------------------------------------------------------------
primary key | text          | foreign key    | numeric | numeric       | foreign key | text       | text          | numeric


#Application Model
###applications
ID          | events_id   | application_fee | event_fee | submitted?      | accepted?       | due_date | locations_id | app_details
-------------------------------------------------------------------------------------------------------------------------------------
primary key | foregin key | numeric         | numeric   |numeric (boolean)|numeric (boolean)| numeric  | foregin key  | text


#Travel Model
###travels
ID          | events_id   | locations_id | transportation | departure_info | arrival_info | hotel_info | check_in_time
-------------------------------------------------------------------------------------------------------------------------
primary key | foregin key | foregin key  | text           | text           | text         | text       | numeric


#Location Model
###locations
ID          | city     | state      | address 
----------------------------------------------
primary key | text     | text       | text