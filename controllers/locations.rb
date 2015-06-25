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
  @new_entry = Location.new({"city" => params["city"], "state" => params["state"], "address" => params["address"]})
  erb :"save_success"
end