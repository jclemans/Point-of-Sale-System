class Products < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.column :name, :string
      t.column :price, :decimal, precision: 2
    end
  end
end
