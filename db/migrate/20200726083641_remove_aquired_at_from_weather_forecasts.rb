class RemoveAquiredAtFromWeatherForecasts < ActiveRecord::Migration[6.0]
  def change
    remove_column :weather_forecasts, :aquired_at, :datetime
  end
end
