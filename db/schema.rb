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

ActiveRecord::Schema.define(:version => 20120904070330) do

  create_table "blog_posts", :force => true do |t|
    t.string   "title",          :limit => 100
    t.text     "content"
    t.integer  "auther_id",                     :default => 0
    t.string   "status",         :limit => 20
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "comments_count",                :default => 0
  end

  add_index "blog_posts", ["auther_id"], :name => "index_blog_posts_on_auther_id"

  create_table "categories", :force => true do |t|
    t.string   "name",        :limit => 50
    t.string   "short_name",  :limit => 30
    t.string   "description"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "categories_posts", :force => true do |t|
    t.integer "category_id"
    t.integer "post_id"
  end

  add_index "categories_posts", ["category_id"], :name => "index_categoies_posts_on_category_id"
  add_index "categories_posts", ["post_id"], :name => "index_categoies_posts_on_post_id"

  create_table "categorizations", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "post_id",                    :default => 0
    t.string   "auther",       :limit => 25
    t.string   "auther_email", :limit => 50
    t.text     "Content"
    t.string   "status",       :limit => 25
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :limit => 25
    t.string   "hashed_password", :limit => 40
    t.string   "fname",           :limit => 25
    t.string   "lname",           :limit => 40
    t.string   "email",           :limit => 50
    t.string   "display_name",    :limit => 25
    t.integer  "user_level",      :limit => 3,  :default => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "salt",            :limit => 40
  end

end
