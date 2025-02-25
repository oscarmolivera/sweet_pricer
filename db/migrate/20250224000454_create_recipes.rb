class CreateRecipes < ActiveRecord::Migration[8.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :recipe_type
      t.integer :size, default: 0
      t.integer :portion, default: 1

      t.timestamps
    end
  end
end
