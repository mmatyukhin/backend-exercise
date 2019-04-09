require 'test_helper'

class TripTest < ActiveSupport::TestCase
  setup do
    @trip = trips(:trip)
  end

  test 'valid' do
    assert @trip.valid?
  end

  test 'total_cost is positive' do
    @trip.total_cost = -1
    refute @trip.valid?
  end
end
