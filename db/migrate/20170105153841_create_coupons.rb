class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
    	t.string :code_coupon
    	t.string :description
    	t.string :value_coupon
    	t.datetime :start_date_active_coupon
    	t.datetime :end_date_active_coupon
    	t.integer :user_coupon
    	t.integer :created_by
    	t.integer :updated_by
    	t.boolean :status_coupon, :default => true
      t.timestamps null: false
    end
  end
end
