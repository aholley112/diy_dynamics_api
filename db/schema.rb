# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_27_183206) do
  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_projects", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "project_id", null: false
    t.index ["category_id", "project_id"], name: "index_categories_projects_on_category_id_and_project_id"
  end

  create_table "materials", force: :cascade do |t|
    t.text "material_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "materials_projects", id: false, force: :cascade do |t|
    t.integer "material_id", null: false
    t.integer "project_id", null: false
    t.index ["material_id", "project_id"], name: "index_materials_projects_on_material_id_and_project_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id", null: false
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "project_materials", force: :cascade do |t|
    t.integer "quantity_needed"
    t.integer "price"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_materials_on_project_id"
  end

  create_table "project_tools", force: :cascade do |t|
    t.integer "quantity_needed"
    t.integer "price"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tools_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "is_favorite_project", default: false
    t.text "instructions"
    t.string "est_time_to_completion"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "projects_tools", id: false, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "tool_id", null: false
    t.index ["project_id", "tool_id"], name: "index_projects_tools_on_project_id_and_tool_id"
  end

  create_table "tools", force: :cascade do |t|
    t.text "tool_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "profiles", "users"
  add_foreign_key "project_materials", "projects"
  add_foreign_key "project_tools", "projects"
  add_foreign_key "projects", "users"
end
