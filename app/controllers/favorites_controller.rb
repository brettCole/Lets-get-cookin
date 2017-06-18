class FavoritesController < ApplicationController
  def index
    @favorites = current_user.favorites.all
    respond_to do |format|
      format.html
      format.json { render json: @favorites }
    end
  end

  def create
    @favorite = Favorite.new(favorite_params)
    if @favorite.save
      redirect_to user_favorites_path(current_user)
    else
      flash[:message] = 'Already Favorited!'
      redirect_to :back
    end
  end

  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.delete
    redirect_to user_path(current_user)
  end

  private

  def favorite_params
    params.require(:favorite).permit(:recipe_id, :user_id)
  end
end
