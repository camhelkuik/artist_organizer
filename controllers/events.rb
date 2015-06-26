
#--------------------------
# Add events
#---------------------------
get "/add_event" do
  erb :"events/add_event"
end

get "/save_event" do
  @new_entry = Event.add({"name" => params["name"], "applications_id" => params["applications_id"], "event_date" => params["event_date"],
   "check_in_time" => params["check_in_time"], "locations_id" => params["locations_id"], "ammenities" => params["ammenities"],
    "contact_email" => params["contact_email"],"contact_phone" => params["contact_phone"]})
   erb :"main/add_success"
end
#-----------------------------------------------------------------------------
# View events
#-----------------------------------------------------------------------------
get "/view_event_list/:x" do
  erb :"events/view_event_list"
end

get "/view_event/:x" do
  @view = Event.find_rows("id", params["x"].to_i)
  erb :"events/view_event"
end
#------------------------------------------------------------------------------
# Update applications
#------------------------------------------------------------------------------
get "/update_event" do
  erb :"events/update_event_list"
end

get "/update_event_form/:x" do
  @entry = Event.find(params["x"].to_i)
  erb :"events/update_event_form"
end

get "/change_event/:x" do
  @entry = Event.find(params["x"].to_i)
  @entry.name = params["name"] 
  @entry.applications_id = params["applications_id"]
  @entry.event_date = params["event_date"]
  @entry.check_in_time = params["check_in_time"]
  @entry.locations_id = params["locations_id"]
  @entry.ammenities = params["ammenities"]
  @entry.contact_email = params["contact_email"] 
  @entry.contact_phone = params["contact_phone"]   
  @entry.save
  erb :"main/update_success"
end
#--------------------------------------------------------------------------------
# Delete applications
#--------------------------------------------------------------------------------
get "/delete_event_list/:x" do
  erb :"events/delete_event_list"
end

get "/delete_event/:x" do
  @d = Event.new("id" => params["x"].to_i)
  @d.delete
  erb :"main/delete_success"
end