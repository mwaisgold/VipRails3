class Site < ActiveRecord::Base
validates_presence_of :site_id
validates_presence_of :locale
validates_uniqueness_of :site_id

end

# == Schema Information
#
# Table name: sites
#
#  id         :integer(38)     not null, primary key
#  site_id    :string(3)       not null
#  locale     :string(2)       not null
#  created_at :datetime
#  updated_at :datetime
#

