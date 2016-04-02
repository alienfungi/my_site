class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :summary, null: false
      t.text :body, null: false
      t.boolean :private, null: false, default: false

      t.timestamps
    end
  end
end
