require 'spec_helper'

  describe Product do
    it 'returns its name' do
    product = Product.new({name: 'Carrot', price: 3.01})
    product.name.should eq 'Carrot'
  end
end
