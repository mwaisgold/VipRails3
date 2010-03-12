class CatalogProductAttribute < ActiveRecord::Base
  belongs_to :catalog_product
end

# == Schema Information
#
# Table name: catalog_product_attributes
#
#  id                 :integer(38)     not null, primary key
#  key                :string(255)
#  value              :string(255)
#  catalog_product_id :integer(38)
#  created_at         :datetime
#  updated_at         :datetime
#

