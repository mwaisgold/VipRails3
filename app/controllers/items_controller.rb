class ItemsController < ApplicationController
  layout "vip", :only => :show

  # GET /items
  # GET /items.xml
  # def index
    # @items = Item.all

    # respond_to do |format|
      # format.html # index.html.erb
      # format.xml  { render :xml => @items }
    # end
  # end

  # GET /items/1
  # GET /items/1.xml
  def show
    @item = Item.find(params[:id])
    @customer = @item.customer
    @questions = @item.questions
    @shipMethods = @item.ship_methods
    @paymentMethods = @item.payment_methods

    @categories = Array.new
    category = @item.category
    while (!category.nil?)
     @categories.insert(0,category)
     category = category.category
    end

    @califications = @item.califications
    @product = @item.catalog_product
    @product.calculate_reviews_summary
    @reviews = @product.reviews
    @catalogProductAttrs = @product.catalog_product_attributes

    @items_seller = Item.all(:conditions => ["customer_id = ? and id <> ?", @customer.id, @item.id])


     respond_to do |format|
       format.html # show.html.erb
       format.xml  { render :xml => @item }
       #format.json { render :json => @item }
     end
  end

  # GET /items/new
  # GET /items/new.xml
  # def new
    # @item = Item.new

    # respond_to do |format|
      # format.html # new.html.erb
      # format.xml  { render :xml => @item }
    # end
  # end

  # GET /items/1/edit
  # def edit
    # @item = Item.find(params[:id])
  # end

  # POST /items
  # POST /items.xml
  # def create
    # @item = Item.new(params[:item])

    # respond_to do |format|
      # if @item.save
        # flash[:notice] = 'Item was successfully created.'
        # format.html { redirect_to(@item) }
        # format.xml  { render :xml => @item, :status => :created, :location => @item }
      # else
        # format.html { render :action => "new" }
        # format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      # end
    # end
  # end

  # PUT /items/1
  # PUT /items/1.xml
  # def update
    # @item = Item.find(params[:id])

    # respond_to do |format|
      # if @item.update_attributes(params[:item])
        # flash[:notice] = 'Item was successfully updated.'
        # format.html { redirect_to(@item) }
        # format.xml  { head :ok }
      # else
        # format.html { render :action => "edit" }
        # format.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      # end
   # end
  # end

  # DELETE /items/1
  # DELETE /items/1.xml
  # def destroy
    # @item = Item.find(params[:id])
    # @item.destroy

    # respond_to do |format|
      # format.html { redirect_to(items_url) }
      # format.xml  { head :ok }
    # end
  # end
end
