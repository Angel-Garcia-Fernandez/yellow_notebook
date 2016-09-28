require 'test_helper'

class TimeWeekCyclesControllerTest < ActionController::TestCase
  setup do
    @time_week_cycle = time_week_cycles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_week_cycles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_week_cycle" do
    assert_difference('TimeWeekCycle.count') do
      post :create, time_week_cycle: { activity_ended_at: @time_week_cycle.activity_ended_at, activity_started_at: @time_week_cycle.activity_started_at, period_ended_at: @time_week_cycle.period_ended_at, period_started_at: @time_week_cycle.period_started_at }
    end

    assert_redirected_to time_week_cycle_path(assigns(:time_week_cycle))
  end

  test "should show time_week_cycle" do
    get :show, id: @time_week_cycle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @time_week_cycle
    assert_response :success
  end

  test "should update time_week_cycle" do
    patch :update, id: @time_week_cycle, time_week_cycle: { activity_ended_at: @time_week_cycle.activity_ended_at, activity_started_at: @time_week_cycle.activity_started_at, period_ended_at: @time_week_cycle.period_ended_at, period_started_at: @time_week_cycle.period_started_at }
    assert_redirected_to time_week_cycle_path(assigns(:time_week_cycle))
  end

  test "should destroy time_week_cycle" do
    assert_difference('TimeWeekCycle.count', -1) do
      delete :destroy, id: @time_week_cycle
    end

    assert_redirected_to time_week_cycles_path
  end
end
