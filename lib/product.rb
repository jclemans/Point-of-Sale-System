class Product < ActiveRecord::Base
  belongs_to :customer
  # has_one :checkout
end
