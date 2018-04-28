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

ActiveRecord::Schema.define(version: 20180428153403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "certifications", force: :cascade do |t|
    t.date   "date_acquired", null: false
    t.string "name",          null: false
    t.string "organization",  null: false
    t.string "score"
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school",         null: false
    t.string   "city"
    t.string   "state"
    t.string   "field_of_study"
    t.string   "degree"
    t.date     "start_date",     null: false
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "occupations", force: :cascade do |t|
    t.string   "company",                          null: false
    t.string   "company_url"
    t.text     "company_description"
    t.string   "title",                            null: false
    t.date     "start_date",                       null: false
    t.date     "end_date"
    t.text     "details",             default: [],              array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
  end

  create_table "posts", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "slug",                         null: false
    t.text     "summary",                      null: false
    t.text     "body",                         null: false
    t.boolean  "confidential", default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image"
    t.string   "link"
    t.string   "source_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: :cascade do |t|
    t.text     "content",    null: false
    t.string   "controller", null: false
    t.string   "action",     null: false
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name",                    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                    null: false
    t.hstore   "metadata",   default: {}, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "remember_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

end
