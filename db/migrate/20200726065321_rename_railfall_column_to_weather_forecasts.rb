class RenameRailfallColumnToWeatherForecasts < ActiveRecord::Migration[6.0]
  def change
    rename_column :weather_forecasts, :railfall, :rainfall
  end
end
