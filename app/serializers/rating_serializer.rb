class RatingSerializer < ActiveModel::Serializer
  attributes :rating, :review
  belongs_to :recipe
  belongs_to :user
end
