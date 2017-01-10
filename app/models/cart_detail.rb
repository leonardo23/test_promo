class CartDetail < ActiveRecord::Base
	belongs_to :cart
	accepts_nested_attributes_for :cart
	belongs_to :product
	belongs_to :promo_detail

	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by
	scope :grouping_qty, -> { select("SUM(cart_details.quantity) as quantity", "product_id", "cart_id", "is_available_qty").group("product_id, cart_id, is_available_qty") }

	def available_qty
		if self.product.item_quantity - self.quantity > 0
			"Available"
		else
			sisa_qty = self.quantity - self.product.item_quantity
			"Maaf, Sisa Quantity tidak memenuhi. Sisa stock : #{sisa_qty}"
		end
	end

	def total_price
		result = 0
		check_promo = self.product.data_promo_details
		if check_promo.present?
			active_promo_product = self.product.data_promo_details.active_promo_product
			if active_promo_product.present?
				#berdasarkan produk
				active_promo_product = active_promo_product.where(:type_promo => "Produk", :value_promo => self.product.id).first
				if active_promo_product.promo.check_expired_promo
					result = calculate_promo(active_promo_product)
				else
					result = self.quantity * self.product.item_price.to_f
				end
			else
				result = self.quantity * self.product.item_price.to_f
			end
		else
			result = self.quantity * self.product.item_price.to_f
		end
	end

	def calculate_promo(active_promo_product)
		result = 0
		if active_promo_product.type_target == "Persen"
			if self.quantity % active_promo_product.quantity_promo == 0
				calc_before_disc = self.quantity * self.product.item_price
				total_item = (self.quantity / active_promo_product.quantity_promo)
 			  total_item.to_i.times do
					result += calc_before_disc - (((calc_before_disc) / 100) * active_promo_product.value_target)
				end
			elsif (self.quantity % active_promo_product.quantity_promo > 0) && (self.quantity - active_promo_product.quantity_promo > 0)
				promo_qty = 0
				total_item = (self.quantity / active_promo_product.quantity_promo)
				total_item.to_i.times do
					calc_before_disc = active_promo_product.quantity_promo * self.product.item_price.to_f
					promo_qty += active_promo_product.quantity_promo
					result += calc_before_disc - (((calc_before_disc) / 100) * active_promo_product.value_target)
				end
				result += ((self.quantity - promo_qty) * self.product.item_price.to_f)
			else
				result = self.quantity * self.product.item_price
			end
		else
			result = self.quantity * self.product.item_price
		end
		return result
	end

	def description_promo
		check_promo = self.product.data_promo_details
		if check_promo.present?
			active_promo_product = self.product.data_promo_details.active_promo_product
			if active_promo_product.present?
				active_promo_product = active_promo_product.where(:type_promo => "Produk", :value_promo => self.product.id).first
				if active_promo_product.present?
					if active_promo_product.promo.check_expired_promo
						if active_promo_product.type_target == "Persen"
							result = "Free Discount #{active_promo_product.value_target}%"
						else
							result = "Free #{get_count_free_item(active_promo_product)} Product #{active_promo_product.product_value_target.item_description}"
						end
					else
						result = "Tidak ada promo"
					end
				end
			else
				result = self.quantity * self.product.item_price.to_f
			end
		else
			result = "Tidak ada promo"
		end
		return result
	end

	def get_count_free_item(active_promo_product)
		(active_promo_product.quantity_target * self.quantity)
	end
end