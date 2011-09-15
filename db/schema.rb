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

ActiveRecord::Schema.define(:version => 20110914144755) do

  create_table "brand", :primary_key => "oid", :force => true do |t|
    t.string "name", :null => false
  end

  add_index "brand", ["name"], :name => "index_brand_on_name", :unique => true
  add_index "brand", ["oid"], :name => "index_brand_on_oid"

  create_table "clab", :primary_key => "oid", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",            :limit => 3, :null => false
    t.string   "label"
    t.integer  "brand_oid",                      :null => false
    t.integer  "application_oid",                :null => false
    t.string   "country_isocode2",  :limit => 2, :null => false
    t.string   "language_isocode2", :limit => 2, :null => false
    t.string   "basicurl"
    t.string   "applicationname"
  end

  add_index "clab", ["brand_oid", "application_oid", "country_isocode2", "language_isocode2"], :name => "index_clab_bacl", :unique => true
  add_index "clab", ["oid"], :name => "index_clab_on_oid"

  create_table "country", :id => false, :force => true do |t|
    t.string "isocode2",       :limit => 2,  :null => false
    t.string "isocode3",       :limit => 3
    t.string "name"
    t.string "englishname"
    t.string "phoneprefix"
    t.string "currency",       :limit => 25
    t.string "currencysymbol", :limit => 5
  end

  add_index "country", ["isocode2"], :name => "index_country_on_isocode2", :unique => true

  create_table "country_region", :id => false, :force => true do |t|
    t.integer "country_isocode2", :null => false
    t.integer "region_oid",       :null => false
  end

  add_index "country_region", ["country_isocode2", "region_oid"], :name => "index_country_region_on_country_isocode2_and_region_oid", :unique => true

  create_table "language", :id => false, :force => true do |t|
    t.string "isocode2",    :limit => 2, :null => false
    t.string "isocode3",    :limit => 3
    t.string "name"
    t.string "englishname"
  end

  add_index "language", ["isocode2"], :name => "index_language_on_isocode2", :unique => true

  create_table "region", :primary_key => "oid", :force => true do |t|
    t.integer "status",          :limit => 3, :null => false
    t.string  "label",                        :null => false
    t.integer "application_oid",              :null => false
  end

  add_index "region", ["oid"], :name => "index_region_on_oid"

  create_table "user", :primary_key => "oid", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                     :null => false
    t.string   "password",                     :null => false
    t.string   "email",                        :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "avatar_oid"
    t.integer  "group_oid"
    t.integer  "clab_oid"
    t.boolean  "active",     :default => true, :null => false
  end

  add_index "user", ["oid"], :name => "index_user_on_oid"
  add_index "user", ["username"], :name => "index_user_on_username", :unique => true

end
