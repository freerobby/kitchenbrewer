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

ActiveRecord::Schema.define(:version => 20100214195313) do

  create_table "brewnotes", :force => true do |t|
    t.integer  "brew_id"
    t.text     "body"
    t.datetime "recorded_at"
    t.decimal  "gravity",     :precision => 4, :scale => 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brews", :force => true do |t|
    t.integer  "user_id"
    t.string   "recipe_title"
    t.decimal  "intended_original_gravity", :precision => 4, :scale => 3
    t.decimal  "intended_final_gravity",    :precision => 4, :scale => 3
    t.decimal  "actual_original_gravity",   :precision => 4, :scale => 3
    t.decimal  "actual_final_gravity",      :precision => 4, :scale => 3
    t.datetime "began_at"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",         :default => 0,     :null => false
    t.integer  "failed_login_count",  :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "nickname"
    t.boolean  "email_confirmed",     :default => false
  end

end
