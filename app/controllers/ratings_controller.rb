class RatingsController < ApplicationController

  def new

    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @rating.valid? && @rating.save
    binding.pry
    redirect_to recipe_path()
  end

  private

  def rating_params
    params.require(:rating).permit(:rating, :recipe_id, :review, :user_id)
  end

end
