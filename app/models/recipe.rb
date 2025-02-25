class Recipe < ApplicationRecord
  has_many :formulas, dependent: :destroy
  has_many :ingredients, through: :formulas

  enum :recipe_type, [ :base, :topping ]
  enum :size, [:small, :medium, :family_size]

  TINITA_PRICE = 2
  TRIANGULO_PRICE = 3.5

  def batch_cost
    formulas.sum(&:cost)
  end

  def cost_per_serving
    batch_cost / portion
  end

  def profit_per_serving
    self.medium? ? TRIANGULO_PRICE - cost_per_serving : TINITA_PRICE - cost_per_serving
  end
end
