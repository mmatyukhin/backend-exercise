module TripsHelper
DAYS_OF_THE_WEEK = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']

def days(trip)
  if trip.days_of_the_week.size == 7
    return 'Daily'
  else
    trip.days_of_the_week.map { |day| DAYS_OF_THE_WEEK[day] }.join(' ')
  end
end
end
