class CreateHeadTransactions < ActiveRecord::Migration
  def change
    create_table :head_transactions do |t|
    	t.string :transaction_number
    	t.integer :promo_id
    	t.integer :payment_type
    	t.integer :code_coupon
    	t.integer :created_by
    	t.integer :updated_by
      t.timestamps null: false
    end
  end
end
