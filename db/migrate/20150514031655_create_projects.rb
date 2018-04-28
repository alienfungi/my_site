class CreateProjects < ActiveRecord::Migration[4.2]
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
