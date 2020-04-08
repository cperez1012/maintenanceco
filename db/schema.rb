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

ActiveRecord::Schema.define(version: 2020_02_13_214423) do

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.string "summary"
    t.text "description"
    t.string "priority"
    t.integer "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project"
    t.string "status"
    t.text "comment"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "provider"
    t.integer "expires_at"
    t.boolean "expires"
    t.string "google_token"
    t.string "google_refresh_token"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
