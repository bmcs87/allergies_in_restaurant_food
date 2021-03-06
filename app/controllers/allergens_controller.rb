class AllergensController < ApplicationController
  before_action :current_user_must_be_allergen_user, :only => [:show, :edit, :update, :destroy]

  def current_user_must_be_allergen_user
    allergen = Allergen.find(params[:id])

    unless current_user == allergen.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Allergen.ransack(params[:q])
    @allergens = @q.result(:distinct => true).includes(:cuisines, :user, :restaurants).page(params[:page]).per(10)

    render("allergens/index.html.erb")
  end

  def show
    @entree = Entree.new
    @allergen = Allergen.find(params[:id])

    render("allergens/show.html.erb")
  end

  def new
    @allergen = Allergen.new

    render("allergens/new.html.erb")
  end

  def create
    @allergen = Allergen.new

    @allergen.name = params[:name]
    @allergen.reaction = params[:reaction]
    @allergen.restaurants_id = params[:restaurants_id]
    @allergen.user_id = params[:user_id]

    save_status = @allergen.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/allergens/new", "/create_allergen"
        redirect_to("/allergens")
      else
        redirect_back(:fallback_location => "/", :notice => "Allergen created successfully.")
      end
    else
      render("allergens/new.html.erb")
    end
  end

  def edit
    @allergen = Allergen.find(params[:id])

    render("allergens/edit.html.erb")
  end

  def update
    @allergen = Allergen.find(params[:id])

    @allergen.name = params[:name]
    @allergen.reaction = params[:reaction]
    @allergen.restaurants_id = params[:restaurants_id]
    @allergen.user_id = params[:user_id]

    save_status = @allergen.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/allergens/#{@allergen.id}/edit", "/update_allergen"
        redirect_to("/allergens/#{@allergen.id}", :notice => "Allergen updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Allergen updated successfully.")
      end
    else
      render("allergens/edit.html.erb")
    end
  end

  def destroy
    @allergen = Allergen.find(params[:id])

    @allergen.destroy

    if URI(request.referer).path == "/allergens/#{@allergen.id}"
      redirect_to("/", :notice => "Allergen deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Allergen deleted.")
    end
  end
end
