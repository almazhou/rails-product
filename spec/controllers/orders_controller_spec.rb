require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
	describe "/GET orders" do
		before{
			@customer = Customer.create!(name: "test");
			@order = Order.create!(totalCost:45.0,customer_id: @customer.id);
		}
		it "should return 200 for get all orders" do
			get :index, customer_id: 1, format: :json

			expect(response.status).to be(200);
			orders = JSON.parse(response.body);
			expect(orders[0]["totalCost"]).to eq("45.0");
			expect(orders[0]["customer_id"]).to eq(@customer.id);
		end

		it "should return 200 for get one order" do
			get :show, customer_id: 1, id: 1, format: :json

			expect(response.status).to be(200);
			order = JSON.parse(response.body);
			expect(order["totalCost"]).to eq("45.0");
			expect(order["customer_id"]).to eq(@customer.id);
		end

		it "should return 404 for get one order doesn't exist" do
			get :show, customer_id: 1, id: 9, format: :json

			expect(response.status).to be(404);
		end

		it "should return 201 for post one order" do
			post :create,customer_id:1,order: {totalCost: 45.0}

			expect(response.status).to be(201)
		end

	end

end
