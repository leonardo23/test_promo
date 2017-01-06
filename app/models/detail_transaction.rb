class DetailTransaction < ActiveRecord::Base
	belongs_to :head_transaction
	belongs_to :promo_detail
	accepts_nested_attributes_for :head_transaction

	def get_total(promo_detail)
		total = promo_detail.product.item_price * 0
	end
end
