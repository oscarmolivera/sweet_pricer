class Recipe < ApplicationRecord
  has_many :formulas, dependent: :destroy
  has_many :ingredients, through: :formulas

  enum :recipe_type, [ :base, :topping ]
  enum :size, [:small, :medium, :family_size]

  def total_cost
    formulas.sum(&:cost)
  end
end
