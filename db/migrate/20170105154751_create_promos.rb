class CreatePromos < ActiveRecord::Migration
  def change
    create_table :promos do |t|
    	t.string :code_promo
      t.string :promo_description
    	t.datetime :start_date_promo
    	t.datetime :end_date_promo
    	t.boolean :status_promo, :default => true
    	t.integer :created_by
    	t.integer :updated_by
      t.timestamps null: false
    end
  end
end
