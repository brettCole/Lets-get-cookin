class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :directions
      t.string :prep_time
      t.string :cook_time
      t.boolean :gluten_free
      t.boolean :vegan, default: false
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
