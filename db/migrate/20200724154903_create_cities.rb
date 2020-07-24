class CreateCities < ActiveRecord::Migration[6.0]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :romaji, null: false
      t.integer :city_id, null: false
      t.references :prefecture, null: false, foreign_key: true

      t.timestamps
    end
  end
end
