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

ActiveRecord::Schema.define(version: 2020_03_19_213830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acronyms", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "data_refer", limit: 64, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.string "name", null: false
    t.json "user_sends"
    t.integer "type_acronym_id", default: 300, null: false
    t.integer "schedule_acronym_id", default: 400, null: false
    t.integer "number_schedule", default: 13, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "date_send", default: -> { "now()" }, null: false
    t.integer "sequence"
    t.bigint "interaction_id"
    t.integer "type_acronym_id"
    t.json "sent_users_id"
    t.json "answered_user_id"
    t.integer "type_content_acronym_id", default: 50
    t.string "url"
    t.integer "origin_user_id"
    t.integer "destiny_user_id"
    t.integer "previous_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interaction_id"], name: "index_messages_on_interaction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "entity_name", null: false
    t.string "name", null: false
    t.string "password", null: false
    t.integer "type_acronym_id", null: false
    t.integer "answer_1_acronym_id"
    t.integer "answer_2_acronym_id"
    t.integer "answer_3_acronym_id"
  end

end
