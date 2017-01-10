class PromosController < ApplicationController
	def index
		@promos = Promo.order("created_at DESC")
	end

	def new
		@promo = Promo.new
		@promo_detail = PromoDetail.new
		@promo.promo_details.build
		@products = Product.where("products.id NOT IN (SELECT value_promo FROM promo_details WHERE is_active = true)")
	end

	def create
		@promo = Promo.new(params_promo)
		if @promo.valid?
			@promo.save
			redirect_to promos_path, :flash => {:notice => "Data berhasil disimpan"}
		else
			flash[:error] = @promo.errors.full_messages.to_sentence
			render "new"
		end
	end

	def show
		@promo = Promo.find(params[:id])
	end

	def get_promo_target
		@products = Product.where("products.id NOT IN (SELECT value_promo FROM promo_details WHERE is_active = true)")
		render :layout => false
	end

	private
	def params_promo
		params.require(:promo).permit(:code_promo, :promo_description, :start_date_promo, :end_date_promo, :promo_details_attributes => [:type_promo, :value_promo, :quantity_promo, :type_target, :value_target, :quantity_target])
	end
end
