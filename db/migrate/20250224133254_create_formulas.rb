class CreateFormulas < ActiveRecord::Migration[8.0]
  def change
    create_table :formulas do |t|
      t.string :unit, null: false
      t.decimal :quantity, precision: 10, scale: 2, null: false
      t.references :recipe, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
