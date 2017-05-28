class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :quantity

  belongs_to :ingredients
end
