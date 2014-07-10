class CustomersController < ApplicationController
	def index
		@customers = Customer.all
		render "customers/index.json"
	end
end
