class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    if params[:query].present?
      @cocktail = Cocktail.search_by_name(params[:query])
    else
      @cocktail = Cocktail.all
    end
  end

  def new
    @cocktail = Cocktail.new
    @cocktail.user = current_user
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @review = Review.new
    @user = @cocktail.user
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.user = current_user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail), notice: 'Koktejl je uspešno ustvarjen!'
    else
      render 'new'
    end
  end

  def edit
    @cocktail = Cocktail.find(params[:id])
  end

  def update
    @cocktail = Cocktail.find(params[:id])
    @cocktail.update(cocktail_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to user_path(current_user), notice: 'Koktejl je bil uspešno izbrisan'
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name, :photo, :user_id, :description)
  end

end
