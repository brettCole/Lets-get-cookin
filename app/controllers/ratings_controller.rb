class RatingsController < ApplicationController

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @ratings = @recipe.ratings.all
    respond_to do |format|
      format.html
      format.json { render json: @ratings }
    end
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @rating = Rating.new
  end

  def create
    @recipe = Recipe.find_by(params[:id])
    @rating = Rating.new(rating_params)
    if @rating.save
      # redirect_to recipe_path((params[:rating][:recipe_id]))
      # render 'ratings/show', :layout => false
      render json: @rating, status: 201
    else
      render :new
    end
  end

  # show for ajax
  def show
    @recipe = Recipe.find_by(params[:recipe_id])
    @rating = @recipe.rating
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :recipe_id, :review, :user_id)
  end

end
