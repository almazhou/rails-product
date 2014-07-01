class CreatePricings < ActiveRecord::Migration
  def change
    create_table :pricings do |t|
      t.integer :amount
      t.references :rproduct, index: true

      t.timestamps
    end
  end
end
