class OrdersController < ApplicationController
	rescue_from ActiveRecord::RecordNotFound, :with => :not_found 
	def index
		@orders = Order.where(customer_id: params[:customer_id])
		render json:@orders,status:200
	end

	def show
		@order = Order.where(customer_id: params[:customer_id],id: params[:id]).first
		if(!@order)
			not_found
		else
			render json: @order, status: 200
		end
	end

	def create
		create_param = order_params
		create_param[:customer_id] = params[:customer_id];
		order = Order.new(create_param)
		order.save()
		response.location = customer_order_url :customer_id => params[:customer_id],:id => order.id
		head 201
	end

	private
	def not_found
		head 404
	end

	def order_params
		params.require(:order).permit(:customer_id,:totalCost);
	end
end
