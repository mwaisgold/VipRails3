class CreateCalifications < ActiveRecord::Migration
  def self.up
    create_table :califications do |t|
      t.references :customer
      t.references :item
      t.text :texto_calif
      t.integer :value_calif
      t.date :fecha

      t.timestamps
    end
  end

  def self.down
    drop_table :califications
  end
end
