class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :totalCost, precision: 10, scale: 2
      t.references :customer, index: true

      t.timestamps
    end
  end
end
