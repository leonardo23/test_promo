class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :category_name
    	t.integer :created_by
    	t.integer :updated_by
      t.timestamps null: false
    end
  end
end
