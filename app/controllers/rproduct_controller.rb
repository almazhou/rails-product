class RproductController < ApplicationController
	def index
		@products = Rproduct.all
		if(@products.length == 0)
			head 404
		else
		render json:@products,status:200
		end
	end
end
