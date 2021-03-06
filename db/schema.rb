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

ActiveRecord::Schema.define(version: 20150526110311) do

  create_table "buses", force: :cascade do |t|
    t.string   "line_id"
    t.integer  "edge_id"
    t.integer  "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buses", ["edge_id"], name: "index_buses_on_edge_id"

  create_table "edges", force: :cascade do |t|
    t.string   "line_id"
    t.integer  "edge_index"
    t.string   "from"
    t.string   "to"
    t.integer  "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lines", force: :cascade do |t|
    t.string   "name"
    t.string   "line_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "name"
    t.integer  "kind"
    t.integer  "arrival_time"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "direction"
  end

  create_table "stops", force: :cascade do |t|
    t.string   "name"
    t.string   "stop_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "property"
  end

end
