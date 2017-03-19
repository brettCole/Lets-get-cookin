class FavoritesController < ApplicationController

  def index
    @favorites = current_user.favorites.all
  end

  def create
    @recipe = params[:recipe_id]
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to user_favorites_path(current_user)
    else
      flash.now[:message] = "Already Favorited!"
      render recipe_path(@recipe)
    end
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end

end
