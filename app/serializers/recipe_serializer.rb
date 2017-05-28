class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :ingredients
  has_many :recipe_ingredients
  has_many :ratings
  belongs_to :user
end
