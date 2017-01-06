class TransactionsController < ApplicationController
	before_filter :get_promo, :only => [:index, :create]
	def index
		@transaction = HeadTransaction.new
		@detail_transaction = DetailTransaction.new
	end

	def create
		@transaction = HeadTransaction.new(params_transaction)
		if @transaction.valid?
			check_validate_coupon = Coupon.where(:code_coupon => params_transaction[:code_coupon]).first
			if check_validate_coupon.present?
				if check_validate_coupon.get_validate_coupon
					@transaction.save
					redirect_to transactions_path, :flash => {:notice => "Data berhasil disimpan"}
				else
					flash[:error] = "Kode Kupon sudah Expired"
					render "index"
				end
			else
				flash[:error] = "Kode Kupon tidak Valid"
				render "index"
			end
		else
			flash[:error] = @transaction.errors.full_messages.to_sentence
			render "index"
		end
	end

	def get_promo_details
		@promo_details = Promo.find(params[:id]).promo_details rescue []
	end

	private

	def get_promo
		@promo = Promo.order("created_at DESC")
		@promo_details = @promo.first.promo_details
	end

	def params_transaction
		params.require(:head_transaction).permit(:transaction_number, :promo_id, :payment_type, :code_coupon, :detail_transactions_attributes => [:promo_detail_id, :quantity])
	end
end
