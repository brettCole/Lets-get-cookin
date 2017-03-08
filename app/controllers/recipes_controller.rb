class RecipesController < ApplicationController

  def index
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.create(recipe_params)
    if @recipe.valid? && @recipe.save
      binding.pry
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @recipe = Recipe.find_by(params[:id])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :directions, :vegan, :description, :ingredients_attributes => [:name])
  end

end
