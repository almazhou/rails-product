class OrdersController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, :with => :not_found 
	def index

		@orders = Order.where(customer_id: params[:customer_id])
		render json:@orders,status:200
	end

	def show
		@order = Order.where(customer_id: params[:customer_id],id: params[:id]).first
		render json: @order, status: 200
	end

	private
	def not_found
		head 404
	end
end
