class AddColumnCouponTypeForCoupon < ActiveRecord::Migration
  def change
  	add_column :coupons, :coupon_type, :string
  	rename_column :coupons, :user_coupon, :coupon_customer_id
  end
end
