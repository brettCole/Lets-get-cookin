class RecipeSerializer < ActiveModel::Serializer
  attributes :title
  has_many :ratings
  belongs_to :user
end
