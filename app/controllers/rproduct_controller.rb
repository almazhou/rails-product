class RproductController < ApplicationController
	def index
		@products = Rproduct.all
		head 200
	end
end
