require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do
	render_views
	describe "test /GET customer" do
		before{
			@customer = Customer.create!(:name => "test")
		}
		it "should return 200 for get all customers" do
			get :index , format: :json
			expect(response.status).to be(200)
			customerJson = ApplicationHelper.json_parser(response.body);
			expect(customerJson[0]["name"]).to eq("test");

			expect(customerJson[0]["uri"]).to match("/customers/" + @customer.id.to_s);
		end

		it "should return 200 for get 1 specific customers" do
			get :show,id: @customer.id,format: :json

			expect(response.status).to be(200)
			customerJson = ApplicationHelper.json_parser(response.body);
			expect(customerJson["name"]).to eq("test");
			expect(customerJson["uri"]).to match("/customers/" + @customer.id.to_s);
		end

		it "should return 404 when cannot find specific customer" do
			get :show, id:10000, format: :json
			expect(response.status).to be(404);
		end
	end 
end
