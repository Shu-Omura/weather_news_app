class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.references :city, null: false, foreign_key: true
      t.float :temp_max
      t.float :temp_min
      t.string :weather_d
      t.string :weather_n
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
