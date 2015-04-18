class CreateEducation < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :school, null: false
      t.string :city
      t.string :state
      t.string :field_of_study
      t.string :degree
      t.date :start_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
