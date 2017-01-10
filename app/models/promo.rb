class Promo < ActiveRecord::Base
	belongs_to :created_by_user, :class_name => "User", :foreign_key => :created_by
	has_many :promo_details
  accepts_nested_attributes_for :promo_details

	validates :promo_description, :presence => {:message => "Tidak boleh kosong"}
	validates :start_date_promo, :presence => {:message => "Tidak boleh kosong"}
	validates :end_date_promo, :presence => {:message => "Tidak boleh kosong"}
	validate :format_date_is_valid_datetime

  def format_date_is_valid_datetime
    errors.add(:start_date_promo, 'Format tanggal tidak valid') if self.start_date_promo.present? && !self.start_date_promo.to_date.is_a?(Date)
    errors.add(:end_date_promo, 'Format tanggal tidak valid') if self.end_date_promo.present? && !self.end_date_promo.to_date.is_a?(Date)
  end

  def check_expired_promo
  	Time.now.to_date >= self.start_date_promo.to_date && Time.now.to_date <= self.end_date_promo
  end
end
