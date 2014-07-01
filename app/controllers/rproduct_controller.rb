class RproductController < ApplicationController
	def index
		@products = Rproduct.all
		if(@products.length == 0)
			head 404
		else
			render json:@products,status:200
		end
	end
	def create
		product_param = params.permit(:name)
		product_param[:name] = params[:name]
		@product = Rproduct.new(product_param);
		@product.save
		head 201
	end
end
