class AddCustomerReference < ActiveRecord::Migration
  def change
  	add_reference :payments, :customer, index: true
  end
end
