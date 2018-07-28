class Order < ApplicationRecord
  belongs_to :cart
  has_one :bill
  has_many :order_item
  has_many :shoes, through: :order_items
  validates :address, presence: true

  def total_price items
    total = 0
    items.each do |item|
      total += item.total_price item
    end
    total
  end
end
