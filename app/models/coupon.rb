class Coupon < ActiveRecord::Base
	belongs_to :coupon_customer, :class_name => "User", :foreign_key => :coupon_customer_id
	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by

	validates :code_coupon,
						:presence => {:message => "Tidak boleh kosong"},
						:uniqueness => {:case_sensitif => false, :message => "sudah tersedia"}
	validates :description, :presence => {:message => "Tidak boleh kosong"}
	validates :value_coupon, :presence => {:message => "Tidak boleh kosong"}
	validates :start_date_active_coupon, :presence => {:message => "Tidak boleh kosong"}
	validates :end_date_active_coupon, :presence => {:message => "Tidak boleh kosong"}
	validates :user_coupon, :presence => {:message => "Tidak boleh kosong"}
	validate :format_date_is_valid_datetime

  def format_date_is_valid_datetime
    errors.add(:start_date_active_coupon, 'Format tanggal tidak valid') if self.start_date_active_coupon.present? && !self.start_date_active_coupon.to_date.is_a?(Date)
    errors.add(:end_date_active_coupon, 'Format tanggal tidak valid') if self.end_date_active_coupon.present? && !self.end_date_active_coupon.to_date.is_a?(Date)
  end

  def get_validate_coupon
    (self.start_date_active_coupon.to_datetime.strftime("%d-%m-%Y").to_date..self.end_date_active_coupon.to_datetime.strftime("%d-%m-%Y").to_date).cover?(Time.now.strftime("%d-%m-%Y").to_date)
  end
end
