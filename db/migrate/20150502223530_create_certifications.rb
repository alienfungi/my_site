class CreateCertifications < ActiveRecord::Migration[4.2]
  def change
    create_table :certifications do |t|
      t.date :date_acquired, null: false
      t.string :name, null: false
      t.string :organization, null: false
      t.string :score
    end
  end
end
