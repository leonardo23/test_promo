class AddColumnCartIdForCartDetails < ActiveRecord::Migration
  def change
  	add_column :cart_details, :cart_id, :integer
  end
end
