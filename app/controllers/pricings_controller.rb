class PricingsController < ApplicationController
	def index
		begin
			@pricings = Pricing.find(params[:rproduct_id])

			render "pricings/index.json"
		rescue ActiveRecord::RecordNotFound
			head 404
		end
	end
	def show
		begin
			@pricing = Pricing.where(params[:rproduct_id],params[:id]).first
			render json:@pricing,status:200
		rescue ActiveRecord::RecordNotFound
			head 404
		end
	end

	def create
		@param = params.permit(:amount,:rproduct_id)

		@param[:amount] = params[:amount]
		@param[:rproduct_id] = params[:rproduct_id]

		pricing = Pricing.new(@param)
		pricing.save
		head 201
	end
end
