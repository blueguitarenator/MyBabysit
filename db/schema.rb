# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101122010824) do

  create_table "babysitters", :force => true do |t|
    t.string   "lastName"
    t.string   "firstName"
    t.string   "email"
    t.string   "city"
    t.string   "stateAbbr"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

  create_table "babysitters_parents", :id => false, :force => true do |t|
    t.integer "parent_id"
    t.integer "babysitter_id"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "eventDate"
    t.string   "startTime"
    t.string   "endTime"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
  end

  create_table "parents", :force => true do |t|
    t.string   "lastName"
    t.string   "firstName"
    t.string   "email"
    t.string   "city"
    t.string   "stateAbbr"
    t.integer  "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
  end

  create_table "replies", :force => true do |t|
    t.string   "answer"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id"
    t.integer  "babysitter_id"
  end

end
