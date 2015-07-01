
#-----------------------------------
# Add locations
#-----------------------------------
get "/add_location" do
  erb :"locations/add_location"
end

get "/save_location" do
  @new_entry = Location.add({"city" => params["city"], "state" => params["state"], "address" => params["address"]})
  long_lat = Geocoder.search("#{params["address"]}, #{params["city"]}, #{params["state"]}").map(&:geometry)
  # x = []
  # Geocoder.search("#{params["address"]}, #{params["city"]}, #{params["state"]}").each do |y|
  #  x << y.send(:geometry)
  # end
  
  @new_entry.longitude = (long_lat[0]["location"]["lng"])
  @new_entry.latitude = (long_lat[0]["location"]["lat"])
  @new_entry.save
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