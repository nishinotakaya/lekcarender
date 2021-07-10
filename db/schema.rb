# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_10_031739) do

  create_table "blogs", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "content"
    t.text "content_1"
    t.text "content_2"
    t.text "content_3"
    t.date "start_time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_blogs_on_user_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "use_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.string "name_h"
    t.string "sex"
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "lek_urls", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "planning_papers", force: :cascade do |t|
    t.integer "blog_id"
    t.string "plannning_name"
    t.string "plannning_point"
    t.date "plannning_day"
    t.string "plannning_day_2"
    t.string "plannning_day_3"
    t.string "plannning_place"
    t.string "plannning_people_count"
    t.string "plannning_preparation_object"
    t.datetime "plannning_time"
    t.string "planning_note"
    t.string "planning_severe"
    t.string "planning_palace_picture"
    t.string "planning_person"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["blog_id"], name: "index_planning_papers_on_blog_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.json "t_json"
    t.string "text_memo_2"
    t.string "text_memo_3"
    t.string "text_memo_4"
    t.boolean "text_check"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "blogs", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "planning_papers", "blogs"
end
