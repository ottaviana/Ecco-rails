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

ActiveRecord::Schema.define(version: 20170823102341) do

  create_table "articles", force: :cascade do |t|
    t.string   "newspaper"
    t.string   "headline"
    t.text     "description"
    t.string   "link"
    t.string   "image_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "article"
    t.string   "translated_headline"
    t.string   "translated_article"
    t.string   "translated_description"
  end

  create_table "weathers", force: :cascade do |t|
    t.string  "city"
    t.string  "weather"
    t.integer "temperature"
  end

end
