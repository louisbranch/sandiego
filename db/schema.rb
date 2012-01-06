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

ActiveRecord::Schema.define(:version => 20120105200257) do

  create_table "missions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "prize"
    t.date     "end_date"
    t.integer  "rank_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "missions", ["rank_id"], :name => "index_missions_on_rank_id"
  add_index "missions", ["user_id"], :name => "index_missions_on_user_id"

  create_table "ranks", :force => true do |t|
    t.string   "name"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "suspects", :force => true do |t|
    t.integer  "mission_id"
    t.text     "raw_info"
    t.string   "facebook_id"
    t.string   "name"
    t.string   "gender"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "suspects", ["facebook_id"], :name => "index_suspects_on_facebook_id"
  add_index "suspects", ["mission_id"], :name => "index_suspects_on_mission_id"

  create_table "users", :force => true do |t|
    t.string   "facebook_id"
    t.string   "oauth_token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "rank_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id"
  add_index "users", ["rank_id"], :name => "index_users_on_rank_id"

end