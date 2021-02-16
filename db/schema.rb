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

ActiveRecord::Schema.define(version: 2021_02_16_185333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_participants_on_project_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "stage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
  end

  create_table "properties", force: :cascade do |t|
    t.string "offer_url"
    t.string "title"
    t.text "description"
    t.string "street"
    t.string "number"
    t.string "zipcode"
    t.string "city"
    t.string "floor"
    t.float "latitude"
    t.float "longitude"
    t.float "rent_per_sqm"
    t.integer "lettable_area"
    t.date "availability"
    t.bigint "user_id", null: false
    t.boolean "active"
    t.string "cloudinary_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id", null: false
    t.index ["project_id"], name: "index_properties_on_project_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.boolean "admin", default: false
    t.string "company"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.integer "stage"
    t.bigint "user_id", null: false
    t.integer "vote_location"
    t.integer "vote_price"
    t.integer "vote_size"
    t.integer "vote_average"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "property_id", null: false
    t.index ["property_id"], name: "index_votes_on_property_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "participants", "projects"
  add_foreign_key "participants", "users"
  add_foreign_key "properties", "projects"
  add_foreign_key "properties", "users"
  add_foreign_key "votes", "properties"
  add_foreign_key "votes", "users"
end
