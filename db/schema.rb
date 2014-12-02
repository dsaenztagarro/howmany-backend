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

ActiveRecord::Schema.define(version: 20141202100522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_type_attribute_relations", force: true do |t|
    t.integer  "event_type_id"
    t.integer  "event_type_attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_type_attributes", force: true do |t|
    t.string   "name"
    t.string   "value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_types", force: true do |t|
    t.string "title"
  end

end
