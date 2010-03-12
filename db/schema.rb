# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100305185636) do

  create_table "califications", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "item_id"
    t.text     "texto_calif"
    t.integer  "value_calif"
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_product_attributes", :force => true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "catalog_product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalog_products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.integer  "category_id"
    t.boolean  "accept_items"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "nickname",   :limit => 20
    t.integer  "points"
    t.integer  "qty_calif"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["nickname"], :name => "IDX_CUST_NICKNAME", :unique => true

  create_table "items", :force => true do |t|
    t.string   "site_id"
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.decimal  "price"
    t.integer  "bids_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.integer  "category_id"
    t.integer  "catalog_product_id"
  end

  add_index "items", ["category_id"], :name => "IDX_ITEMS_CATEG_ID"
  add_index "items", ["customer_id"], :name => "IDX_ITEMS_CUSTOMER"

  create_table "items_payment_methods", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "payment_method_id"
  end

  create_table "items_ship_methods", :id => false, :force => true do |t|
    t.integer "item_id"
    t.integer "ship_method_id"
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "item_id"
    t.text     "question"
    t.date     "question_dt"
    t.text     "answer"
    t.date     "answer_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["item_id"], :name => "index_questions_on_item_id"

  create_table "reviews", :force => true do |t|
    t.string   "title"
    t.integer  "points"
    t.integer  "customer_id"
    t.integer  "catalog_product_id"
    t.text     "pros"
    t.text     "contras"
    t.text     "conclusion"
    t.integer  "qty_votes"
    t.integer  "qty_pos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["catalog_product_id"], :name => "IDX_REVIEWS_PROD_ID"

  create_table "ship_methods", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "site_id",    :limit => 3, :null => false
    t.string   "locale",     :limit => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["site_id"], :name => "IDX_SITE_UNIQUE", :unique => true

end
