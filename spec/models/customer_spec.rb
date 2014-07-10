require 'rails_helper'

RSpec.describe Customer, :type => :model do
  describe "validate model customer" do
  	it "name must not be nil or empty" do
  		customer = Customer.new name: nil;
  		expect(customer).to be_invalid;
  	end
  end
end
