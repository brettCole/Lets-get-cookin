class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  #validates :name, presence: true
  #add validation after creating javascript to dynamically create inputs

end
