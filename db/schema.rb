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

ActiveRecord::Schema.define(:version => 20100221220743) do

  create_table "brew_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "title"
    t.integer  "default_unit_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "recipe_ingredients", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "ingredient_id"
    t.integer  "unit_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipes", :force => true do |t|
    t.integer  "tweak_of_id"
    t.string   "title"
    t.decimal  "original_gravity",  :precision => 4, :scale => 3
    t.decimal  "final_gravity",     :precision => 4, :scale => 3
    t.integer  "volume_in_gallons"
    t.integer  "style_id"
    t.integer  "ibus"
    t.decimal  "abv",               :precision => 4, :scale => 3
    t.integer  "srm"
    t.text     "instructions"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "brew_type_id"
  end

  create_table "styles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "units", :force => true do |t|
    t.string   "title"
    t.string   "abbreviation"
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
