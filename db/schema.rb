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

ActiveRecord::Schema.define(:version => 20120113023416) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "clues", :force => true do |t|
    t.text     "description"
    t.integer  "city_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "clues", ["city_id"], :name => "index_clues_on_city_id"

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "witness"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "missions", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "end_date"
    t.integer  "user_id"
    t.integer  "rank_id"
    t.integer  "status_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "missions", ["rank_id"], :name => "index_missions_on_rank_id"
  add_index "missions", ["status_id"], :name => "index_missions_on_status_id"
  add_index "missions", ["user_id"], :name => "index_missions_on_user_id"

  create_table "ranks", :force => true do |t|
    t.string   "name"
    t.integer  "track_breadth"
    t.integer  "track_depth"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "suspects", :force => true do |t|
    t.integer  "mission_id"
    t.text     "raw_info"
    t.string   "facebook_id"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "suspects", ["facebook_id"], :name => "index_suspects_on_facebook_id"
  add_index "suspects", ["mission_id"], :name => "index_suspects_on_mission_id"

  create_table "tracks", :force => true do |t|
    t.integer  "mission_id"
    t.integer  "city_id"
    t.integer  "level"
    t.boolean  "correct"
    t.boolean  "final"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tracks", ["city_id"], :name => "index_tracks_on_city_id"
  add_index "tracks", ["mission_id"], :name => "index_tracks_on_mission_id"

  create_table "traits", :force => true do |t|
    t.string   "category"
    t.text     "description"
    t.integer  "suspect_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "traits", ["suspect_id"], :name => "index_traits_on_suspect_id"

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
