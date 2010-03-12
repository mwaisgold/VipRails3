class CreatePaymentMethods < ActiveRecord::Migration
  def self.up
    create_table :payment_methods do |t|
      t.string :name
      t.string :logo

      t.timestamps
    end
	
	create_table :items_payment_methods, :id => false do |t|
	  t.integer :item_id
	  t.integer :payment_method_id
	end
  end

  def self.down
    drop_table :payment_methods
	drop_table :items_payment_methods
  end
end
