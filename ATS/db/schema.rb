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

ActiveRecord::Schema.define(version: 20180329175744) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "country"
    t.string   "cell_number"
    t.string   "work_number"
    t.string   "home_number"
    t.integer  "student_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "addresses", ["student_id"], name: "index_addresses_on_student_id"

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "type"
    t.string   "name"
    t.string   "college"
    t.date     "graduated_on"
    t.integer  "department_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "degrees", ["department_id"], name: "index_degrees_on_department_id"

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "departments", ["college_id"], name: "index_departments_on_college_id"

  create_table "employers", force: :cascade do |t|
    t.string   "name"
    t.string   "number"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employments", force: :cascade do |t|
    t.string   "current_job"
    t.boolean  "in_field"
    t.integer  "employer_id"
    t.integer  "student_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "employments", ["employer_id"], name: "index_employments_on_employer_id"
  add_index "employments", ["student_id"], name: "index_employments_on_student_id"

  create_table "grad_schools", force: :cascade do |t|
    t.boolean  "applied"
    t.boolean  "accepted"
    t.string   "status"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "grad_schools", ["student_id"], name: "index_grad_schools_on_student_id"

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

  create_table "universities", force: :cascade do |t|
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
