class Cart < ApplicationRecord
  has_many :cart_items
  belongs_to :user
  has_many :orders
  has_many :shoes, through: :cart_items

  def total_price items
    total = 0
    items.each do |item|
      total += item.total_price item
    end
    total
  end

  def size
    cart_items.count
  end
end
