class Rating < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :rating, :review, presence: true

  scope :most_popular, -> {
    joins(:recipe).group(:recipe_id).sum(:rating)
    binding.pry
  }

end
