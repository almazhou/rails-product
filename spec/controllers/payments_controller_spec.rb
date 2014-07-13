require 'rails_helper'

RSpec.describe PaymentsController, :type => :controller do
	describe "test GET" do
		before{
			@customer = Customer.create!({name:"test"})
			@order = Order.create!({customer_id: @customer.id, totalCost: 45.0})
			@payment = Payment.create!({customer_id: @customer.id,order_id: @order.id,amount: 45.0})
		}
		it "should return 200 for get payment of order" do
			get :index, customer_id:@customer.id,order_id:@order.id,format: :json

			expect(response.status).to be(200)

			paymentJson = JSON.parse(response.body)

			expect(paymentJson["amount"]).to eq(45.0.to_s)
		end
	end
end
