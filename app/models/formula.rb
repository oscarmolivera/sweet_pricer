class Formula < ApplicationRecord
  belongs_to :recipe
  belongs_to :ingredient

  validates :quantity, numericality: { greater_than: 0 }
  validates :unit, presence: true

  def cost
    ingredient.price_per_base_unit * quantity
  end
end
