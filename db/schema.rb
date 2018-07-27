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

ActiveRecord::Schema.define(version: 2018_07_27_193021) do

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "title"
    t.integer "user_id"
    t.boolean "is_public", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.integer "answer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quiz_id"
  end

  create_table "quiz_sessions", force: :cascade do |t|
    t.string "player"
    t.integer "score"
    t.integer "quiz_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quizzes", force: :cascade do |t|
    t.string "title"
    t.integer "duration"
    t.boolean "is_public", default: false
    t.integer "sessions", default: 0
    t.string "integer"
    t.boolean "is_completed", default: false
    t.string "identifier"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "collection_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
