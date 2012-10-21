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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121021221755) do

  create_table "service_report_categories", :force => true do |t|
    t.integer  "category_id"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "code"
  end

  create_table "service_reports", :force => true do |t|
    t.decimal  "lat"
    t.decimal  "lng"
    t.string   "address"
    t.string   "email"
    t.string   "prefered_response_method"
    t.integer  "service_report_category_id"
    t.boolean  "commendation"
    t.integer  "axis_id"
    t.string   "axis_type"
    t.integer  "vehicle_id"
    t.boolean  "responded"
    t.string   "response_text"
    t.string   "response_reply_to"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.text     "report_text"
  end

  create_table "sf_transit_junctions", :force => true do |t|
    t.decimal  "lat",        :precision => 15, :scale => 10
    t.decimal  "lng",        :precision => 15, :scale => 10
    t.text     "name"
    t.string   "address"
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
  end

  create_table "sf_transit_leg_junctions", :force => true do |t|
    t.integer  "junction_id"
    t.integer  "leg_id"
    t.integer  "weight"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "sf_transit_leg_stops", :force => true do |t|
    t.integer  "stop_id"
    t.integer  "leg_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sf_transit_legs", :force => true do |t|
    t.string   "abbr"
    t.string   "title"
    t.integer  "route_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sf_transit_routes", :force => true do |t|
    t.string   "abbr"
    t.string   "agency"
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sf_transit_stops", :force => true do |t|
    t.decimal  "lat",         :precision => 15, :scale => 10
    t.decimal  "lng",         :precision => 15, :scale => 10
    t.string   "address"
    t.string   "title"
    t.integer  "transfer_id"
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  create_table "sf_transit_transfers", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
