Rails.application.routes.draw do
  # Routes for the Allergen resource:
  # CREATE
  get "/allergens/new", :controller => "allergens", :action => "new"
  post "/create_allergen", :controller => "allergens", :action => "create"

  # READ
  get "/allergens", :controller => "allergens", :action => "index"
  get "/allergens/:id", :controller => "allergens", :action => "show"

  # UPDATE
  get "/allergens/:id/edit", :controller => "allergens", :action => "edit"
  post "/update_allergen/:id", :controller => "allergens", :action => "update"

  # DELETE
  get "/delete_allergen/:id", :controller => "allergens", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
