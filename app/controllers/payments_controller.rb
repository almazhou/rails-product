class PaymentsController < ApplicationController
	def index
		@payment = Payment.where(customer_id: params[:customer_id],order_id: params[:order_id]).first

		render json: @payment, status: 200
	end

	def create
		param_create = payment_params

		param_create[:customer_id] = params[:customer_id]
		param_create[:order_id] = params[:order_id]

		@payment_new = Payment.new(payment_params)

		@payment_new.save()

		head 201
	end

	private 
	def payment_params
		params.permit(:customer_id,:order_id,:amount);
	end
end
