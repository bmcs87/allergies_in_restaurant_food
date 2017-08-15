class AllergensController < ApplicationController
  def index
    @allergens = Allergen.all

    render("allergens/index.html.erb")
  end

  def show
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
