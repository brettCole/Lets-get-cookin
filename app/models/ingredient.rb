class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  # Strip neccassary white space
  auto_strip_attributes :name

  validates :name, presence: true
end
