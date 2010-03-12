class CreateShipMethods < ActiveRecord::Migration
  def self.up
    create_table :ship_methods do |t|
      t.string :description

      t.timestamps
    end
	
	create_table :items_ship_methods, :id => false do |t|
	  t.integer :item_id
	  t.integer :ship_method_id
	end
  end

  def self.down
    drop_table :ship_methods
	drop_table :items_ship_methods
  end
end
