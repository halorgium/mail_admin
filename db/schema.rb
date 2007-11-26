# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 6) do

  create_table "accounts", :force => true do |t|
    t.integer  "domain_id"
    t.string   "name"
    t.string   "crypted_password"
    t.string   "salt"
    t.integer  "optional_uid"
    t.integer  "optional_gid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["domain_id", "name"], :name => "index_accounts_on_name_and_domain_id", :unique => true

  create_table "domains", :force => true do |t|
    t.string   "name"
    t.integer  "uid"
    t.integer  "gid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "domains", ["name"], :name => "index_domains_on_name", :unique => true

  create_table "forwardings", :force => true do |t|
    t.integer  "source_domain_id"
    t.string   "source_name"
    t.integer  "destination_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "forwardings", ["source_domain_id", "source_name"], :name => "index_forwardings_on_source_domain_id_and_source_name", :unique => true

  create_table "transports", :force => true do |t|
    t.integer  "domain_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transports", ["name"], :name => "index_transports_on_name", :unique => true

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

end
