class AddCityAndStateToOccupations < ActiveRecord::Migration
  def change
    add_column :occupations, :city, :string
    add_column :occupations, :state, :string
  end
end
