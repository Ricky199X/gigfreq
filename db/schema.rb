# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_13_160052) do

  create_table "accounts", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.boolean "band", default: false
    t.string "accountable_type"
    t.integer "accountable_id"
    t.index ["accountable_type", "accountable_id"], name: "index_accounts_on_accountable_type_and_accountable_id"
  end

  create_table "band_shows", force: :cascade do |t|
    t.integer "band_id"
    t.integer "show_id"
  end

  create_table "bands", force: :cascade do |t|
    t.string "website"
    t.string "genre"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "shows", force: :cascade do |t|
    t.string "name"
    t.string "venue"
    t.string "city"
    t.string "state"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_bands", force: :cascade do |t|
    t.integer "user_id"
    t.integer "band_id"
  end

  create_table "user_shows", force: :cascade do |t|
    t.integer "user_id"
    t.integer "show_id"
    t.integer "tickets_bought"
  end

  create_table "users", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "favorite_band"
  end

end
