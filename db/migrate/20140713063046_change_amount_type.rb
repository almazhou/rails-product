class ChangeAmountType < ActiveRecord::Migration
  def change
  	change_table :payments do |t|
      t.change :amount, :decimal
    end
  end
end
