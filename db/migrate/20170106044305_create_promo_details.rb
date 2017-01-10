class CreatePromoDetails < ActiveRecord::Migration
  def change
    create_table :promo_details do |t|
    	t.integer :promo_id
    	t.string :type_promo
    	t.integer :value_promo
    	t.integer :quantity_promo
    	t.string :type_target
    	t.integer :value_target
      t.integer :quantity_target
    	t.integer :created_by
    	t.integer :updated_by
      t.timestamps null: false
    end
  end
end
