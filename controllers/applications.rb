get "/app_menu" do
  erb :"applications/app_menu"
end

get "/add_application" do
  erb :"applications/add_app"
end

get "/save_application" do
  @new_entry = Application.add({"events_id" => params["events_id"], "application_fee" => ["application_fee"], "event_fee" => ["event_fee"],
   "submitted" => ["submitted"], "accepted" => ["accepted"], "due_date" => ["due_date"], "locations_id" => ["locations_id"], 
   "application_details" => ["application_details"]})
   erb :"app_success.erb"
end