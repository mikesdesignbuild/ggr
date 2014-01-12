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

ActiveRecord::Schema.define(version: 20140101140320) do

  create_table "boats", force: true do |t|
    t.integer  "location_id"
    t.string   "name"
    t.string   "description"
    t.integer  "seats"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", force: true do |t|
    t.integer  "event_category_id"
    t.string   "name"
    t.string   "long_name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.integer  "event_type_id"
    t.integer  "location_id"
    t.integer  "boat_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["end_datetime"], name: "index_events_on_end_datetime"
  add_index "events", ["start_datetime"], name: "index_events_on_start_datetime"

  create_table "locations", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "address"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "street"
    t.boolean  "street_shown"
    t.string   "mobile_number"
    t.boolean  "mobile_number_shown"
    t.string   "email"
    t.boolean  "email_shown"
    t.string   "interests"
    t.string   "purpose"
    t.datetime "coxswain"
    t.datetime "captain"
    t.datetime "guest_on"
    t.datetime "joined_on"
    t.datetime "expired_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "members", ["name"], name: "index_members_on_name"

  create_table "participations", force: true do |t|
    t.integer  "event_id"
    t.integer  "member_id"
    t.datetime "left_on"
    t.string   "rower"
    t.string   "captain"
    t.string   "coxswain"
    t.string   "guest"
    t.boolean  "missed"
    t.boolean  "late"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
