class EntreesController < ApplicationController
  def index
    @entrees = Entree.page(params[:page]).per(10)

    render("entrees/index.html.erb")
  end

  def show
    @entree = Entree.find(params[:id])

    render("entrees/show.html.erb")
  end

  def new
    @entree = Entree.new

    render("entrees/new.html.erb")
  end

  def create
    @entree = Entree.new

    @entree.name = params[:name]
    @entree.allergens_id = params[:allergens_id]
    @entree.restaurants_id = params[:restaurants_id]

    save_status = @entree.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/entrees/new", "/create_entree"
        redirect_to("/entrees")
      else
        redirect_back(:fallback_location => "/", :notice => "Entree created successfully.")
      end
    else
      render("entrees/new.html.erb")
    end
  end

  def edit
    @entree = Entree.find(params[:id])

    render("entrees/edit.html.erb")
  end

  def update
    @entree = Entree.find(params[:id])

    @entree.name = params[:name]
    @entree.allergens_id = params[:allergens_id]
    @entree.restaurants_id = params[:restaurants_id]

    save_status = @entree.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/entrees/#{@entree.id}/edit", "/update_entree"
        redirect_to("/entrees/#{@entree.id}", :notice => "Entree updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Entree updated successfully.")
      end
    else
      render("entrees/edit.html.erb")
    end
  end

  def destroy
    @entree = Entree.find(params[:id])

    @entree.destroy

    if URI(request.referer).path == "/entrees/#{@entree.id}"
      redirect_to("/", :notice => "Entree deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Entree deleted.")
    end
  end
end
