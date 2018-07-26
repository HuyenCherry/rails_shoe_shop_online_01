class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user
  has_many :orders
  has_many :shoes, through: :cart_items

  def percent
    if shoe.discount
      price_shoes = shoe.price * item.quantity - 
        shoe.discount.percent * 0.01  * shoe.price
    else
      price_shoes = shoe.price * item.quantity
    end
    total = total + price_shoes
  end
end
