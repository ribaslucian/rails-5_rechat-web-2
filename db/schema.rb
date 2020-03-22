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

  create_table "acronyms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "data_refer", limit: 64
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interactions", force: :cascade do |t|
    t.string "name"
    t.json "user_sends"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.datetime "date"
    t.integer "sequence"
    t.integer "interaction_id"
    t.integer "type_acronym_id"
    t.json "sent_users_id"
    t.json "answered_user_id"
    t.integer "sent_user_id"
    t.integer "received_user_id"
    t.integer "father_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["interaction_id"], name: "index_messages_on_interaction_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "entity_name"
    t.string "name"
    t.string "password"
    t.integer "answer_1_acronym_id"
    t.integer "answer_2_acronym_id"
    t.integer "answer_3_acronym_id"
  end

end
