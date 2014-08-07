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

ActiveRecord::Schema.define(version: 20140807080605) do

  create_table "artists", force: true do |t|
    t.string   "nickname",                                         null: false
    t.integer  "sex",                                  default: 0
    t.string   "telephone",                                        null: false
    t.string   "email"
    t.date     "birthday",                                         null: false
    t.string   "begin_year",                                       null: false
    t.string   "avatar"
    t.text     "description"
    t.string   "address",                                          null: false
    t.decimal  "latitude",    precision: 10, scale: 6
    t.decimal  "longitude",   precision: 10, scale: 6
    t.integer  "status",                               default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artists", ["email"], name: "index_artists_on_email", unique: true, using: :btree
  add_index "artists", ["nickname"], name: "index_artists_on_nickname", unique: true, using: :btree
  add_index "artists", ["telephone"], name: "index_artists_on_telephone", unique: true, using: :btree

end
