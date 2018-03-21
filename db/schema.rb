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

ActiveRecord::Schema.define(version: 20180319132230) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clubs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "club_type", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sport_organization_id"
    t.bigint "sport_id"
    t.index ["sport_id"], name: "index_clubs_on_sport_id"
    t.index ["sport_organization_id"], name: "index_clubs_on_sport_organization_id"
  end

  create_table "competitions", force: :cascade do |t|
    t.string "name", null: false
    t.string "organizator"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sport_id"
    t.bigint "sport_complex_id"
    t.index ["sport_complex_id"], name: "index_competitions_on_sport_complex_id"
    t.index ["sport_id"], name: "index_competitions_on_sport_id"
  end

  create_table "participants", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", default: 5
    t.integer "growth", default: 100
    t.integer "weight", default: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "club_id"
    t.index ["club_id"], name: "index_participants_on_club_id"
  end

  create_table "requests", force: :cascade do |t|
    t.boolean "is_ill", default: false
    t.boolean "appeared", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "competition_id"
    t.bigint "participant_id"
    t.bigint "club_id"
    t.index ["club_id"], name: "index_requests_on_club_id"
    t.index ["competition_id"], name: "index_requests_on_competition_id"
    t.index ["participant_id"], name: "index_requests_on_participant_id"
  end

  create_table "results", force: :cascade do |t|
    t.integer "place", null: false
    t.string "height_result"
    t.string "length_result"
    t.string "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "request_id"
    t.index ["request_id"], name: "index_results_on_request_id"
  end

  create_table "sport_complexes", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.integer "capacity", default: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sport_organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "director_name", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sports", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
