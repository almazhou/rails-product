class PricingsController < ApplicationController
	def index
		begin
			@pricings = Pricing.find(params[:rproduct_id])

			render json:@pricings,status:200
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
end
