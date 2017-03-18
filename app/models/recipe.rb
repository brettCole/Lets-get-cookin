class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :favorites
  validates :title, :description, :directions, :ingredients , presence: true

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |attr|
      unless attr[:name] == ""
        ingredient = Ingredient.where(name: attr[:name].downcase).first_or_create
        self.ingredients << ingredient
      end
    end
  end

  def self.recipes_of_the_day
    self.order("Random()").limit(5)
  end

end
