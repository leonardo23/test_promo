class AddColumnPromoDetailIdForCartDetails < ActiveRecord::Migration
  def change
  	add_column :cart_details, :promo_detail_id, :integer
  end
end
