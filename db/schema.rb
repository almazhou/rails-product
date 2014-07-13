# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140713063046) do

  create_table "customers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  create_table "orders", force: true do |t|
    t.decimal  "totalCost",   precision: 10, scale: 2
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "amount"
    t.integer  "order_id"
    t.integer  "customer_id"
  end

  add_index "payments", ["customer_id"], name: "index_payments_on_customer_id"
  add_index "payments", ["order_id"], name: "index_payments_on_order_id"

  create_table "pricings", force: true do |t|
    t.integer  "amount"
    t.integer  "rproduct_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pricings", ["rproduct_id"], name: "index_pricings_on_rproduct_id"

  create_table "rproducts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
