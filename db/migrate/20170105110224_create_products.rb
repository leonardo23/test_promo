class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.integer :category_id
    	t.string :item_code
    	t.string :item_description
      t.integer :item_quantity
      t.integer :vendor_id
      t.decimal :item_price, precision: 12, scale: 2
    	t.integer :created_by
    	t.integer :updated_by
      t.timestamps null: false
    end
  end
end
