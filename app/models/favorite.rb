class Favorite < ApplicationRecord
  belongs_to :recipe
  belongs_to :user
  validates :recipe_id, :user_id, uniqueness: true
end
