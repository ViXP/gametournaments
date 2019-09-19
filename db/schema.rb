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

ActiveRecord::Schema.define(version: 2019_09_19_160925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "captains", id: :serial, force: :cascade do |t|
    t.string "login", limit: 50, null: false
    t.string "email", limit: 150
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_captains_on_login", unique: true
  end

  create_table "events", id: false, force: :cascade do |t|
    t.integer "event_type", null: false
    t.integer "value", null: false
    t.datetime "time", null: false
    t.index ["event_type", "time"], name: "events_event_type_time_key", unique: true
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "logo"
    t.string "title", null: false
    t.bigint "captain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captain_id"], name: "index_teams_on_captain_id"
    t.index ["title"], name: "index_teams_on_title", unique: true
  end

  create_table "teams_tournaments", force: :cascade do |t|
    t.bigint "tournament_id", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id", "tournament_id"], name: "index_teams_tournaments_on_team_id_and_tournament_id"
    t.index ["tournament_id", "team_id"], name: "index_teams_tournaments_on_tournament_id_and_team_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "title", limit: 250, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "teams", "captains"
end
