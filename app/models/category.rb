class Category < ActiveRecord::Base
	belongs_to :category
	has_many :items
	has_many :categories
end

# == Schema Information
#
# Table name: categories
#
#  id           :integer(38)     not null, primary key
#  name         :string(255)
#  category_id  :integer(38)
#  accept_items :boolean(1)
#  created_at   :datetime
#  updated_at   :datetime
#

