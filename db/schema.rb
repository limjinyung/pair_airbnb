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

ActiveRecord::Schema.define(version: 2019_01_15_034431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.bigint "user_id"
    t.string "token"
    t.string "provider"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_authentications_on_user_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "user_id"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "postcode"
    t.string "address"
    t.string "property_type"
    t.integer "room_number"
    t.integer "bed_number"
    t.integer "guest_number"
    t.string "tags"
    t.integer "price"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "images"
  end

  create_table "reservations", force: :cascade do |t|
    t.string "user_id"
    t.string "listing_id"
    t.boolean "check_in"
    t.boolean "check_out"
    t.string "check_in_date"
    t.string "check_out_date"
    t.integer "book_guest_number"
    t.string "memo"
    t.boolean "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "username", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.integer "phone"
    t.string "country"
    t.integer "role"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "users"
end
