require 'test_helper'

class AttendanceSummariesControllerTest < ActionController::TestCase
  setup do
    #@attendance_summary = attendance_summaries(:one)
  end

  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:attendance_summaries)
  # end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_summary" do
    assert_difference('AttendanceSummary.count') do
      post :create, attendance_summary: {  }
    end

    assert_redirected_to attendance_summary_path(assigns(:attendance_summary))
  end
  #
  # test "should show attendance_summary" do
  #   get :show, id: @attendance_summary
  #   assert_response :success
  # end
  #
  # test "should get edit" do
  #   get :edit, id: @attendance_summary
  #   assert_response :success
  # end
  #
  # test "should update attendance_summary" do
  #   patch :update, id: @attendance_summary, attendance_summary: {  }
  #   assert_redirected_to attendance_summary_path(assigns(:attendance_summary))
  # end
  #
  # test "should destroy attendance_summary" do
  #   assert_difference('AttendanceSummary.count', -1) do
  #     delete :destroy, id: @attendance_summary
  #   end
  #
  #   assert_redirected_to attendance_summaries_path
  # end
end
