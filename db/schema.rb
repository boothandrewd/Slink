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

ActiveRecord::Schema.define(version: 20170728201415) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string   "name",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "owner_id",   default: 1,     null: false
    t.boolean  "private",    default: false
    t.index ["name"], name: "index_channels_on_name", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "body",       null: false
    t.datetime "timestamp",  null: false
    t.integer  "author_id",  null: false
    t.integer  "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reply_id"
    t.index ["author_id"], name: "index_messages_on_author_id", using: :btree
    t.index ["channel_id"], name: "index_messages_on_channel_id", using: :btree
    t.index ["timestamp"], name: "index_messages_on_timestamp", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "channel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["channel_id"], name: "index_subscriptions_on_channel_id", using: :btree
    t.index ["user_id", "channel_id"], name: "index_subscriptions_on_user_id_and_channel_id", unique: true, using: :btree
    t.index ["user_id"], name: "index_subscriptions_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "screenname",                      null: false
    t.string   "password_digest",                 null: false
    t.string   "session_token",                   null: false
    t.string   "icon_url"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "online",          default: false
    t.index ["screenname"], name: "index_users_on_screenname", unique: true, using: :btree
    t.index ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  end

end
