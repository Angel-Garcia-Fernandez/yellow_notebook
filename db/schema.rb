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

ActiveRecord::Schema.define(version: 20160918221651) do

  create_table "account_details", force: :cascade do |t|
    t.string   "IBAN",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "activities", force: :cascade do |t|
    t.string   "code",           limit: 255
    t.string   "name",           limit: 255
    t.string   "classification", limit: 255
    t.date     "started_at"
    t.date     "ended_at"
    t.decimal  "default_price",              precision: 8, scale: 2
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "activity_classes", force: :cascade do |t|
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guardians", force: :cascade do |t|
    t.string   "NIC",          limit: 255
    t.string   "name",         limit: 255
    t.string   "surname",      limit: 255
    t.string   "phone_number", limit: 255
    t.string   "address",      limit: 255
    t.string   "town",         limit: 255
    t.string   "province",     limit: 255
    t.string   "zip_code",     limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "school_representatives", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "position",   limit: 255
    t.text     "details",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "address",    limit: 255
    t.string   "town",       limit: 255
    t.string   "province",   limit: 255
    t.string   "zip_code",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "student_activity_sign_ups", force: :cascade do |t|
    t.decimal  "activity_discount",           precision: 4, scale: 4
    t.date     "started_at"
    t.date     "ended_at"
    t.integer  "payment_type_eid",  limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  create_table "student_class_data", force: :cascade do |t|
    t.boolean  "attended"
    t.boolean  "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "NIC",                      limit: 255
    t.string   "name",                     limit: 255
    t.string   "surname",                  limit: 255
    t.decimal  "default_discount",                     precision: 4, scale: 4
    t.integer  "default_payment_type_eid", limit: 4
    t.string   "scholar_phone_number",     limit: 255
    t.string   "phone_number",             limit: 255
    t.string   "address",                  limit: 255
    t.string   "town",                     limit: 255
    t.string   "province",                 limit: 255
    t.string   "zip_code",                 limit: 255
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name",                      limit: 255,   default: ""
    t.string   "surname",                   limit: 255,   default: ""
    t.boolean  "manage_attendance_default",               default: false, null: false
    t.boolean  "manage_collection_default",               default: false, null: false
    t.text     "details",                   limit: 65535
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
  end

  add_index "teachers", ["name", "surname"], name: "index_teachers_on_name_and_surname", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "login",               limit: 255, default: "", null: false
    t.string   "email",               limit: 255, default: "", null: false
    t.string   "encrypted_password",  limit: 255, default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",  limit: 255
    t.string   "last_sign_in_ip",     limit: 255
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

end
