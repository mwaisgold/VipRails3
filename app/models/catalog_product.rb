require "core_ext"

class CatalogProduct < ActiveRecord::Base
  has_many :items
  has_many :catalog_product_attributes
  has_many :reviews

  def average_score
    @average_score ||= ((total_scores * 2) / reviews.length).round / 2.to_f
  end

  def total_scores
    @total_scores ||= scores.inject(0) do |accum, (point, group)|
      accum + point * group
    end
  end

  def scores
    @scores ||= reviews.count_by(&:points)
  end
end

# == Schema Information
#
# Table name: catalog_products
#
#  id         :integer(38)     not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#
