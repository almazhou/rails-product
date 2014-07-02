class RproductsController < ApplicationController
	def index
		@rproducts = Rproduct.all
		if(@rproducts.length == 0)
			head 404
		else
			render "rproducts/index.json"
		end
	end
	def create
		product_param = params.permit(:name)
		product_param[:name] = params[:name]
		@rproduct = Rproduct.new(product_param);
		@rproduct.save
		head 201
	end
	def show
		begin
			@rproduct = Rproduct.find(params[:id])
			render json:@rproduct,status:200
		rescue ActiveRecord::RecordNotFound
			head 404
		end
	end


end
