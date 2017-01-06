class Category < ActiveRecord::Base
	has_many :products
	accepts_nested_attributes_for :products

	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by
	#belongs_to :updated_by_user, :class_name => "User", :foreign_key => :updated_by

	validates :category_name, :presence => {:message => "Tidak boleh kosong"}

	def set_created_by(user)
		self.created_by_user = user
		return self
	end
end
