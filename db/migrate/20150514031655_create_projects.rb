class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :link
      t.string :source_link

      t.timestamps
    end
  end
end
