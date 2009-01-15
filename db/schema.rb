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

ActiveRecord::Schema.define(:version => 20090115091604) do

  create_table "comments", :force => true do |t|
    t.text     "body"
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "concept_id"
  end

  create_table "concept_versions", :force => true do |t|
    t.integer  "concept_id"
    t.integer  "version"
    t.string   "title"
    t.text     "summary"
    t.boolean  "consulted_legal",                                      :default => false
    t.boolean  "consulted_marketing",                                  :default => false
    t.boolean  "design_needed",                                        :default => false
    t.string   "vertical"
    t.string   "status"
    t.date     "deadline"
    t.decimal  "budget",                 :precision => 6, :scale => 2
    t.datetime "updated_at"
    t.integer  "user_id"
    t.date     "approval_meeting"
    t.float    "est_days_dev"
    t.float    "est_days_design"
    t.float    "est_days_ia"
    t.float    "est_days_editorial"
    t.float    "est_days_pm"
    t.float    "est_days_legal"
    t.float    "est_cost_external"
    t.text     "objectives"
    t.date     "approval_meeting_date"
    t.boolean  "hosted_on_c4",                                         :default => true
    t.boolean  "subject_to_tx",                                        :default => false
    t.boolean  "using_video",                                          :default => false
    t.string   "budget_name"
    t.string   "traffic_estimate"
    t.string   "revenue_estimate"
    t.boolean  "moderation_requirement",                               :default => false
    t.string   "poc_tech"
    t.string   "poc_business"
  end

  add_index "concept_versions", ["concept_id"], :name => "index_concept_versions_on_concept_id"

  create_table "concepts", :force => true do |t|
    t.string   "title"
    t.text     "summary"
    t.boolean  "consulted_legal",        :default => false
    t.boolean  "consulted_marketing",    :default => false
    t.boolean  "design_needed",          :default => false
    t.string   "vertical"
    t.string   "status"
    t.date     "deadline",                                  :null => false
    t.decimal  "budget"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "version"
    t.date     "approval_meeting"
    t.boolean  "hosted_on_c4",           :default => true
    t.boolean  "subject_to_tx",          :default => false
    t.boolean  "using_video",            :default => false
    t.string   "budget_name"
    t.string   "traffic_estimate"
    t.string   "revenue_estimate"
    t.boolean  "moderation_requirement", :default => false
    t.string   "poc_tech"
    t.string   "poc_business"
    t.text     "objectives"
    t.float    "est_days_dev"
    t.float    "est_days_design"
    t.float    "est_days_ia"
    t.float    "est_days_editorial"
    t.float    "est_days_pm"
    t.float    "est_days_legal"
    t.float    "est_cost_external"
  end

  create_table "suggestions", :force => true do |t|
    t.text     "body"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "issue_type"
    t.integer  "user_id"
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
    t.boolean  "is_approver",                             :default => false
  end

end
