class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :shoe

  def total_price item
    price_shoes = if shoe.discount
      shoe.price * item.quantity - shoe.discount.percent * 0.01 * shoe.price
    else
      shoe.price * item.quantity
    end
    total = total.to_i + price_shoes
  end
end
