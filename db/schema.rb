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

ActiveRecord::Schema.define(version: 20170522170238) do

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.index ["review_id"], name: "index_comments_on_review_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.date     "release_date"
    t.string   "genre"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "image_url"
    t.integer  "rating"
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "reviewer"
    t.text     "body"
    t.integer  "movie_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.index ["movie_id"], name: "index_reviews_on_movie_id"
  end

end
