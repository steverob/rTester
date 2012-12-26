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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121226140741) do

  create_table "answers", :force => true do |t|
    t.integer  "question_id"
    t.text     "answer"
    t.boolean  "is_correct"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "candidate_answers", :force => true do |t|
    t.integer  "test_question_id"
    t.integer  "answer_id"
    t.integer  "candidate_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "candidates", :force => true do |t|
    t.string   "name"
    t.string   "college"
    t.string   "roll_no"
    t.string   "department"
    t.integer  "year"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "online_tests", :force => true do |t|
    t.string   "name"
    t.integer  "timing"
    t.integer  "no_of_questions"
    t.boolean  "negative_marking"
    t.string   "tag_list"
    t.string   "created_by"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.boolean  "open"
    t.float    "correct_score"
    t.float    "wrong_score"
    t.boolean  "show_score"
  end

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "results", :force => true do |t|
    t.integer  "online_test_id"
    t.integer  "candidate_id"
    t.integer  "no_correct"
    t.integer  "no_incorrect"
    t.integer  "no_unanswered"
    t.float    "score"
    t.integer  "rank"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.datetime "starttime"
    t.boolean  "completed"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       :limit => 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "test_questions", :force => true do |t|
    t.integer  "online_test_id"
    t.integer  "question_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
