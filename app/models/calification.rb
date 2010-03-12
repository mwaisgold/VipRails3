class Calification < ActiveRecord::Base
  belongs_to :customer
  belongs_to :item
end

# == Schema Information
#
# Table name: califications
#
#  id          :integer(38)     not null, primary key
#  customer_id :integer(38)
#  item_id     :integer(38)
#  texto_calif :text
#  value_calif :integer(38)
#  fecha       :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

