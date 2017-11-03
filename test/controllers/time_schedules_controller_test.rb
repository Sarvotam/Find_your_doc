require 'test_helper'

class TimeSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @time_schedule = time_schedules(:one)
  end

  test "should get index" do
    get time_schedules_url
    assert_response :success
  end

  test "should get new" do
    get new_time_schedule_url
    assert_response :success
  end

  test "should create time_schedule" do
    assert_difference('TimeSchedule.count') do
      post time_schedules_url, params: { time_schedule: {  } }
    end

    assert_redirected_to time_schedule_url(TimeSchedule.last)
  end

  test "should show time_schedule" do
    get time_schedule_url(@time_schedule)
    assert_response :success
  end

  test "should get edit" do
    get edit_time_schedule_url(@time_schedule)
    assert_response :success
  end

  test "should update time_schedule" do
    patch time_schedule_url(@time_schedule), params: { time_schedule: {  } }
    assert_redirected_to time_schedule_url(@time_schedule)
  end

  test "should destroy time_schedule" do
    assert_difference('TimeSchedule.count', -1) do
      delete time_schedule_url(@time_schedule)
    end

    assert_redirected_to time_schedules_url
  end
end
