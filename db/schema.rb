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

ActiveRecord::Schema.define(version: 20211015054233) do

  create_table "expends", force: :cascade do |t|
    t.integer "user_id"
    t.date "expend_date"
    t.integer "saving_id"
    t.string "group"
    t.integer "expend_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "memo"
    t.index ["saving_id"], name: "index_expends_on_saving_id"
    t.index ["user_id"], name: "index_expends_on_user_id"
  end

  create_table "incomes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "saving_id"
    t.integer "income_amount"
    t.date "income_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "memo"
    t.index ["saving_id"], name: "index_incomes_on_saving_id"
    t.index ["user_id"], name: "index_incomes_on_user_id"
  end

  create_table "savings", force: :cascade do |t|
    t.string "saving_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_savings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
