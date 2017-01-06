class HeadTransaction < ActiveRecord::Base
	has_many :detail_transactions
	belongs_to :promo
	accepts_nested_attributes_for :detail_transactions
end
