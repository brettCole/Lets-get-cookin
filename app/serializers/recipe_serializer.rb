class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :ratings
  belongs_to :user
end
