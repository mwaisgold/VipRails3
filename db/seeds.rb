# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#TODO add param for loop
Item.delete_all
Customer.delete_all
ShipMethod.delete_all
PaymentMethod.delete_all
CatalogProduct.delete_all
CatalogProductAttribute.delete_all
Review.delete_all
Question.delete_all
Calification.delete_all
Site.delete_all

total = (ENV["ITEMS"] || 1).to_i

ActiveRecord::Base.transaction do
  @site = Site.create site_id: "MLA", locale: "es"
  @shipMethod = ShipMethod.create description: "A convenir"
  @paymentMethod = PaymentMethod.create name: "visa", logo: "sarasa"
  @product = CatalogProduct.create name: "Iphone mejor del mundo"
  @attr = CatalogProductAttribute.create key: "Wifi", value: "(802.11b/g)"
  @product.catalog_product_attributes << @attr
  @product.save

  @customer_review = Customer.create nickname: "customerReview", points: 95, qty_calif: 100
  @review = Review.create title: "Titulo de review", pros: "prossss", contras: "contrass", customer: @customer_review, catalog_product: @product, qty_votes: 10, qty_pos: 5, points: 4, conclusion: "conclusion"

  total.times do |i|
    @customer = Customer.create nickname: "customer#{i}", points: 95, qty_calif: 100
    @customer2 = Customer.create nickname: "other#{i}", points: 45, qty_calif: 50

    @item = Item.create title: "iPod touch 32gb 3ra generacion, caja sellada", price: 100, description: "description", image: "61826546_3253.jpg", bids_count: 35, site: @site, customer: @customer

    30.times do |j|
      @question = Question.create item: @item, question: "preguntita#{j}", question_dt: Time.now, answer: "respuestita#{j}", answer_dt: Time.now
    end

    @calification = Calification.create customer: @customer2, item: @item, texto_calif: "todo barbaro", value_calif: 1, fecha: Time.now

    @item.catalog_product = @product
    @item.payment_methods << @paymentMethod
    @item.ship_methods << @shipMethod
    @item.save

    puts @item.id

    # 5.times do
      # Item.create title: "Filmadora Jvc Everio Gz-mg630 Disco Rigido 60gb Modelo 2009", price: 10000, description: "description", image: "image.jpg", bids_count: 35, site: @site, customer: @customer
    # end
  end
end
