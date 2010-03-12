class CatalogProduct < ActiveRecord::Base
	has_many :items
	has_many :catalog_product_attributes
	has_many :reviews
	attr_reader :qty5, :qty4, :qty3, :qty2, :qty1, :prom
	
	def calculate_reviews_summary 
		suma = @qty5 = @qty4 = @qty3 = @qty2 = @qty1 = 0;
				
		for review in self.reviews do
			eval("@qty" +review.points.to_s + "+=1")
			suma+=review.points			
		end
		
		@prom = ((suma * 2) / self.reviews.length).round / 2.to_f
	end
	
	def get_balls_image_link
		return @prom.to_s.delete "."
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

