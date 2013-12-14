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

ActiveRecord::Schema.define(:version => 20131214144516) do

  create_table "data_files", :force => true do |t|
    t.string   "DataFile"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "paymentcashes", :force => true do |t|
    t.date     "when"
    t.integer  "staff_id"
    t.float    "how_many"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "posts", :force => true do |t|
    t.text     "text"
    t.integer  "staff_id"
    t.integer  "task_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "workobject_id"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "image"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "staff_task_journals", :force => true do |t|
    t.integer  "staff_id"
    t.integer  "task_id"
    t.date     "sdate"
    t.date     "edate"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "staffobjectjournals", :force => true do |t|
    t.date     "edate"
    t.date     "sdate"
    t.integer  "staff_id"
    t.integer  "workobject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "status"
  end

  create_table "staffs", :force => true do |t|
    t.string   "fname"
    t.string   "mname"
    t.string   "lname"
    t.string   "position"
    t.date     "birthday"
    t.string   "passport"
    t.string   "skill"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "login"
    t.string   "password"
    t.string   "email"
    t.string   "phone1"
    t.string   "phone2"
  end

  create_table "task_delegates", :force => true do |t|
    t.integer  "task_id"
    t.integer  "staff_from"
    t.integer  "staff_to"
    t.datetime "when"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tasks", :force => true do |t|
    t.integer  "workobject_id"
    t.text     "description"
    t.date     "sdate"
    t.date     "edate"
    t.integer  "progress"
    t.string   "state"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "staff_id"
    t.integer  "staff_from_id"
    t.string   "priority"
  end

  create_table "uploads", :force => true do |t|
    t.string   "filename"
    t.integer  "size"
    t.integer  "workobject_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "state"
    t.integer  "staff"
    t.integer  "task_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,  :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_users_roles_on_user_id_and_role_id"

  create_table "workobjects", :force => true do |t|
    t.string   "name"
    t.string   "city"
    t.string   "latitude"
    t.string   "longtitude"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "region"
    t.integer  "staff_id"
    t.integer  "complete"
    t.string   "status"
  end

end
