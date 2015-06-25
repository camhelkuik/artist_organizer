get "/location_menu" do
  erb :"locations/location_menu"
end
#-----------------------------------
# Add locations
#-----------------------------------
get "/add_location" do
  erb :"locations/add_location"
end

get "/save_location" do
  @new_entry = Location.add({"city" => params["city"], "state" => params["state"], "address" => params["address"]})
  erb :"locations/save_success"
end
#------------------------------------------
# Lists all of the locations Aplhabetically
#------------------------------------------
get "/list_locations" do
  erb :"locations/locations_list"
end

get "/view_location/:x" do
  @view = Location.find_rows("id", params["x"].to_i)
  erb :"locations/view_location"
end

#--------------------------------------------
# Delete locations
#--------------------------------------------
get "/delete_location_list" do
  erb :"locations/delete_list"
end

get "/delete_location/:x" do
  @d = Location.new("id" => params["x"].to_i)
  # @d.delete
#   erb :"locations/delete_success"
  if @d.delete_location
    erb :"delete_success"
  else
    erb :"delete_failure"
  end
end