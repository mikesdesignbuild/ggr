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

ActiveRecord::Schema.define(version: 20140101005419) do

  create_table "boats", force: true do |t|
    t.string   "name"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_locations", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.date     "on_date"
    t.time     "at_time"
    t.string   "boat"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["on_date"], name: "index_events_on_on_date"

  create_table "member_profiles", force: true do |t|
    t.integer  "member_id"
    t.string   "name"
    t.string   "interests"
    t.string   "purpose"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "member_profiles", ["name"], name: "index_member_profiles_on_name"

  create_table "members", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "participations", force: true do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.string   "captain"
    t.string   "coxswain"
    t.boolean  "missed"
    t.boolean  "late"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
