class HomesController < ApplicationController
	before_filter :products, :only => [:index]
	def index
	end

	private

	def products
		@products = Product.order("created_at DESC")
	end
end
