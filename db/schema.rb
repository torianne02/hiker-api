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

ActiveRecord::Schema.define(version: 2020_05_29_221840) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hikes", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.integer "park_id"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.string "park_type"
  end

  create_table "user_hikes", force: :cascade do |t|
    t.float "distance"
    t.date "date_completed"
    t.integer "elevation_gain"
    t.integer "rating"
    t.text "comment"
    t.integer "total_time"
    t.integer "user_id"
    t.integer "hike_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "gender"
    t.string "password_digest"
    t.date "birthday"
    t.string "email"
  end

end
