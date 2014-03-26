class Checkout < ActiveRecord::Base
  belongs_to :cashier
  belongs_to :customer

  # # has_many :cashiers
  # has_many :customers
  # has_many :products, through: :customers
end
