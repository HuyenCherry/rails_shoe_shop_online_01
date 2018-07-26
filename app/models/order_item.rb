class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :shoe
  validates :quantity, presence: true,
    numericality: {only_integer: true, greater_than: Settings.greater_than}
end
