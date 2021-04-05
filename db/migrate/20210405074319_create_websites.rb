class CreateWebsites < ActiveRecord::Migration[6.1]
  def change
    create_table :websites do |t|
      t.string :base_url, null: false
      t.string :title, null: false
      t.string :theme, null: false

      t.timestamps
    end
  end
end
