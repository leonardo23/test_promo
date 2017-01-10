class Product < ActiveRecord::Base
	belongs_to :category
	has_many :data_promo_details, :class_name => "PromoDetail", :foreign_key => :value_promo
	belongs_to :vendor
	accepts_nested_attributes_for :category
	has_many :cart_details

	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by
	#belongs_to :updated_by_user, :class_name => "User", :foreign_key => :updated_by

	validates :item_code, :presence => {:message => "Tidak boleh kosong"}
	validates :item_description, :presence => {:message => "Tidak boleh kosong"}
	validates :vendor_id, :presence => {:message => "Tidak boleh kosong."}

	def set_created_by(user)
		self.created_by_user = user
	end

	def promo_description
		if self.data_promo_details.present?
			if self.data_promo_details.last.promo.check_expired_promo
				promo_desc = self.data_promo_details.last.promo.promo_description
			else
				promo_desc = ""
			end
		else
			promo_desc = ""
		end
		return promo_desc
	end

	def qty_available
		available_qty = ""
		if self.item_quantity > 0
			"Tersedia"
		else
			"Tidak Tersedia"
		end
	end
end
