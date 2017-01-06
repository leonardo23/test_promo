class CouponsController < ApplicationController
	def index
		@coupons = Coupon.order("created_at DESC")
	end

	def new
		@coupon = Coupon.new
	end

	def create
		@coupon = Coupon.new(params_coupon)
		if @coupon.valid?
			@coupon.save
			redirect_to coupons_path, :flash => {:notice => "Data berhasil disimpan"}
		else
			flash[:error] = @coupon.errors.full_messages.to_sentence
			render "new"
		end
	end

	private

	def params_coupon
		params.require(:coupon).permit(:code_coupon, :description, :value_coupon, :start_date_active_coupon, :end_date_active_coupon, :user_coupon)
	end
end
