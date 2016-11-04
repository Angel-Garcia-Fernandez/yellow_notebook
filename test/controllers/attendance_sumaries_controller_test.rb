require 'test_helper'

class AttendanceSumariesControllerTest < ActionController::TestCase
  setup do
    @attendance_sumary = attendance_sumaries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_sumaries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_sumary" do
    assert_difference('AttendanceSumary.count') do
      post :create, attendance_sumary: {  }
    end

    assert_redirected_to attendance_sumary_path(assigns(:attendance_sumary))
  end

  test "should show attendance_sumary" do
    get :show, id: @attendance_sumary
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance_sumary
    assert_response :success
  end

  test "should update attendance_sumary" do
    patch :update, id: @attendance_sumary, attendance_sumary: {  }
    assert_redirected_to attendance_sumary_path(assigns(:attendance_sumary))
  end

  test "should destroy attendance_sumary" do
    assert_difference('AttendanceSumary.count', -1) do
      delete :destroy, id: @attendance_sumary
    end

    assert_redirected_to attendance_sumaries_path
  end
end
