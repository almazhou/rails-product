class PaymentsController < ApplicationController
	def index
		@payment = Payment.where(customer_id: params[:customer_id],order_id: params[:order_id]).first

		render json: @payment, status: 200
	end
end
