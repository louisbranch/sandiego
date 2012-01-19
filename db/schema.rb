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

ActiveRecord::Schema.define(:version => 20120119141552) do

  create_table "cities", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.string   "photo_path"
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

  create_table "fillers", :force => true do |t|
    t.text     "description"
    t.boolean  "correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "headlines", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo_path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "photo_path"
    t.string   "witness"
    t.string   "witness_photo_path"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "missions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "headline_id"
    t.integer  "rank_id"
    t.integer  "hours"
    t.integer  "xp"
    t.boolean  "finished"
    t.boolean  "won"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "missions", ["headline_id"], :name => "index_missions_on_headline_id"
  add_index "missions", ["rank_id"], :name => "index_missions_on_rank_id"
  add_index "missions", ["user_id"], :name => "index_missions_on_user_id"

  create_table "networks", :force => true do |t|
    t.integer  "track_id"
    t.integer  "location_id"
    t.integer  "informable_id"
    t.string   "informable_type"
    t.boolean  "final"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "networks", ["location_id"], :name => "index_networks_on_location_id"
  add_index "networks", ["track_id"], :name => "index_networks_on_track_id"

  create_table "progresses", :force => true do |t|
    t.integer  "mission_id"
    t.integer  "track_id"
    t.integer  "network_id"
    t.integer  "remaining_hours"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "progresses", ["mission_id"], :name => "index_progresses_on_mission_id"
  add_index "progresses", ["network_id"], :name => "index_progresses_on_network_id"
  add_index "progresses", ["track_id"], :name => "index_progresses_on_track_id"

  create_table "ranks", :force => true do |t|
    t.integer  "position"
    t.string   "name"
    t.integer  "track_breadth"
    t.integer  "track_depth"
    t.integer  "minimum_xp"
    t.integer  "bonus_multiplier"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
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
    t.boolean  "found"
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
    t.integer  "xp"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "users", ["facebook_id"], :name => "index_users_on_facebook_id"
  add_index "users", ["rank_id"], :name => "index_users_on_rank_id"

end
