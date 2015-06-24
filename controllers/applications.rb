get "/app_menu" do
  erb :"applications/app_menu"
end
#----------------------------------------------------------------------------
# Add applications
#----------------------------------------------------------------------------
get "/add_application" do
  erb :"applications/add_app"
end

get "/save_application" do
  @new_entry = Application.add({"events_id" => params["events_id"], "application_fee" => params["application_fee"], "event_fee" => params["event_fee"],
   "submitted" => params["submitted"], "accepted" => params["accepted"], "due_date" => params["due_date"], "locations_id" => params["locations_id"], 
   "application_details" => params["application_details"]})
   erb :"applications/app_success"
end
#-----------------------------------------------------------------------------
# View applications
#-----------------------------------------------------------------------------
get "/view_application_list/:x" do
  erb :"applications/view_app_list"
end

# Can't run .each
get "/view_app/:x" do
  @view = Application.where_find_rows("id", params["x"].to_i)
  erb :"applications/view_app"
end
#------------------------------------------------------------------------------
# Update applications
#------------------------------------------------------------------------------
get "/update_application" do
  erb :"applications/update_app_list"
end

get "/update_form/:x" do
  erb :"applications/update_form"
end

get "/change_app/:x" do
    entry = Application.find_as_objects(params["x"].to_i)
    unless params["events_id"].blank?
      entry.events_id = params["events_id"]
    end
    unless params["application_fee"].blank?
      entry.application_fee = params["applications_fee"]
    end
    unless params["event_fee"].blank?
      entry.event_fee = params["event_fee"]
    end
    unless params["submitted"].blank?
      entry.submitted = params["submitted"]
    end
    unless params["accepted"].blank?
      entry.accepted = params["accepted"]
    end
    unless params["due_date"].blank?
      entry.due_date = params["due_date"]
    end
    unless params["locations_id"].blank?
      entry.locations_id = params["locations_id"]
    end
    unless params["application_details"].blank?
      entry.application_details = params["application_details"]
    end
  entry.save
  erb :"applications/update_success"
end
#--------------------------------------------------------------------------------
# Delete applications
#--------------------------------------------------------------------------------
get "/delete_application/:x" do
  erb :"applications/delete_app_list"
end

get "/delete_app/:x" do
  @d = Application.new("id" => params["x"].to_i)
  @d.delete
  erb :"applications/delete_success"
  # if @d.delete_app
 #    erb :"delete_success"
 #  else
 #    erb :"delete_failure"
 #  end
end