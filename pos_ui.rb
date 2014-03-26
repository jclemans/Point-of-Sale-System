require 'active_record'
require 'pry'

require './lib/product'
require './lib/cashier'
require './lib/customer'
require './lib/checkout'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['development'])

def welcome
  puts "Welcome to the POS system."
  cashier_login
  menu
end

def cashier_login
  puts "You've successfully logged in as a cashier!"
end


def menu
  choice = nil
  until choice == 'x'
    puts "Press 'a' to add a product, 'l' to list all, or 'd' to delete a product."
    puts "Enter 's' to begin shopping, 'sl' to list all items in cart."
    puts "Enter 'x' to logout."
    puts "Press 'c' to create a new cashier, 'cl' to list all cashiers."
    puts "Enter 'h' to check-out."
    choice = gets.chomp
    case choice
    when 'a'
      add_product
    when 'l'
      list_products
    when 'd'
      delete_product
    when 's'
      add_to_cart
    when 'sl'
      list_cart
    when 'c'
      add_cashier
    when 'h'
      checkout
    when 'cl'
      list_cashiers
    when 'x'
      puts "See ya!"
    else
      puts "Invalid entry. Please enter a new command."
    end
  end
end

def add_product
  puts "Enter product name:"
  product_name = gets.chomp
  puts "What is the price for #{product_name}?"
  product_price = gets.chomp
  product = Product.create({name: product_name, price: product_price})
  puts "#{product_name} has been added at #{product_price}."
end

def delete_product
  puts "Enter name of product to delete:"
  to_delete = gets.chomp
  product = Product.where({name: to_delete})
  Product.delete(product.first.id)
  puts "#{product} has been deleted!"

end

def list_products
  puts "List of all products in the system:\n\n"
  products = Product.all
  products.each { |product| puts product.name + " $" + product.price.to_s}
end

def add_cashier
  puts "Please enter the name of the new cashier: "
  name_c = gets.chomp
  puts "Please enter a new password:"
  password_c = gets.chomp
  pass_valid(password_c)
  new_cashier = Cashier.create({name: name_c, password: password_c})
  "The new cashier has been made!"
end

def pass_valid(password)
return true

end

def list_cashiers
  puts "Here is a list of all the current cashiers"
  cashiers = Cashier.all
  cashiers.each do |cashier|
    puts cashier.name
  end
end

def add_to_cart
  list_products
  puts "Enter the name of the product to add it to your cart:"
  choice = gets.chomp
  puts "Enter a quantity:"
  quantity = gets.chomp.to_i
  choice = Product.where({name: choice})
  Customer.create({product_id: choice.first.id, quantity: quantity})
  puts "#{quantity}: #{choice.first.name} has been added to your shopping cart!"
  list_cart
end

def list_cart
  total_price = []
  cart_items = Customer.all
  cart_items.each do |item|
  item_name = Product.find(item.product_id).name
  item_price = Product.find(item.product_id).price
  item_number = item.quantity
  puts "#{item_name}. . . \t# #{item_number}"
  sub_price = item_price * item_number
  total_price << sub_price
  puts "Sub-Total: $#{sub_price}"
  end
  puts "Total: $ #{total_price.sum}"

end

def checkout
  list_cart
  puts "Enter cashier login:"
  login = gets.chomp
  puts "Enter cashier password (hint: money):"
  password = gets.chomp
  puts "Enter amount paid:"
  payment = gets.chomp
  current_cashier = Cashier.create(name: login, password: password)
  Customer.all.each do |item|

  new_checkout = Checkout.create({cashier_id: current_cashier.id, customer_id: item.id})
end

Customer.all.each { |item| item.destroy }

puts "You are done checking out!"


end

welcome
