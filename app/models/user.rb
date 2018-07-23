class User < ApplicationRecord
  has_many :cards
  has_many :orders
  has_many :bills
end
