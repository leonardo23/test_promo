class VendorsController < ApplicationController
	def index
		@vendors = Vendor.order("created_at DESC")
	end

	def new
		@vendor = Vendor.new
	end

	def create
		@vendor = Vendor.new(params_vendor).set_created_by(current_user)
		if @vendor.valid?
			@vendor.save
			redirect_to vendors_path, :flash => {:notice => "Data berhasil disimpan."}
		else
			flash[:error] = @vendor.errors.full_messages.to_sentence
			render 'new'
		end
	end

	private

	def params_vendor
		params.require(:vendor).permit(:vendor_name)
	end
end
