class PromoDetail < ActiveRecord::Base
	belongs_to :promo
	has_many :detail_transactions
	has_many :cart_details

	belongs_to :product_value, -> proc{ joins(:data_promo_details).where("promo_details.type_promo = ?", "Produk") }, :class_name => "Product", :foreign_key => :value_promo
	belongs_to :product_value_target, -> proc{ joins(:data_promo_details).where("promo_details.type_promo = ?", "Produk") }, :class_name => "Product", :foreign_key => :value_target

	accepts_nested_attributes_for :promo
	scope :active_promo_product, -> { where(:is_active => true) }
end
