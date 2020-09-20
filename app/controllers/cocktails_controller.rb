class CocktailsController < ApplicationController

  def index
    if params[:query].present?
      @cocktail = Cocktail.search_by_name(params[:query])
    else
      @cocktail = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @cockatail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_url, notice: 'Koktejl je bil uspešno izbrisan'
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
