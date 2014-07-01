require 'rails_helper'

RSpec.describe PricingsController, :type => :controller do
	describe "test get" do
		it "should return 200 when get all pricings of product success" do
			pricing = Pricing.create!(:amount => 45,:rproduct_id => 1)

			get :index, {:rproduct_id => 1}
			expect(response.status).to be(200)
			json = ApplicationHelper.json_parser(response.body)
			expect(json["amount"]).to eq(45)
		end
		it "should return 404 when cannot find product" do
			get :index, {:rproduct_id => 1}
			expect(response.status).to be(404)
		end
	end

end
