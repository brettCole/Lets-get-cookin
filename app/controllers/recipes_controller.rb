class RecipesController < ApplicationController
  before_action :require_login, only: [ :new, :create ]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredient = @recipe.ingredients.build
    # @recipe.recipe_ingredients.build.build_ingredient
    # 2.times { @recipe.recipe_ingredients.build.build_ingredient }
    # 5.times { @recipe.recipe_ingredients.build.build_ingredient }
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    binding.pry
    if @recipe.save
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
    params.require(:recipe).permit(:title, :description, :directions, :prep_time, :cook_time, :gluten_free, :vegan,
    :ingredients_attributes => [:quantity, :name])
  end

end
