class Rating < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :rating, :review, presence: true
end
