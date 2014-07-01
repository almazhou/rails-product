require 'rails_helper'

RSpec.describe RproductController, :type => :controller do
	describe "test get method" do
		it "should get 200 when get successful" do
			get :index
			expect(response.status).to be(200)
		end
	end

end
