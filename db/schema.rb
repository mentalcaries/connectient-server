# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_10_05_114225) do
  create_table "appointments", id: :string, default: -> { "ULID()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_phone"
    t.string "email"
    t.date "requested_date"
    t.string "requested_time"
    t.date "scheduled_date"
    t.time "scheduled_time"
    t.boolean "is_emergency", default: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "appointment_type"
    t.string "practice_id", null: false
    t.index ["practice_id"], name: "index_appointments_on_practice_id"
  end

  create_table "practices", id: :string, default: -> { "ULID()" }, force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.string "city"
    t.string "email"
    t.string "phone"
    t.string "practice_code"
    t.string "logo"
    t.string "facebook"
    t.string "instagram"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_id"
    t.index ["email"], name: "index_practices_on_email", unique: true
    t.index ["user_id"], name: "index_practices_on_user_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.string "user_id", null: false
    t.string "user_agent"
    t.string "ip_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "users", id: :string, default: -> { "ULID()" }, force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "verified", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "appointments", "practices"
  add_foreign_key "practices", "users"
  add_foreign_key "sessions", "users"
end
