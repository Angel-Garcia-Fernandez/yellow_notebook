require 'test_helper'

class TeacherActivitiesControllerTest < ActionController::TestCase
  setup do
    @teacher_activity = teacher_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teacher_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher_activity" do
    assert_difference('TeacherActivity.count') do
      post :create, teacher_activity: { attendance_management: @teacher_activity.attendance_management, collection_management: @teacher_activity.collection_management }
    end

    assert_redirected_to teacher_activity_path(assigns(:teacher_activity))
  end

  test "should show teacher_activity" do
    get :show, id: @teacher_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher_activity
    assert_response :success
  end

  test "should update teacher_activity" do
    patch :update, id: @teacher_activity, teacher_activity: { attendance_management: @teacher_activity.attendance_management, collection_management: @teacher_activity.collection_management }
    assert_redirected_to teacher_activity_path(assigns(:teacher_activity))
  end

  test "should destroy teacher_activity" do
    assert_difference('TeacherActivity.count', -1) do
      delete :destroy, id: @teacher_activity
    end

    assert_redirected_to teacher_activities_path
  end
end
