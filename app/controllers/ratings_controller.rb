class RatingsController < ApplicationController

  def index
    @recipe = Recipe.find_by(params[:id])
  end

  def new
    @recipe = Recipe.find_by(params[:id])
    @rating = Rating.new
  end

  def create
    @recipe = Recipe.find_by(params[:id])
    @rating = Rating.new(rating_params)
    if @rating.save
      redirect_to recipe_path((params[:rating][:recipe_id]))
    else
      render :new
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :recipe_id, :review, :user_id)
  end

end
