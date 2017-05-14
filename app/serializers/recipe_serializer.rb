class RecipeSerializer < ActiveModel::Serializer
  attributes :title, :description, :directions, :prep_time, :cook_time, :gluten_free, :vegan
  has_many :ratings
end
