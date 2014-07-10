require 'rails_helper'

RSpec.describe CustomersController, :type => :controller do
	render_views
	describe "test /GET customer" do
		before{
			customer = Customer.create!(:name => "test")
		}
		it "should return 200 for get all customers" do
			get :index
			expect(response.status).to be(200)
			customerJson = ApplicationHelper.json_parser(response.body);
			expect(customerJson[0]["name"]).to eq("test");
		end
	end 
end
