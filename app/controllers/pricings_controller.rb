class PricingsController < ApplicationController
	def index
		begin
			@pricings = Pricing.find(params[:rproduct_id])
			
			render json:@pricings,status:200
		rescue ActiveRecord::RecordNotFound
			head 404
		end
	end
end
