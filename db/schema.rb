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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150728000427) do

  create_table "cookbooks", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "description"
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "cookbooks_recipes", id: false, force: :cascade do |t|
    t.integer "cookbook_id", null: false
    t.integer "recipe_id",   null: false
  end

  add_index "cookbooks_recipes", ["cookbook_id", "recipe_id"], name: "index_cookbooks_recipes_on_cookbook_id_and_recipe_id"
  add_index "cookbooks_recipes", ["recipe_id", "cookbook_id"], name: "index_cookbooks_recipes_on_recipe_id_and_cookbook_id"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "avatar"
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id",     null: false
    t.integer "ingredient_id", null: false
  end

  add_index "ingredients_recipes", ["ingredient_id", "recipe_id"], name: "index_ingredients_recipes_on_ingredient_id_and_recipe_id"
  add_index "ingredients_recipes", ["recipe_id", "ingredient_id"], name: "index_ingredients_recipes_on_recipe_id_and_ingredient_id"

  create_table "recipes", force: :cascade do |t|
    t.string   "name",        null: false
    t.text     "steps",       null: false
    t.string   "description"
    t.string   "avatar"
    t.integer  "user_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
