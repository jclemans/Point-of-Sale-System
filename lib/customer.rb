class Customer < ActiveRecord::Base

  # belongs_to :checkouts
  has_many :products
  # # has_many :checkouts
  # # has_many :cashiers, through: :checkouts
  has_many :checkouts
  has_many :cashiers, through: :checkouts
end
