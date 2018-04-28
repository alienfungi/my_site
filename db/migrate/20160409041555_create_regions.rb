class CreateRegions < ActiveRecord::Migration[4.2]
  def change
    create_table :regions do |t|
      t.text :content, null: false
      t.string :controller, null: false
      t.string :action, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
