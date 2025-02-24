class Recipe < ApplicationRecord
  enum :recipe_type, [ :base, :topping ]
  enum :size, [:small, :medium, :family_size]
end
