
class Cashier < ActiveRecord::Base
  has_many :checkouts
  has_many :customers, through: :checkouts
end
