get "/home" do
  erb :"main/homepage"
end

get "/add_menu" do
  erb :"main/add_menu"
end

get "/view_menu" do
  erb :"main/view_menu"
end

get "/update_menu" do
  erb :"main/update_menu"
end

get "/delete_menu" do
  erb :"main/delete_menu"
end