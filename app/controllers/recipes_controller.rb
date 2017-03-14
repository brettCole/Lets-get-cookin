class RecipesController < ApplicationController
  before_action :require_login, only: [:create]

  def index
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
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :description, :directions, :prep_time, :cook_time, :gluten_free, :vegan, :ingredients_attributes => [:name])
  end

end
