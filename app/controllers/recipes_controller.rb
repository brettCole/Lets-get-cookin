class RecipesController < ApplicationController
  before_action :require_login, only: [:create]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.valid? && @recipe.save
      binding.pry
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ratings = @recipe.ratings.all
    @favorite = Favorite.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update!(recipe_params)
    redirect_to recipe_path(recipe)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :directions, :prep_time, :cook_time, :gluten_free, :vegan, :ingredients_attributes => [:name])
  end

end
