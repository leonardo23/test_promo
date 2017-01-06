class PromoDetail < ActiveRecord::Base
	belongs_to :promo
	has_many :detail_transactions
	belongs_to :product
	accepts_nested_attributes_for :promo

	def check_current_promo(qty)
		result = 0
		qty = qty.to_f
		case self.promo_target
		when "Item"
			#buy 1 get 1
			result = (qty * self.product.item_price.to_f)
		when "Diskon"
			#buy x get diskon x%
			if self.value_discount > 0
				if qty == self.value_promo
					result = ((qty * self.product.item_price.to_f) / 100) * self.value_discount
				elsif qty > self.value_promo
					if qty % self.value_promo == 0
						total_item = (qty / self.value_promo)
						total_item.to_i.times do
							result += ((self.value_promo * self.product.item_price.to_f) / 100) * self.value_discount
						end
					else
						promo_qty = 0
						total_item = (qty / self.value_promo)
						total_item.to_i.times do
							promo_qty += self.value_promo
							result += ((self.value_promo * self.product.item_price.to_f) / 100) * self.value_discount
						end
						result += ((qty - promo_qty) * self.product.item_price.to_f)
					end
				else
					result = (qty * self.product.item_price.to_f)
				end
			else
				result = (qty * self.product.item_price.to_f)
			end
		when "Nominal"
			if qty == self.value_promo
				result = (qty * self.product.item_price.to_f) - self.value_price.to_f
			end
		end
		return result
	end
end
