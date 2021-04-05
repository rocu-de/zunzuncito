class CreateBlogPosts < ActiveRecord::Migration[6.1]
  def change
    create_table :blog_posts do |t|
      t.string :title, null: false
      t.string :path, null: false
      t.text :content
      t.boolean :draft, default: false, null: false
      t.references :website, null: false, foreign_key: true

      t.timestamps
    end
    add_index :blog_posts, %i[path website_id], unique: true
  end
end
