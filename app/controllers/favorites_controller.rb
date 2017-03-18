class FavoritesController < ApplicationController

  def index
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to user_favorites_path(current_user)
    else
      redirect_to recipes_path
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end

end
