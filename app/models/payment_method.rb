class PaymentMethod < ActiveRecord::Base
  has_and_belongs_to_many :items

end

# == Schema Information
#
# Table name: payment_methods
#
#  id         :integer(38)     not null, primary key
#  name       :string(255)
#  logo       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

