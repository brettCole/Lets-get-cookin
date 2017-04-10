class Rating < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :rating, :review, presence: true

  # def self.highest_rated
  #   found_recipe = Recipe.find(self.joins(:recipe).group(:recipe_id).sum(:rating).max_by { |key, value| value }[0])
  #   found_recipe.title
  # end
  scope :highest_rated, -> { Recipe.find(self.joins(:recipe).group(:recipe_id).sum(:rating).max_by { |key, value| value }[0]) }

end
