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

ActiveRecord::Schema.define(version: 20160717052143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "mobile_id"
    t.integer  "user_id"
  end

  add_index "images", ["mobile_id"], name: "index_images_on_mobile_id", using: :btree
  add_index "images", ["user_id"], name: "index_images_on_user_id", using: :btree

  create_table "mobiles", force: :cascade do |t|
    t.string   "company"
    t.string   "product"
    t.string   "specs"
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "confirm_password"
    t.string   "mobile"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "users_subjects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users_subjects", ["subject_id"], name: "index_users_subjects_on_subject_id", using: :btree
  add_index "users_subjects", ["user_id"], name: "index_users_subjects_on_user_id", using: :btree

  add_foreign_key "images", "mobiles"
  add_foreign_key "images", "users"
  add_foreign_key "users_subjects", "subjects"
  add_foreign_key "users_subjects", "users"
end
