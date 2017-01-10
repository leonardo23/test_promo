class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
    	t.string :transaction_number
    	t.boolean :is_coupon, :default => false
    	t.integer :customer_id
    	t.string :coupon_code
    	t.decimal :grand_total
    	t.integer :created_by
    	t.boolean :is_active, :default => true
      t.timestamps null: false
    end
  end
end
