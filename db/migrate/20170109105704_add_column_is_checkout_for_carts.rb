class AddColumnIsCheckoutForCarts < ActiveRecord::Migration
  def change
  	add_column :carts, :is_checkout, :boolean, :default => false
  end
end
