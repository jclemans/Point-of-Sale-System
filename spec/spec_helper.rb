require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require './lib/product'
require './lib/customer'
require './lib/checkout'
require './lib/cashier'


ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

# RSpec.configure do |config|
#   config.after(:each) do
#     Product.all.each { |product| product.destroy }
#   end
# end
