class Review < ActiveRecord::Base
  belongs_to :customer
  belongs_to :catalog_product
end

# == Schema Information
#
# Table name: reviews
#
#  id                 :integer(38)     not null, primary key
#  title              :string(255)
#  points             :integer(38)
#  customer_id        :integer(38)
#  catalog_product_id :integer(38)
#  pros               :text
#  contras            :text
#  conclusion         :text
#  qty_votes          :integer(38)
#  qty_pos            :integer(38)
#  created_at         :datetime
#  updated_at         :datetime
#

