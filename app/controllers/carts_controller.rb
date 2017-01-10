class CartsController < ApplicationController
	def index
		@cart = current_user.cart_datas.uncheckout.last
		@cart_details = @cart.cart_details.grouping_qty
	end

	def create
		cart = Cart.find_by_coupon_code(params_cart[:coupon_code])
		if cart.present?
			cart.attributes = params_cart
			@cart = cart
		else
			@cart = Cart.new(params_cart).set_current_customer_by(current_user)
		end

		if @cart.valid?
			@cart.save
			redirect_to root_path, :flash => {:notice => "Product berhasil disimpan di keranjang"}
		else
			flash[:error] = @cart.errors.full_messages.to_sentence
			product = params_cart[:cart_details_attributes]["0"][:product_id]
			redirect_to product_path(product)
		end
	end

	private

	def params_cart
		params.require(:cart).permit(:transaction_number, :coupon_code, :grand_total, :is_coupon, :cart_details_attributes => [:product_id, :quantity])
	end
end
