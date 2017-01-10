class Cart < ActiveRecord::Base
	has_many :cart_details

	belongs_to :customer, :class_name => "User", :foreign_key => :customer_id
	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by

	accepts_nested_attributes_for :cart_details
	scope :uncheckout, -> { where(:is_checkout => false)}

	def set_current_customer_by(user)
		self.created_by_user = user
		self.customer = user
		return self
	end

	def get_transaction_number(user)
		check_current_transaction_active = user.cart_datas.uncheckout
		if check_current_transaction_active.present?
			transaction_number = check_current_transaction_active.last.transaction_number
		else
			transaction_number = "SEQ-#{Time.now.strftime('%d%m%Y%H%M%S')}"
		end

		return {:transaction_number => transaction_number, :cart_history => check_current_transaction_active.last}
	end

end
