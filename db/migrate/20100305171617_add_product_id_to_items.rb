class AddProductIdToItems < ActiveRecord::Migration
  def self.up
	add_column :items, :catalog_product_id, :integer
  end

  def self.down
	drop_column :items, :catalog_product_id 
  end
end
