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
  @view = Application.find_rows("id", params["x"].to_i)
  erb :"applications/view_app"
end
#------------------------------------------------------------------------------
# Update applications
#------------------------------------------------------------------------------
get "/update_application" do
  erb :"applications/update_app_list"
end

get "/update_form/:x" do
  @entry = Application.find(params["x"].to_i)
  erb :"applications/update_form"
end

get "/change_app/:x" do
  @entry = Application.find(params["x"].to_i)
      @entry = "#{params[events_id]}" 
      @entry = "#{params[application_fee]}"
      @entry = "#{params[event_fee]}"
      @entry = "#{params['submitted']}"
      @entry = "#{params['accepted']}"
      @entry = "#{params[locations_id]}"
      @entry = "#{params['application_details']}"    
  @entry.save
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