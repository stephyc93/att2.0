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

ActiveRecord::Schema.define(version: 20150720010321) do

  create_table "activies_students", id: false, force: :cascade do |t|
    t.integer "activity_id"
    t.integer "student_id"
    t.integer "present"
  end

  add_index "activies_students", ["activity_id"], name: "index_activies_students_on_activity_id"
  add_index "activies_students", ["student_id"], name: "index_activies_students_on_student_id"

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.datetime "start"
    t.datetime "end"
    t.string   "location"
    t.integer  "permission_slip"
    t.integer  "teacher_id"
  end

  create_table "parents", force: :cascade do |t|
    t.string  "name"
    t.string  "phone"
    t.integer "user_id"
  end

  create_table "parents_students", id: false, force: :cascade do |t|
    t.integer "parent_id"
    t.integer "student_id"
  end

  add_index "parents_students", ["parent_id"], name: "index_parents_students_on_parent_id"
  add_index "parents_students", ["student_id"], name: "index_parents_students_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string  "name"
    t.string  "phone"
    t.integer "user_id"
  end

  create_table "students_teachers", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "teacher_id"
  end

  add_index "students_teachers", ["student_id"], name: "index_students_teachers_on_student_id"
  add_index "students_teachers", ["teacher_id"], name: "index_students_teachers_on_teacher_id"

  create_table "teachers", force: :cascade do |t|
    t.string  "name"
    t.string  "phone"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "admin"
    t.integer  "teacher"
    t.integer  "student"
    t.integer  "parent"
    t.string   "fullname"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
