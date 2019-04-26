class Trip < ApplicationRecord
  validates :start_city_name, :station_begin_name, :start_time, :end_city_name, :station_end_name, :end_time, :total_cost, :currency, presence: true
  validates :total_cost, numericality: { greater_than: 0 }
  paginates_per 20

  scope :had_frequency, -> { where("frequency is not null").order(:start_time) }

  def self.search(params)
    result = all

    result = result.where('lower(start_city_name) = ?', params[:start_city_name].downcase)
    result = result.where('lower(end_city_name) = ?', params[:end_city_name].downcase)

    start_date = Date.parse(params[:start_date])
    start_time = (start_date.beginning_of_day)..(start_date.end_of_day)
    result = result.where(start_time: start_time)

    result
  end
end
