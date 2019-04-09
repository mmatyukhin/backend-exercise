class Trip < ApplicationRecord
  validates :start_city_name, :station_begin_name, :start_time, :end_city_name, :station_end_name, :end_time, :total_cost, :currency, presence: true
  validates :total_cost, numericality: { greater_than: 0 }
end
