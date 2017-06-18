class RecipeIngredient < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  # Strip neccassary white space
  auto_strip_attributes :quantity
end
