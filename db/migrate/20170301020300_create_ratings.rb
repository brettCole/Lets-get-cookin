class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :recipe, foreign_key: true
      t.integer :rating
      t.belongs_to :user, foreign_key: true
      t.text :review

      t.timestamps
    end
  end
end
