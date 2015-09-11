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

ActiveRecord::Schema.define(version: 20150911160533) do

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "ambulances", force: :cascade do |t|
    t.string   "vendor_name",         limit: 255
    t.string   "registration_number", limit: 255
    t.string   "mobile",              limit: 255
    t.string   "driver_name",         limit: 255
    t.string   "type",                limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "ambulances_requests", id: false, force: :cascade do |t|
    t.integer "ambulance_id", limit: 4
    t.integer "request_id",   limit: 4
  end

  create_table "diseases", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "diseases_requests", force: :cascade do |t|
    t.integer "disease_id", limit: 4
    t.integer "request_id", limit: 4
  end

  create_table "doctors", force: :cascade do |t|
    t.string   "name",            limit: 255,                            default: "", null: false
    t.string   "mobile",          limit: 255,                            default: "", null: false
    t.text     "address",         limit: 65535
    t.integer  "recommendations", limit: 4
    t.decimal  "lat",                           precision: 10, scale: 6
    t.decimal  "long",                          precision: 10, scale: 6
    t.string   "type",            limit: 255
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string   "name",         limit: 255,                            default: "", null: false
    t.string   "phone",        limit: 255,                            default: "", null: false
    t.text     "address",      limit: 65535
    t.string   "contact_name", limit: 255
    t.decimal  "lat",                        precision: 10, scale: 6
    t.decimal  "long",                       precision: 10, scale: 6
    t.decimal  "rating",                     precision: 4,  scale: 2
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  create_table "precautions", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.string   "video_url",   limit: 255
    t.integer  "image_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "requests", force: :cascade do |t|
    t.string   "mobile",       limit: 255
    t.text     "address",      limit: 65535
    t.string   "lat",          limit: 255
    t.string   "long",         limit: 255
    t.integer  "ambulance_id", limit: 4
    t.integer  "hospital_id",  limit: 4
    t.integer  "doctor_id",    limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "requests", ["ambulance_id"], name: "index_requests_on_ambulance_id", using: :btree
  add_index "requests", ["doctor_id"], name: "index_requests_on_doctor_id", using: :btree
  add_index "requests", ["hospital_id"], name: "index_requests_on_hospital_id", using: :btree

  create_table "requests_symptoms", id: false, force: :cascade do |t|
    t.integer "symptom_id", limit: 4
    t.integer "request_id", limit: 4
  end

  create_table "symptoms", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
