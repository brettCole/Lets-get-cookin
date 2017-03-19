class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites.all
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to user_favorites_path(current_user)
    else
      flash[:message] = "Already Favorited!"
      redirect_to (:back)
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end

end
