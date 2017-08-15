Rails.application.routes.draw do
  # Routes for the Entree resource:
  # CREATE
  get "/entrees/new", :controller => "entrees", :action => "new"
  post "/create_entree", :controller => "entrees", :action => "create"

  # READ
  get "/entrees", :controller => "entrees", :action => "index"
  get "/entrees/:id", :controller => "entrees", :action => "show"

  # UPDATE
  get "/entrees/:id/edit", :controller => "entrees", :action => "edit"
  post "/update_entree/:id", :controller => "entrees", :action => "update"

  # DELETE
  get "/delete_entree/:id", :controller => "entrees", :action => "destroy"
  #------------------------------

  # Routes for the Restaurant resource:
  # CREATE
  get "/restaurants/new", :controller => "restaurants", :action => "new"
  post "/create_restaurant", :controller => "restaurants", :action => "create"

  # READ
  get "/restaurants", :controller => "restaurants", :action => "index"
  get "/restaurants/:id", :controller => "restaurants", :action => "show"

  # UPDATE
  get "/restaurants/:id/edit", :controller => "restaurants", :action => "edit"
  post "/update_restaurant/:id", :controller => "restaurants", :action => "update"

  # DELETE
  get "/delete_restaurant/:id", :controller => "restaurants", :action => "destroy"
  #------------------------------

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
