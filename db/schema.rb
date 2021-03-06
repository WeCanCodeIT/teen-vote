# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160427194522) do

  create_table "choices", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "image_url",  limit: 500
    t.string   "party",      limit: 30
  end

  add_index "choices", ["issue_id"], name: "index_choices_on_issue_id"

  create_table "issue_links", force: :cascade do |t|
    t.integer  "issue_id"
    t.string   "href",        limit: 500
    t.string   "title"
    t.string   "image_url",   limit: 500
    t.string   "description", limit: 500
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "issue_links", ["issue_id"], name: "index_issue_links_on_issue_id"

  create_table "issue_types", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "national"
    t.boolean  "state"
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "issue_type_id"
    t.datetime "voting_open_time"
    t.datetime "voting_closed_time"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "ordinal"
  end

  add_index "issues", ["issue_type_id"], name: "index_issues_on_issue_type_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "voters", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "school_id"
    t.string   "gender"
    t.string   "school_year"
    t.string   "registration_number"
    t.boolean  "will_be_eighteen"
    t.boolean  "authenticated"
  end

  add_index "voters", ["registration_number"], name: "index_voters_on_registration_number", unique: true

  create_table "votes", force: :cascade do |t|
    t.integer  "voter_id"
    t.integer  "choice_id"
    t.boolean  "understand_this"
    t.boolean  "care_about_this"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["choice_id"], name: "index_votes_on_choice_id"
  add_index "votes", ["voter_id"], name: "index_votes_on_voter_id"

  add_foreign_key "choices", "issues"
  add_foreign_key "issue_links", "issues"
  add_foreign_key "issues", "issue_types"
  add_foreign_key "votes", "choices"
  add_foreign_key "votes", "voters"
end
