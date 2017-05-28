class IngredientSerializer < ActiveModel::Serializer
  attributes :name

  has_many :recipes
  has_many :recipe_ingredients
end
