require 'rails_helper'

RSpec.describe RproductController, :type => :controller do
	describe "test get method" do
		it "should get 200 when get successful" do
			product = Rproduct.create!(:name => "test")
			get :index
			expect(response.status).to be(200)
			json = RproductController.json_parser(response.body)
			expect(json.length).to be(1)
			expect(json.at(0)['name']).to eq("test")
		end
		it "should return 404 when cannot find any thing" do
			get :index
			expect(response.status).to be(404)
		end

	end
	describe "test post" do
		it "should get 201 when post successful" do
			post :create,{:name => "test"}
			expect(response.status).to be(201)
		end
	end

	describe "test get specific product" do
		it "should return 201 when get specific product" do
			Rproduct.create!(:name => "test")
			get :show, {:id => 1}
			expect(response.status).to be(200)
			json = RproductController.json_parser(response.body)
			expect(json["name"]).to eq("test")
		end
	end

end
