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

ActiveRecord::Schema.define(version: 20170406001828) do

  create_table "poems", force: :cascade do |t|
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "round_id"
    t.integer  "user_id"
    t.boolean  "public",                default: true
    t.integer  "status",                default: 0
    t.integer  "line1_syllable_count"
    t.integer  "line2_syllable_count"
    t.integer  "line3_syllable_count"
    t.integer  "line4_syllable_count"
    t.integer  "line5_syllable_count"
    t.integer  "line6_syllable_count"
    t.integer  "line7_syllable_count"
    t.integer  "line8_syllable_count"
    t.integer  "line9_syllable_count"
    t.integer  "line10_syllable_count"
    t.text     "line1"
    t.text     "line2"
    t.text     "line3"
    t.text     "line4"
    t.text     "line5"
    t.text     "line6"
    t.text     "line7"
    t.text     "line8"
    t.text     "line9"
    t.text     "line10"
    t.text     "title"
  end

  add_index "poems", ["round_id"], name: "index_poems_on_round_id"
  add_index "poems", ["user_id"], name: "index_poems_on_user_id"

  create_table "rounds", force: :cascade do |t|
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "creator_id"
    t.string   "title"
    t.integer  "line_count",            default: 1
    t.boolean  "active",                default: false
    t.integer  "line1_syllable_count",  default: 1
    t.integer  "line2_syllable_count",  default: 0
    t.integer  "line3_syllable_count",  default: 0
    t.integer  "line4_syllable_count",  default: 0
    t.integer  "line5_syllable_count",  default: 0
    t.integer  "line6_syllable_count",  default: 0
    t.integer  "line7_syllable_count",  default: 0
    t.integer  "line8_syllable_count",  default: 0
    t.integer  "line9_syllable_count",  default: 0
    t.integer  "line10_syllable_count", default: 0
  end

  add_index "rounds", ["creator_id"], name: "index_rounds_on_creator_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "max_rounds",             default: 1
    t.string   "username"
    t.boolean  "available",              default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
