class CustomersController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, :with => :not_found
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id]);
	end

	private
	def not_found
		head 404
	end
end
