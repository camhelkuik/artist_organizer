
#-----------------------------------
# Add locations
#-----------------------------------
get "/add_location" do
  erb :"locations/add_location"
end

get "/save_location" do
  @new_entry = Location.add({"city" => params["city"], "state" => params["state"], "address" => params["address"]})
  erb :"main/add_success"
end
#------------------------------------------
# Lists all of the locations Aplhabetically
#------------------------------------------
get "/list_locations" do
  erb :"locations/locations_list"
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
    erb :"main/delete_success"
  else
    erb :"locations/delete_failure"
  end
end