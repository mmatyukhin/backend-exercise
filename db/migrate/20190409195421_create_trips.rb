class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :start_city_name, null: false
      t.string :station_begin_name, null: false
      t.datetime :start_time, null: false
      t.string :end_city_name, null: false
      t.string :station_end_name, null: false
      t.datetime :end_time, null: false
      t.string :carrier_name, null: true
      t.decimal :total_cost, precision: 8, scale: 2, null: false
      t.string :currency, null: false

      t.timestamps
    end
  end
end
