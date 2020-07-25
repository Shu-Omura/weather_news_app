class CreateWeatherForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_forecasts do |t|
      t.integer :temp_max, null: false
      t.integer :temp_min, null: false
      t.integer :temp_feel
      t.integer :weather_id, null: false
      t.integer :railfall
      t.datetime :date, null: false
      t.datetime :aquired_at, null: false
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
