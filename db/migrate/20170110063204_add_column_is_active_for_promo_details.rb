class AddColumnIsActiveForPromoDetails < ActiveRecord::Migration
  def change
  	add_column :promo_details, :is_active, :boolean, :default => true
  end
end
