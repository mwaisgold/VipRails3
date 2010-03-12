class CreateCatalogProductAttributes < ActiveRecord::Migration
  def self.up
    create_table :catalog_product_attributes do |t|
      t.string :key
      t.string :value
      t.references :catalog_product

      t.timestamps
    end
  end

  def self.down
    drop_table :catalog_product_attributes
  end
end
