class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :purchase_unit, presence: true
  validates :purchase_price, numericality: { greater_than: 0 }
  validates :purchase_quantity, numericality: { greater_than: 0 }

  # Calculate price per base unit (e.g., per gram or per ml)
  def price_per_base_unit
    purchase_price / purchase_quantity
  end
end
