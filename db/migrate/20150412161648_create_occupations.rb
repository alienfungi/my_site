class CreateOccupations < ActiveRecord::Migration[4.2]
  def change
    create_table :occupations do |t|
      t.string :company, null: false
      t.string :company_url
      t.text :company_description
      t.string :title, null: false
      t.date :start_date, null: false
      t.date :end_date
      t.text :details, array: true, default: []

      t.timestamps
    end
  end
end
