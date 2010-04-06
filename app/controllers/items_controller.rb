class ItemsController < ApplicationController
  layout "vip", :only => :show

  before_filter :authenticate, only: :buy

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])
    @customer = @item.customer
    @questions = @item.questions.all(:limit => 30)
    @shipMethods = @item.ship_methods
    @paymentMethods = @item.payment_methods

    @categories = @item.category.tree

    @califications = @item.califications
    @product = @item.catalog_product
    @reviews = @product.reviews
    @catalog_product_attrs = @product.catalog_product_attributes

    @items_seller = @item.items_seller

     respond_to do |format|
       format.html
       format.xml { render :xml => @item.to_xml }
       format.json { render :json => @item.to_json }
     end
  end

  def buy
    @item = Item.find(params[:id])
    @name = cookies[:cookie_login]
  end
end
