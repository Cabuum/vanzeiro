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

ActiveRecord::Schema.define(version: 20161028021746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authorizations", force: :cascade do |t|
    t.string   "provider",   limit: 20
    t.string   "uid"
    t.integer  "user_id"
    t.string   "token"
    t.string   "secret"
    t.string   "username",   limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "bank_id"
    t.string   "agency"
    t.string   "account"
    t.string   "agreement"
    t.string   "instruction1"
    t.string   "instruction2"
    t.string   "instruction3"
    t.string   "instruction4"
    t.string   "instruction5"
    t.string   "instruction6"
    t.string   "instruction7"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nick",         limit: 30
  end

  add_index "bank_accounts", ["bank_id"], name: "index_bank_accounts_on_bank_id", using: :btree
  add_index "bank_accounts", ["user_id"], name: "index_bank_accounts_on_user_id", using: :btree

  create_table "banks", force: :cascade do |t|
    t.string   "full_name",  limit: 30
    t.string   "name",       limit: 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "passenger_id"
    t.integer  "account_id"
    t.decimal  "interest",     precision: 5,  scale: 2
    t.date     "start"
    t.date     "closing_date"
    t.decimal  "value",        precision: 10, scale: 2
    t.boolean  "is_alive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contracts", ["account_id"], name: "index_contracts_on_account_id", using: :btree
  add_index "contracts", ["passenger_id"], name: "index_contracts_on_passenger_id", using: :btree
  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title",       limit: 180
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "installments", force: :cascade do |t|
    t.integer  "contract_id"
    t.date     "due_date"
    t.boolean  "paid",         default: true
    t.date     "payment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "installments", ["contract_id"], name: "index_installments_on_contract_id", using: :btree

  create_table "movement_categories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       limit: 40
    t.integer  "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "movement_categories", ["user_id"], name: "index_movement_categories_on_user_id", using: :btree

  create_table "movements", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "description", limit: 255
    t.string   "from_of",     limit: 100
    t.decimal  "value",                   precision: 10, scale: 2
    t.boolean  "paid",                                             default: false
    t.date     "expiration"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type"
  end

  add_index "movements", ["user_id"], name: "index_movements_on_user_id", using: :btree

  create_table "newsletters", force: :cascade do |t|
    t.string   "mail"
    t.boolean  "skills",     default: true
    t.boolean  "discounts",  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "passengers", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "responsible_cpf",    limit: 14
    t.string   "responsible_name",   limit: 40
    t.string   "responsible_phone",  limit: 15
    t.string   "responsible_email",  limit: 60
    t.date     "passenger_birthday"
    t.string   "passenger_cpf",      limit: 14
    t.string   "passenger_phone",    limit: 15
    t.string   "passenger_name",     limit: 40
    t.string   "passenger_email",    limit: 60
    t.string   "passenger_address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passengers", ["user_id"], name: "index_passengers_on_user_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price",            precision: 10, scale: 2
    t.string   "description"
    t.text     "full_description"
    t.boolean  "clause",                                    default: false
    t.boolean  "clause2",                                   default: false
    t.boolean  "clause3",                                   default: false
    t.boolean  "clause4",                                   default: false
    t.boolean  "selected",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.integer  "business_day_for_payments"
    t.integer  "user_id"
    t.integer  "start_school_year"
    t.integer  "end_school_year"
    t.decimal  "default_value",             precision: 10, scale: 2
    t.decimal  "default_interest",          precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["user_id"], name: "index_settings_on_user_id", using: :btree

  create_table "spectators", force: :cascade do |t|
    t.string   "mail",       limit: 80
    t.string   "phone",      limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suggestions", force: :cascade do |t|
    t.text     "description"
    t.string   "title"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "document",               limit: 25
    t.string   "name",                   limit: 40
    t.string   "social_reason",          limit: 110
    t.string   "fantasy_name",           limit: 75
    t.string   "phone",                  limit: 15
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
