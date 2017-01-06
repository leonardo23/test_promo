class CreateDetailTransactions < ActiveRecord::Migration
  def change
    create_table :detail_transactions do |t|
    	t.integer :head_transaction_id
    	t.integer :promo_detail_id
    	t.integer :quantity
    	t.integer :created_by
    	t.integer :updated_by
      t.timestamps null: false
    end
  end
end
