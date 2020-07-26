class ChangeColumnTypeFromWeatherForecasts < ActiveRecord::Migration[6.0]
  def up
    change_column :weather_forecasts, :temp_max, :float
    change_column :weather_forecasts, :temp_min, :float
    change_column :weather_forecasts, :temp_feel, :float
    change_column :weather_forecasts, :rainfall, :float
  end

  def down
    change_column :weather_forecasts, :temp_max, :integer
    change_column :weather_forecasts, :temp_min, :integer
    change_column :weather_forecasts, :temp_feel, :integer
    change_column :weather_forecasts, :rainfall, :integer
  end
end
