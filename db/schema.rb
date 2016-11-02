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

ActiveRecord::Schema.define(version: 20161101214539) do

  create_table "records", force: :cascade do |t|
    t.integer  "year"
    t.string   "result"
    t.float    "winningpercentage"
    t.integer  "team_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "records", ["team_id"], name: "index_records_on_team_id"

  create_table "recruiting_classes", force: :cascade do |t|
    t.integer  "year"
    t.integer  "rank"
    t.integer  "five_stars"
    t.integer  "four_stars"
    t.integer  "three_stars"
    t.integer  "team_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "recruiting_classes", ["team_id"], name: "index_recruiting_classes_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
