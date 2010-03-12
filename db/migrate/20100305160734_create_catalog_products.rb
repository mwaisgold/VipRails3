class CreateCatalogProducts < ActiveRecord::Migration
  def self.up
    create_table :catalog_products do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :catalog_products
  end
end
