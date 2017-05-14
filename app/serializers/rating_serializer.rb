class RatingSerializer < ActiveModel::Serializer
  attributes :rating, :review
  belongs_to :recipe
end
