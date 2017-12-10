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

ActiveRecord::Schema.define(version: 20171209160132) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "captains", force: :cascade do |t|
    t.string "login", limit: 50, null: false
    t.string "email", limit: 150
    t.string "avatar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["login"], name: "index_captains_on_login"
  end

  create_table "teams", force: :cascade do |t|
    t.string "logo"
    t.string "title", null: false
    t.bigint "captain_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captain_id"], name: "index_teams_on_captain_id"
    t.index ["title"], name: "index_teams_on_title"
  end

  create_table "teams_tournaments", id: false, force: :cascade do |t|
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
