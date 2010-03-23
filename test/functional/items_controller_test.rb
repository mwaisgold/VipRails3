require 'test_helper'

class ItemsControllerTest < ActionController::TestCase
  setup do
    @site = Site.create site_id: "MLA", locale: "es" 
    @item = Item.create title: "iPod touch 32gb 3ra generacion, caja sellada", price: 100, description: "description", image: "image.jpg", bids_count: 35, site_id: @site.id
    @customer = Customer.create nickname: "MatataNoExiste", points: 95, qty_calif: 100#, email: "customer@email.com"
    @shipMethod = ShipMethod.create description: "A convenir"
    @paymentMethod = PaymentMethod.create name: "visa", logo: "sarasa"
    @product = CatalogProduct.create name: "Iphone mejor del mundo"
    @attr = CatalogProductAttribute.create key: "MyKey", value: "MyValue"
    @product.catalog_product_attributes << @attr
    @review = Review.create title: "Titulo de review", pros: "prossss", contras: "contrass", customer: @customer, catalog_product: @product, qty_votes: 10, qty_pos: 5, points: 4, conclusion: "conclusion"
    @product.save
    @question = Question.create item_id: @item.id, question: "pregunta loca", question_dt: Time.now, answer: "respuesta mas loca", answer_dt: Time.now
    @calification = Calification.create customer_id: @customer.id, item_id: @item.id, texto_calif: "todo barbaro", value_calif: 1, fecha: Time.now

    @item.catalog_product = @product
    @item.payment_methods << @paymentMethod
    @item.ship_methods << @shipMethod
    @item.customer = @customer
    @item.save
  end

  def start_show_request
    get(:show, {id: @item.id})
  end

  test "A user visiting the page should see item title" do
    start_show_request
    assert_response :success
    assert_select 'title', @item.title
  end

  test "A user visiting the page should see the description" do
    start_show_request
    assert_select 'div#Descripcion', /#{@item.description}/
  end

  test "A user visiting the page should see item price" do
    start_show_request
    assert_select 'span.price', /#{@item.price.to_i}/
  end

  test "A user visiting the page should see the bids quantity" do
    start_show_request
    assert_select 'td.datavend', /#{@item.bids_count.to_i}/
  end

  test "A user visiting the page should see seller info" do
    start_show_request
    assert_select 'span#MyNickname', @customer.nickname
    assert_select 'div#puntos', /#{@customer.points.to_i.to_s}/
  end

  test "A user visiting the page should see ship methods" do
    start_show_request
    assert_select 'span#shipMethodDesc', /#{@item.ship_methods.first.description}/
  end

  test "A user visiting the page should see payment methods" do
    start_show_request
    assert_select 'span#paymentMethodDesc', /#{@item.payment_methods.first.name}/
  end

  test "A user visiting the page should see the questions" do
    start_show_request
    assert_select 'div#bigQues', /#{@question.question}/
    assert_select 'div#bigQues', /#{@question.answer}/
  end

  test "A user visiting the page should see the califications" do
    start_show_request
    assert_select 'div.bloque-cal', /#{@calification.texto_calif}/
  end

  test "A user visiting the page should see the catalog product" do
    start_show_request
    assert_select 'div#attr', /#{@attr.key}/
    assert_select 'div#attr', /#{@attr.value}/
  end

  test "A user visiting the page should see the product reviews" do
    start_show_request
    assert_select 'span.promedio', { html: /4BALLSON/ }
    assert_select 'div.optitle', /#{@review.title}/
    assert_select 'span.autor_rev_link', /#{@review.customer.nickname}/
    assert_select 'div.pros', /#{@review.pros}/
    assert_select 'div.contras', /#{@review.contras}/
    assert_select 'div.opconcl', /#{@review.conclusion}/
  end

  teardown do
    Item.delete :all
    Customer.delete :all
    ShipMethod.delete :all
    PaymentMethod.delete :all
    CatalogProduct.delete :all
    CatalogProductAttribute.delete :all
    Review.delete :all
    Question.delete :all
    Calification.delete :all
    Site.delete :all
  end
end
