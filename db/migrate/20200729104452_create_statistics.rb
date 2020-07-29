class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.references :cities, null: false, foreign_key: true
      t.integer :temp_max
      t.integer :temp_min
      t.string :weather_d
      t.string :weather_n
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
