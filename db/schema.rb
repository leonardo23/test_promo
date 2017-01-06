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

ActiveRecord::Schema.define(version: 20170106044809) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "category_name"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.string   "code_coupon"
    t.string   "description"
    t.string   "value_coupon"
    t.datetime "start_date_active_coupon"
    t.datetime "end_date_active_coupon"
    t.integer  "user_coupon"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.boolean  "status_coupon",            default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "detail_transactions", force: :cascade do |t|
    t.integer  "head_transaction_id"
    t.integer  "promo_detail_id"
    t.integer  "quantity"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "head_transactions", force: :cascade do |t|
    t.string   "transaction_number"
    t.integer  "promo_id"
    t.integer  "payment_type"
    t.integer  "code_coupon"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "category_id"
    t.string   "item_code"
    t.string   "item_description"
    t.integer  "item_quantity"
    t.decimal  "item_price",       precision: 12, scale: 2
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "promo_details", force: :cascade do |t|
    t.integer  "promo_id"
    t.string   "promo_target"
    t.integer  "value_promo"
    t.float    "value_discount"
    t.decimal  "value_price",    precision: 12, scale: 2
    t.integer  "product_id"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "promos", force: :cascade do |t|
    t.string   "code_promo"
    t.string   "promo_description"
    t.datetime "start_date_promo"
    t.datetime "end_date_promo"
    t.boolean  "status_promo",      default: true
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
