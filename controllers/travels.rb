get "/travel_menu" do
  erb :"travels/travel_menu"
end
#-----------------------------------
# Add Travel Plans
#-----------------------------------
get "/add_travel" do
  erb :"travels/add_travel"
end

get "/save_travel" do
  @new_entry = Travel.add({"events_id" => params["events_id"], "locations_id" => params["locations_id"], "transportation" => params["transportation"], 
    "departure_info" => params["departure_info"], "arrival_info" => params["arrival_info"], "hotel_info" => params["hotel_info"], 
    "check_in_time" => params["check_in_time"]})
    
    erb :"travels/add_success"
end
#----------------------------------
# View Travel Plans
#----------------------------------
get "/travel_list" do
  erb :"travels/travel_list"
end

get "/view_travel" do
  @view = Travel.find_rows("id", params["x"].to_i)
  erb :"travels/view_travel"
end
#-----------------------------------
# Update Travel Plans
#-----------------------------------
get "/update_travel_list" do
  erb :"travels/update_list"
end

get "/update_form_travel/:x" do
  @entry = Travel.find(params["x"].to_i)
  erb :"travels/update_form_travel"
end

get "/change_travel/:x" do
  @entry = Travel.find(params["x"].to_i)
  @entry.events_id = params["events_id"] 
  @entry.locations_id = params["locations_id"]
  @entry.transportation = params["transportation"]
  @entry.departure_info = params["departure_info"]
  @entry.arrival_info = params["arrival_info"]
  @entry.hotel_info = params["hotel_info"]
  @entry.check_in_time = params["check_in_time"]   
  @entry.save
  erb :"travels/update_success"
end
#-------------------------------------------
# Delete travel Plans
#--------------------------------------------
get "/delete_list" do
  erb :"travels/delete_list"
end

get "/delete_travel" do
  @d = travel.new("id" => params["x"].to_i)
  @d.delete
  erb :"travels/delete_success"
  # if @d.delete_app
 #    erb :"delete_success"
 #  else
 #    erb :"delete_failure"
 #  end
end