require 'rails_helper'

RSpec.describe PricingsController, :type => :controller do
	render_views
	describe "test get" do
		it "should return 200 when get all pricings of product success" do
			pricing = Pricing.create!(:amount => 45,:rproduct_id => 1)

			get :index, {:rproduct_id => 1,:format => :json}
			expect(response.status).to be(200)
			json = ApplicationHelper.json_parser(response.body)
			expect(json.at(0)["amount"]).to eq(45)
		end
		it "should return 404 when cannot find product" do
			get :index, {:rproduct_id => 1}
			expect(response.status).to be(404)
		end
	end

	describe "test get one specific pricing" do
		it "should get 200 when get one specific pricing" do
		pricing = Pricing.create!(:amount => 45,:rproduct_id => 1)
		
		get :show,{:rproduct_id => 1, :id => 1, :format => :json}

		expect(response.status).to be(200)
		json = ApplicationHelper.json_parser(response.body)
		expect(json["amount"]).to eq(45)
		end
	end

	describe "test post" do
		it "should get 201 when post for pricing" do
			post :create,{:amount => 45,:rproduct_id => 1}
			expect(response.status).to be(201)
		end
	end

end
