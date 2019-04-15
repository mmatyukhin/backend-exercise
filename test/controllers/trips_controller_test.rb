require 'test_helper'

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip = trips(:trip)
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference('Trip.count') do
      post trips_url, params: { trip: { carrier_name: @trip.carrier_name, currency: @trip.currency, end_city_name: @trip.end_city_name, end_time: @trip.end_time, start_city_name: @trip.start_city_name, start_time: @trip.start_time, station_begin_name: @trip.station_begin_name, station_end_name: @trip.station_end_name, total_cost: @trip.total_cost } }
    end

    assert_redirected_to trip_url(Trip.last)
  end

  test "should show trip" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { carrier_name: @trip.carrier_name, currency: @trip.currency, end_city_name: @trip.end_city_name, end_time: @trip.end_time, start_city_name: @trip.start_city_name, start_time: @trip.start_time, station_begin_name: @trip.station_begin_name, station_end_name: @trip.station_end_name, total_cost: @trip.total_cost } }
    assert_redirected_to trip_url(@trip)
  end

  test "should destroy trip" do
    assert_difference('Trip.count', -1) do
      delete trip_url(@trip)
    end

    assert_redirected_to trips_url
  end
end
