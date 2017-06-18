class RecipesController < ApplicationController
  before_action :require_login, only: %i[new create]
  def index
    if params[:search]
      @recipes = Recipe.where('title LIKE ?', '%#{params[:search]}%')
    else
      @recipes = Recipe.all
    end
  end

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      flash[:error] = @recipe.errors.full_messages.join(', ')
      redirect_back(fallback_location: new_recipe_path)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ratings = @recipe.ratings.all
    @favorite = Favorite.new
    @rating = Rating.new
    respond_to do |format|
      format.html
      format.json { render json: @recipe }
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :directions,
                                   :prep_time, :cook_time, :gluten_free, :vegan,
                                   ingredients_attributes: %i[id quantity name])
  end
end
