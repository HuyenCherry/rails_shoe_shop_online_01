class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :shoe
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: Settings.greater_than}

  def total_price item
    price_shoes = if shoe.discount
      shoe.price * item.quantity - shoe.discount.percent * 0.01 * shoe.price
    else
      shoe.price * item.quantity
    end
    total = total.to_i + price_shoes
  end
end
