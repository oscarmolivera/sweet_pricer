class Recipe < ApplicationRecord
  enum :recipe_type, [ :base, :topping ]
end
