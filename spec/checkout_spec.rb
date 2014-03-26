require 'spec_helper'
require 'pry'

  describe Checkout do
    it {should belong_to :cashier}
    it {should belong_to :customer}
    new_cashier = Cashier.create({name: 'George', password: 'money'})

    new_customer = Customer.create({quantity: 4})
    new_customer.products.create({name: 'Carrot', price: 3.01})

    new_checkout = Checkout.create({cashier_id: new_cashier.id, customer_id: new_customer.id})
    binding.pry
    new_checkout.cashier_id.should eq new_cashier.id
end
