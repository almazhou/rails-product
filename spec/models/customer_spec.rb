require 'rails_helper'

RSpec.describe Customer, :type => :model do
  describe "validate model customer" do
  	it "name must not be nil" do
  		customer = Customer.new name: nil;
  		expect(customer).to be_invalid;
  	end

  	it "name must not be empty" do
  		customer = Customer.new name: "";
  		expect(customer).to be_invalid;
  	end
  end
end
