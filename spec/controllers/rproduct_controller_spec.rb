require 'rails_helper'

RSpec.describe RproductController, :type => :controller do
	describe "test get method" do
		it "should get 200 when get successful" do
			product = Rproduct.create!(:name => "test")
			get :index
			expect(response.status).to be(200)
			json = JSON.parse(response.body)
			expect(json.length).to be(1)
			expect(json.at(0)['name']).to eq("test")
		end

	end

end
