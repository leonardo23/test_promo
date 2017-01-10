class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
    	t.string :vendor_name
    	t.integer :created_by
    	t.integer :updated_by
    	t.boolean :status_vendor, :default => true
      t.timestamps null: false
    end
  end
end
