# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090109165807) do

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "concept_id"
  end

  create_table "concepts", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.boolean  "consulted_legal",                                   :default => false
    t.boolean  "consulted_marketing",                               :default => false
    t.boolean  "design_needed",                                     :default => false
    t.string   "vertical"
    t.string   "status"
    t.date     "deadline",                                                             :null => false
    t.decimal  "budget",              :precision => 6, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "suggestions", :force => true do |t|
    t.text     "body"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "issue_type"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.boolean  "is_admin",                                :default => false
    t.datetime "remember_token_expires_at"
    t.string   "role"
    t.string   "team"
  end

end
