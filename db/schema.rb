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

ActiveRecord::Schema.define(version: 2020_07_29_104452) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.string "romaji", null: false
    t.integer "location_id", null: false
    t.bigint "prefecture_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prefecture_id"], name: "index_cities_on_prefecture_id"
  end

  create_table "prefectures", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statistics", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.float "temp_max"
    t.float "temp_min"
    t.string "weather_d"
    t.string "weather_n"
    t.datetime "date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_statistics_on_city_id"
  end

  create_table "weather_forecasts", force: :cascade do |t|
    t.float "temp_max", null: false
    t.float "temp_min", null: false
    t.float "temp_feel"
    t.integer "weather_id", null: false
    t.float "rainfall"
    t.datetime "date", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "aquired_at"
    t.index ["city_id"], name: "index_weather_forecasts_on_city_id"
  end

  add_foreign_key "cities", "prefectures"
  add_foreign_key "statistics", "cities"
  add_foreign_key "weather_forecasts", "cities"
end
