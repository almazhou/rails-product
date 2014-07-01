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
	def show
		begin
			@product = Rproduct.find(params[:id])
			render json:@product,status:200
		rescue
			head 404
		end
	end

	def self.json_parser(parsing_object)
		JSON.parse(parsing_object)
	end
end
