class AddCategoryIdToItems < ActiveRecord::Migration
  def self.up
	add_column :items, :category_id, :integer
	
	add_index :items, :category_id, :name => 'IDX_ITEMS_CATEG_ID', :unique => false
  
  end

  def self.down
	remove_column :items, :category_id
  end
end
