require 'spec_helper'
require 'pry'

describe Customer do
  it 'can get the products name from an item in the cart/customer' do
    # product = Product.create({name: 'Carrot', price: 3.01})
    cart = Customer.create({quantity: 4})
    cart.products.create({name: 'Carrot', price: 3.01})
    # binding.pry
    cart.products.first.name.should eq 'Carrot'
  end

  it {should have_many :products}
end

