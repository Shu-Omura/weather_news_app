class RenameCityIdColumnToCity < ActiveRecord::Migration[6.0]
  def change
    rename_column :cities, :city_id, :location_id
  end
end
