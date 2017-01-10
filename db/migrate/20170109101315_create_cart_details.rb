class CreateCartDetails < ActiveRecord::Migration
  def change
    create_table :cart_details do |t|
    	t.integer :product_id
    	t.integer :quantity
    	t.boolean :is_available_qty, :default => true
    	t.integer :created_by
      t.timestamps null: false
    end
  end
end
