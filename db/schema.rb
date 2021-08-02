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

ActiveRecord::Schema.define(version: 2021_08_02_220005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: :cascade do |t|
    t.string "recipient_name", null: false
    t.date "issue_date", null: false
    t.uuid "uuid", null: false
    t.uuid "proof_id", null: false
    t.string "hash", null: false
    t.jsonb "metadata", default: "{}", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hash"], name: "index_badges_on_hash", unique: true
    t.index ["proof_id"], name: "index_badges_on_proof_id", unique: true
    t.index ["uuid"], name: "index_badges_on_uuid", unique: true
  end

end
