class Question < ActiveRecord::Base
  belongs_to :item
end


# == Schema Information
#
# Table name: questions
#
#  id          :integer(38)     not null, primary key
#  item_id     :integer(38)
#  question    :text
#  question_dt :datetime
#  answer      :text
#  answer_dt   :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

