class PromosController < ApplicationController
	def index
		@promos = Promo.order("created_at DESC")
	end

	def new
		@promo = Promo.new
		@promo_detail = PromoDetail.new
		@promo.promo_details.build
		@products = Product.order("created_at DESC")
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

	def get_promo_by_qty
		promo = Promo.find(params[:id])
		@promo = promo.promo_details.find(params[:promo_detail]).check_current_promo(params[:qty])
		render :layout => false, :text => @promo
	end

	private

	def params_promo
		params.require(:promo).permit(:promo_description, :start_date_promo, :end_date_promo, :promo_details_attributes => [:product_id, :promo_target, :value_promo, :value_discount, :value_price])
	end
end
