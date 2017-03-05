class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.values.each do |attr|
      unless attr[:name] == ""
        ingredient = Ingredient.where(name: attr[:name].downcase).first_or_create
        self.ingredients << ingredient
      end
    end
  end

end
