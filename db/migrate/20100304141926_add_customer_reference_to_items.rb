class AddCustomerReferenceToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :customer_id, :integer
    add_index :items, :customer_id, :name => "IDX_ITEMS_CUSTOMER", :unique => false
  end

  def self.down
    remove_column :items, :customer_id
  end
end