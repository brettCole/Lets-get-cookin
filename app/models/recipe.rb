class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, dependent: :destroy
  has_many :favorites
  has_many :ratings
  validates :title, :description, :directions, presence: true

  # Strip neccassary white space
  auto_strip_attributes :title, :description, :directions, :prep_time, :cook_time, :squish => true

  # find or create ingredient by attributes[0]["name"] set to variable
  # if ingredient then recipe.recipe_ingredients.create(ingredient: ingredient, quantity: attributes[0]["quantity"])
  def ingredients_attributes=(ingredients_attributes)
    ingredients_attributes.each do |i, attr|
      unless attr[:name].blank?
        ingredient = Ingredient.find_or_create_by(:name => attr[:name])

        if self.recipe_ingredients.ids.empty?
          self.recipe_ingredients.build(:ingredient => ingredient, :quantity => attr[:quantity])

        else
          self.recipe_ingredients[i.to_i].update(:ingredient => ingredient, :quantity => attr[:quantity])
        end
      end
    end
  end

  def self.recipes_of_the_day
    self.order("Random()").limit(5)
  end

end
