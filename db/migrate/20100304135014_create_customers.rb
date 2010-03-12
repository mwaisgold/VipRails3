class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.string :nickname, :limit => 20
      t.integer :points
      t.integer :qty_calif

      t.timestamps
    end

    add_index :customers, :nickname, :name => "IDX_CUST_NICKNAME", :unique => true 
  end

  def self.down
    drop_table :customers
  end
end
