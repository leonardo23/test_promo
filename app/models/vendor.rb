class Vendor < ActiveRecord::Base
	has_many :products
	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by

	def set_created_by(user)
		self.created_by_user = user
		return self
	end
end
