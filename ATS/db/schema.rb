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


ActiveRecord::Schema.define(version: 20180328163359) do


  create_table "degrees", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "students_id"
  end


  add_index "employers", ["students_id"], name: "index_employers_on_students_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "users_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["users_id"], name: "index_roles_on_users_id"


  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "email"
    t.string   "name"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_image"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.integer  "role_id"
    t.integer  "google_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "users", ["role_id"], name: "index_users_on_role_id"

end
