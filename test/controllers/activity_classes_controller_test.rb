require 'test_helper'

class ActivityClassesControllerTest < ActionController::TestCase
  setup do
    @activity_class = activity_classes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:activity_classes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create activity_class" do
    assert_difference('ActivityClass.count') do
      post :create, activity_class: { ended_at: @activity_class.ended_at, started_at: @activity_class.started_at }
    end

    assert_redirected_to activity_class_path(assigns(:activity_class))
  end

  test "should show activity_class" do
    get :show, id: @activity_class
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @activity_class
    assert_response :success
  end

  test "should update activity_class" do
    patch :update, id: @activity_class, activity_class: { ended_at: @activity_class.ended_at, started_at: @activity_class.started_at }
    assert_redirected_to activity_class_path(assigns(:activity_class))
  end

  test "should destroy activity_class" do
    assert_difference('ActivityClass.count', -1) do
      delete :destroy, id: @activity_class
    end

    assert_redirected_to activity_classes_path
  end
end
