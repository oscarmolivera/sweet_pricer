class CreateIngredients < ActiveRecord::Migration[8.0]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.string :purchase_unit, null: false
      t.decimal :purchase_price, precision: 10, scale: 2, null: false
      t.decimal :purchase_quantity, precision: 10, scale: 2, null: false

      t.timestamps
    end
  end
end
