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

ActiveRecord::Schema.define(version: 20161014184910) do

  create_table "activities", force: :cascade do |t|
    t.string   "name",           limit: 255,                           null: false
    t.string   "classification", limit: 255
    t.date     "started_at"
    t.date     "ended_at"
    t.decimal  "default_price",                precision: 8, scale: 2
    t.text     "details",        limit: 65535
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.integer  "school_id",      limit: 4
  end

  add_index "activities", ["school_id"], name: "index_activities_on_school_id", using: :btree

  create_table "activity_classes", force: :cascade do |t|
    t.datetime "started_at",            null: false
    t.datetime "ended_at",              null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "activity_id", limit: 4, null: false
  end

  add_index "activity_classes", ["activity_id"], name: "index_activity_classes_on_activity_id", using: :btree

  create_table "guardians", force: :cascade do |t|
    t.string   "nic",          limit: 255, default: "", null: false
    t.string   "name",         limit: 255, default: "", null: false
    t.string   "surname",      limit: 255, default: "", null: false
    t.string   "phone_number", limit: 255
    t.string   "address",      limit: 255
    t.string   "town",         limit: 255
    t.string   "province",     limit: 255
    t.string   "zip_code",     limit: 255
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "student_id",   limit: 4,                null: false
  end

  add_index "guardians", ["student_id"], name: "index_guardians_on_student_id", using: :btree

  create_table "school_representatives", force: :cascade do |t|
    t.string   "full_name",  limit: 255,   default: "", null: false
    t.string   "position",   limit: 255
    t.text     "details",    limit: 65535
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "school_id",  limit: 4,                  null: false
  end

  add_index "school_representatives", ["school_id"], name: "index_school_representatives_on_school_id", using: :btree

  create_table "schools", force: :cascade do |t|
    t.string   "name",       limit: 255, default: "", null: false
    t.string   "address",    limit: 255
    t.string   "town",       limit: 255
    t.string   "province",   limit: 255
    t.string   "zip_code",   limit: 255
    t.string   "email",      limit: 255
    t.string   "phone",      limit: 255
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "student_activity_sign_ups", force: :cascade do |t|
    t.decimal  "activity_discount",           precision: 5, scale: 4, default: 0.0, null: false
    t.date     "started_at"
    t.date     "ended_at"
    t.integer  "payment_type",      limit: 4,                         default: 0,   null: false
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.integer  "activity_id",       limit: 4,                                       null: false
    t.integer  "student_id",        limit: 4,                                       null: false
  end

  add_index "student_activity_sign_ups", ["activity_id"], name: "index_student_activity_sign_ups_on_activity_id", using: :btree
  add_index "student_activity_sign_ups", ["student_id"], name: "index_student_activity_sign_ups_on_student_id", using: :btree

  create_table "student_class_data", force: :cascade do |t|
    t.boolean  "attended"
    t.boolean  "paid"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "activity_class_id",           limit: 4, null: false
    t.integer  "student_activity_sign_up_id", limit: 4, null: false
  end

  add_index "student_class_data", ["activity_class_id"], name: "index_student_class_data_on_activity_class_id", using: :btree
  add_index "student_class_data", ["student_activity_sign_up_id"], name: "index_student_class_data_on_student_activity_sign_up_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "name",                 limit: 255,                           default: ""
    t.string   "surname",              limit: 255,                           default: ""
    t.string   "nic",                  limit: 255
    t.decimal  "default_discount",                   precision: 5, scale: 4, default: 0.0, null: false
    t.integer  "default_payment_type", limit: 4,                             default: 0,   null: false
    t.string   "scholar_phone_number", limit: 255
    t.string   "phone_number",         limit: 255
    t.string   "address",              limit: 255
    t.string   "town",                 limit: 255
    t.string   "province",             limit: 255
    t.string   "zip_code",             limit: 255
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.text     "details",              limit: 65535
    t.integer  "school_id",            limit: 4
    t.string   "iban",                 limit: 255
    t.string   "account_holder",       limit: 255
  end

  add_index "students", ["school_id"], name: "index_students_on_school_id", using: :btree

  create_table "teacher_activities", force: :cascade do |t|
    t.boolean  "attendance_management",           default: false, null: false
    t.boolean  "collection_management",           default: false, null: false
    t.boolean  "teacher_in_charge",               default: true,  null: false
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "activity_id",           limit: 4,                 null: false
    t.integer  "teacher_id",            limit: 4,                 null: false
  end

  add_index "teacher_activities", ["activity_id"], name: "index_teacher_activities_on_activity_id", using: :btree
  add_index "teacher_activities", ["teacher_id"], name: "index_teacher_activities_on_teacher_id", using: :btree

  create_table "teacher_users", force: :cascade do |t|
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "user_id",    limit: 4
    t.integer  "teacher_id", limit: 4
  end

  add_index "teacher_users", ["teacher_id"], name: "index_teacher_users_on_teacher_id", using: :btree
  add_index "teacher_users", ["user_id"], name: "index_teacher_users_on_user_id", using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "name",                          limit: 255,   default: ""
    t.string   "surname",                       limit: 255,   default: ""
    t.string   "work_email",                    limit: 255,   default: ""
    t.string   "nic",                           limit: 255
    t.string   "mobile_phone_number",           limit: 255
    t.string   "phone_number",                  limit: 255
    t.string   "address",                       limit: 255
    t.string   "town",                          limit: 255
    t.string   "province",                      limit: 255
    t.string   "zip_code",                      limit: 255
    t.string   "iban",                          limit: 255
    t.string   "photo_file_name",               limit: 255
    t.string   "photo_content_type",            limit: 255
    t.integer  "photo_file_size",               limit: 4
    t.datetime "photo_updated_at"
    t.boolean  "default_collection_management",               default: false, null: false
    t.boolean  "default_attendance_management",               default: false, null: false
    t.text     "studies",                       limit: 65535
    t.text     "details",                       limit: 65535
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  add_index "teachers", ["name", "surname"], name: "index_teachers_on_name_and_surname", using: :btree

  create_table "time_week_cycles", force: :cascade do |t|
    t.datetime "activity_class_starts_at",           null: false
    t.datetime "activity_class_ends_at",             null: false
    t.date     "period_started_at"
    t.date     "period_ended_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "activity_id",              limit: 4, null: false
  end

  add_index "time_week_cycles", ["activity_id"], name: "index_time_week_cycles_on_activity_id", using: :btree

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
    t.integer  "role",                limit: 4,   default: 0,  null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["login"], name: "index_users_on_login", unique: true, using: :btree

  add_foreign_key "activities", "schools"
  add_foreign_key "activity_classes", "activities"
  add_foreign_key "guardians", "students"
  add_foreign_key "school_representatives", "schools"
  add_foreign_key "student_activity_sign_ups", "activities"
  add_foreign_key "student_activity_sign_ups", "students"
  add_foreign_key "student_class_data", "activity_classes"
  add_foreign_key "student_class_data", "student_activity_sign_ups"
  add_foreign_key "students", "schools"
  add_foreign_key "teacher_activities", "activities"
  add_foreign_key "teacher_activities", "teachers"
  add_foreign_key "teacher_users", "teachers"
  add_foreign_key "teacher_users", "users"
  add_foreign_key "time_week_cycles", "activities"
end
