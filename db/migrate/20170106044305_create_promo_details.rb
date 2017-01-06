class CreatePromoDetails < ActiveRecord::Migration
  def change
    create_table :promo_details do |t|
    	t.integer :promo_id
    	t.string :promo_target
    	t.integer :value_promo
    	t.float :value_discount
    	t.decimal :value_price, precision: 12, scale: 2
    	t.integer :product_id
    	t.integer :created_by
    	t.integer :updated_by
      t.timestamps null: false
    end
  end
end
