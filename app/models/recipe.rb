class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :favorites
  has_many :ratings
  validates :title, :description, :directions, presence: true

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, attr|
      ingredient = Ingredient.find_or_create_by(name: attr[:name])
      self.recipe_ingredients.build(:ingredient => ingredient, :quantity => attr[:quantity])
      
    end
  end

  # def ingredients_attributes=(attributes)
  #   # find or create ingredient by attributes[0]["name"] set to variable
  #   # if ingredient then recipe.recipe_ingredients.create(ingredient: ingredient, quantity: attributes[0]["quantity"])
  #   attributes.values.each do |attr|
  #     unless attr[:name] == ""
  #       ingredient = Ingredient.first_or_create!(:name => attr[:name].downcase)
  #       self.ingredients << ingredient
  #       if ingredient
  #         recipe_ingredient = RecipeIngredient.first_or_create!(:quantity => attr[:quantity])
  #         binding.pry
  #         self.recipe_ingredients << recipe_ingredient
  #       end
  #     end
  #   end
  # end

  def self.recipes_of_the_day
    self.order("Random()").limit(5)
  end

end
