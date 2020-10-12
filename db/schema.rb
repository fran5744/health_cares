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

ActiveRecord::Schema.define(version: 20201009054542) do

  create_table "entries", force: :cascade do |t|
    t.string "user_id"
    t.integer "weight"
    t.integer "height"
    t.string "ex_type_1"
    t.string "ex_time_1"
    t.integer "ex_amount_1"
    t.string "ex_type_2"
    t.string "ex_time_2"
    t.integer "ex_amount_2"
    t.string "ex_type_3"
    t.string "ex_time_3"
    t.integer "ex_amount_3"
    t.boolean "meal_asa"
    t.boolean "meal_hiru"
    t.boolean "meal_ban"
    t.boolean "snack"
    t.text "snack_memo"
    t.integer "condition"
    t.date "day"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "user_id"
    t.string "ps"
    t.string "name"
    t.integer "authority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
