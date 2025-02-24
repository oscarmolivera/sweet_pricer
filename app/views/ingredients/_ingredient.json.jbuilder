json.extract! ingredient, :id, :name, :purchase_unit, :purchase_price, :purchase_quantity, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)
