class CreateRproducts < ActiveRecord::Migration
  def change
    create_table :rproducts do |t|
      t.string :name

      t.timestamps
    end
  end
end
