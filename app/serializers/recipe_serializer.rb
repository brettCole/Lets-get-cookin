class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :directions, :prep_time, :cook_time, :gluten_free, :vegan
  has_many :ingredients
  has_many :recipe_ingredients
  has_many :ratings
  belongs_to :user
end
