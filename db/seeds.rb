# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
trips_directory = Rails.root.join('lib', 'data', 'trips')

Dir.foreach(trips_directory) do |filename|
  next if File.directory?(filename)

  file_path = trips_directory.join(filename)
  trips_data = YAML.load_file(file_path)

  trips_data.each do |row|
    trip = Trip.new(
      start_city_name: row[:start_city_name],
      station_begin_name: row[:station_begin_name],
      end_city_name: row[:end_city_name],
      station_end_name: row[:station_end_name],
      carrier_name: row[:carrier_name],
      total_cost: row[:total_cost],
      currency: row[:currency]
    )

    start_date = Date.parse(row[:start_date])
    hour, min = row[:start_time].split(':')
    trip.start_time = start_date.to_time.change(hour: hour, min: min)

    end_date = Date.parse(row[:end_date])
    hour, min = row[:end_time].split(':')
    trip.end_time = end_date.to_time.change(hour: hour, min: min)

    trip.save!
  end
end
