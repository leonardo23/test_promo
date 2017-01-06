class Product < ActiveRecord::Base
	belongs_to :category
	has_many :promo_details
	accepts_nested_attributes_for :category

	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by
	#belongs_to :updated_by_user, :class_name => "User", :foreign_key => :updated_by

	validates :item_code, :presence => {:message => "Tidak boleh kosong"}
	validates :item_description, :presence => {:message => "Tidak boleh kosong"}

	def set_created_by(user)
		self.created_by_user = user
	end
end
