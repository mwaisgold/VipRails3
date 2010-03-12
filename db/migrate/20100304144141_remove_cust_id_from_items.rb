#Borro el cust_id de la items, para dejar solamente el customer_id
class RemoveCustIdFromItems < ActiveRecord::Migration
  def self.up
    remove_column :items, :cust_id
  end

  def self.down
    add_column :items, :cust_id, :integer
  end
end
