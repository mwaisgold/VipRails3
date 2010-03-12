class Item < ActiveRecord::Base
  belongs_to :site
  has_many :questions
  belongs_to :customer
  has_and_belongs_to_many :payment_methods
  has_and_belongs_to_many :ship_methods
  belongs_to :category
  has_many :califications
  belongs_to :catalog_product
  
  #Valido los campos que no pueden ser nulos
  validates_presence_of :site_id, :item_id, :title, :price, :bids_count
  #Valido la numericalidad del precio
  validates_numericality_of :price
  #La cantidad de items solo puede ser un número entero
  validates_numericality_of :bids_count, :only_integer => true
  #Valido que el item_id sea unico para cuada site
  validates_uniqueness_of :item_id, :scope => :site_id
  #Valido que el site_id exista
  validate :site_id_from_item_must_exists
  #, :customer_must_exist_in_ml

  def site_id_from_item_must_exists
    errors.add(:site_id, "Debe existir el site") if self.site == nil
  end

  def customer_must_exist_in_ml
    errors.add(:cust_id, "Debe existir en ML") if get_customer == nil
  end

#  def get_customer
#    #Me guardo el customer así no lo voy a buscar siempre
#    if @customer != nil && @customer.custID == self.cust_id
#      return @customer
#    else
#        begin
#          cust = CustomerResource.new.get self.cust_id
#          #Agrego el pedido de esto. Si no lo trae quiere decir que no existia el cust
#          cust.nickname
#          @customer = cust
#          return @customer
#        rescue NameError
#          nil
#        end
#    end
#  end

end



# == Schema Information
#
# Table name: items
#
#  id                 :integer(38)     not null, primary key
#  item_id            :integer(38)
#  title              :string(255)
#  image              :string(255)
#  description        :text
#  price              :integer(38)
#  bids_count         :integer(38)
#  created_at         :datetime
#  updated_at         :datetime
#  site_id            :integer(38)     not null
#  customer_id        :integer(38)
#  category_id        :integer(38)
#  catalog_product_id :integer(38)
#

