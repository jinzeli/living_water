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

ActiveRecord::Schema.define(:version => 20120904190520) do

  create_table "coworkers", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
    t.boolean  "core_coworker"
  end

  add_index "coworkers", ["email"], :name => "index_coworkers_on_email", :unique => true
  add_index "coworkers", ["remember_token"], :name => "index_coworkers_on_remember_token"

  create_table "ministries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "core_coworker"
  end

  create_table "my_ministries", :force => true do |t|
    t.integer  "coworker_id"
    t.integer  "ministry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
