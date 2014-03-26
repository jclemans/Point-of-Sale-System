class Customers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.column :product_id, :int
      t.column :quantity, :int
    end
  end
end

