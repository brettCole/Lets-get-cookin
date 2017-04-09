class RatingsController < ApplicationController

  def new
    @recipe = Recipe.find_by(params[:id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.valid? && @rating.save
    redirect_to recipe_path((params[:rating][:recipe_id]))
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :recipe_id, :review, :user_id)
  end

end
