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

ActiveRecord::Schema.define(version: 20140803181802) do

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.boolean  "above"
    t.boolean  "below"
    t.integer  "high"
    t.integer  "low"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notifications", ["stock_id"], name: "index_notifications_on_stock_id"
  add_index "notifications", ["user_id"], name: "index_notifications_on_user_id"

  create_table "stocks", force: true do |t|
    t.string   "ticker"
    t.float    "price"
    t.string   "company"
    t.boolean  "owned"
    t.boolean  "watching"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stocks", ["user_id"], name: "index_stocks_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone"
  end

end
