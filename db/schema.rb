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

ActiveRecord::Schema.define(version: 20160414012656) do

  create_table "friendships", force: :cascade do |t|
    t.integer  "friendable_id"
    t.string   "friendable_type"
    t.integer  "friend_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.integer  "response"
    t.integer  "line_item_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "date",         default: ""
    t.string   "time",         default: ""
  end

  create_table "line_items", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "raincheck_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "hype_level",    default: 0
  end

  add_index "line_items", ["raincheck_id"], name: "index_line_items_on_raincheck_id"
  add_index "line_items", ["restaurant_id"], name: "index_line_items_on_restaurant_id"

  create_table "musers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

  add_index "musers", ["email"], name: "index_musers_on_email", unique: true

  create_table "notifications", force: :cascade do |t|
    t.string   "user_id"
    t.string   "content"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rainchecks", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    default: 1
    t.integer  "user_type",  default: 0
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "street"
    t.string   "route"
    t.string   "local"
    t.string   "admin"
    t.string   "country"
    t.string   "postal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
