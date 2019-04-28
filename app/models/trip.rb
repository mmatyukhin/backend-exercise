class Trip < ApplicationRecord
  validates :start_city_name, :station_begin_name, :start_time, :end_city_name, :station_end_name, :end_time, :total_cost, :currency, presence: true
  validates :total_cost, numericality: { greater_than: 0 }
  paginates_per 10

  scope :had_frequency, -> { where.not(frequency: []).order(:start_time) }

  def self.search(params)
    result = all

    result = result.where('lower(start_city_name) = ?', params[:start_city_name].downcase)
    result = result.where('lower(end_city_name) = ?', params[:end_city_name].downcase)

    start_date = Date.parse(params[:start_date])
    start_time = (start_date.beginning_of_day)..(start_date.end_of_day)
    result = result.where(start_time: start_time)

    result
  end

  def self.search_without_date(params)
    result = all

    result = result.where(
     start_city_name: params[:start_city_name],
     end_city_name: params[:end_city_name]
    )
    result
  end
  def self.scheldure(params)
    result = all

    result = result.where(
     start_city_name: params[:start_city_name],
     end_city_name: params[:end_city_name]
    )
    .where.not(frequency: [])
    .select(
      'DISTINCT ON (start_time::time, carrier_name, frequency) start_time',
      :start_time,
      :frequency,
      :start_city_name,
      :end_city_name,
      :id, :carrier_name
    )
    .order('start_time::time')

    result
  end
end
