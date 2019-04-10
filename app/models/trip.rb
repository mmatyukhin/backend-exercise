class Trip < ApplicationRecord
  validates :start_city_name, :station_begin_name, :start_time, :end_city_name, :station_end_name, :end_time, :total_cost, :currency, presence: true
  validates :total_cost, numericality: { greater_than: 0 }
  paginates_per 10
  def self.search(params)
    result = all

    result = result.where('lower(start_city_name) = ?', params[:start_city_name].downcase)
    result = result.where('lower(end_city_name) = ?', params[:end_city_name].downcase)

    start_date = Date.parse(params[:start_date])
    start_time = (start_date.beginning_of_day)..(start_date.end_of_day)
    result = result.where(start_time: start_time)

    result
  end

  def days_of_the_week
      trips = Trip
        .where(
          start_city_name: start_city_name,
          station_begin_name: station_begin_name,
          end_city_name: end_city_name,
          station_end_name: station_end_name,
          carrier_name: carrier_name
        )
        .where('start_time::time = ?::time', start_time)

      days = trips.pluck(:start_time).map(&:wday).sort
      hashofdays = days.each_with_object(Hash.new(0)) { |day,counts| counts[day] += 1 }

      result = []
      hashofdays.each do |hash|
        if hash[1] > 2
          result << hash[0]
        end
      end
      result
  end
end
