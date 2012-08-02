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

ActiveRecord::Schema.define(:version => 20120802002109) do

  create_table "access_assignments", :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "access_assignments", ["role_id"], :name => "index_access_assignments_on_role_id"
  add_index "access_assignments", ["user_id"], :name => "index_access_assignments_on_user_id"

  create_table "access_operations", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  add_index "access_operations", ["name"], :name => "index_access_operations_on_name"

  create_table "access_permissions", :force => true do |t|
    t.integer "role_id"
    t.integer "operation_id"
  end

  add_index "access_permissions", ["operation_id"], :name => "index_access_permissions_on_operation_id"
  add_index "access_permissions", ["role_id"], :name => "index_access_permissions_on_role_id"

  create_table "access_roles", :force => true do |t|
    t.string "name"
    t.string "description"
  end

  add_index "access_roles", ["name"], :name => "index_access_roles_on_name"

end
