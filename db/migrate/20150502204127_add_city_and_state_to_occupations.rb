class AddCityAndStateToOccupations < ActiveRecord::Migration[4.2]
  def change
    add_column :occupations, :city, :string
    add_column :occupations, :state, :string
  end
end
