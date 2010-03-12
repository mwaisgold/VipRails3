class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :site_id
      t.string :title
      t.string :image
      t.text :description
      t.decimal :price
      t.integer :bids_count
      t.integer :cust_id

      t.timestamps
    end

  end

  def self.down
    drop_table :items
  end
end
