class Checkouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.column :cashier_id, :int
      t.column :customer_id, :int
      t.column :total_price, :decimal, precision: 8, scale: 2
      t.timestamps
    end
  end
end
