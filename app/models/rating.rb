class Rating < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :rating, :review, presence: true

  scope :highest_rated, -> { Recipe.find(self.joins(:recipe).group(:recipe_id).sum(:rating).max_by { |key, value| value }.first) }
end
