class CreateRecipeIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :recipe_ingredients do |t|
      t.belongs_to :recipe, foreign_key: true
      t.belongs_to :ingredient, foreign_key: true
    end
  end
end
