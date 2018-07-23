class Order < ApplicationRecord
  belongs_to :user
  belongs_to :bill
  has_one :order_item
end
