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

ActiveRecord::Schema.define(version: 20170408225907) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string   "description",   null: false
    t.integer  "price",         null: false
    t.integer  "challenger_id", null: false
    t.integer  "acceptor_id",   null: false
    t.integer  "witness_id"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "handshakes", force: :cascade do |t|
    t.integer  "challenge_id", null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",                                                                                    null: false
    t.string   "last_name",                                                                                     null: false
    t.string   "email",                                                                                         null: false
    t.string   "phone",                                                                                         null: false
    t.string   "username",                                                                                      null: false
    t.string   "profile_picture", default: "https://robohash.org/autconsequaturquia.png?size=300x300&set=set1"
    t.string   "password_digest",                                                                               null: false
    t.string   "dwolla_url"
    t.string   "dwolla_id"
    t.datetime "created_at",                                                                                    null: false
    t.datetime "updated_at",                                                                                    null: false
  end

end
