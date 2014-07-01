class RproductController < ApplicationController
	def index
		@products = Rproduct.all
		render json:@products,status:200
	end
end
