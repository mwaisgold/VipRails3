class AddIdxToQuestion < ActiveRecord::Migration
  def self.up
    add_index :questions, :item_id
  end

  def self.down
    remove_index :questions, :item_id
  end
end
