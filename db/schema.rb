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

ActiveRecord::Schema.define(version: 20_210_405_075_112) do
  create_table 'blog_posts', charset: 'utf8', force: :cascade do |t|
    t.string 'title', null: false
    t.string 'path', null: false
    t.text 'content'
    t.boolean 'draft', default: false, null: false
    t.bigint 'website_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index %w[path website_id], name: 'index_blog_posts_on_path_and_website_id', unique: true
    t.index ['website_id'], name: 'index_blog_posts_on_website_id'
  end

  create_table 'websites', charset: 'utf8', force: :cascade do |t|
    t.string 'base_url', null: false
    t.string 'title', null: false
    t.string 'theme', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  add_foreign_key 'blog_posts', 'websites'
end
