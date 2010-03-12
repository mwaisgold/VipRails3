class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :title
      t.integer :points
      t.references :customer
      t.references :catalog_product
      t.text :pros
      t.text :contras
      t.text :conclusion
      t.integer :qty_votes
      t.integer :qty_pos

      t.timestamps
    end
	
	add_index :reviews, :catalog_product_id, :unique => false, :name => "IDX_REVIEWS_PROD_ID"
  end

  def self.down
    drop_table :reviews
  end
end
