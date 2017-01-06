module TransactionsHelper
	def total_price(promo_details)
		tot_price = promo_details.collect{|ip| ip.product.item_price.to_f }.sum
		return tot_price
	end
end
