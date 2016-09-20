require 'test_helper'

class StudentActivitySignUpsControllerTest < ActionController::TestCase
  setup do
    @student_activity_sign_up = student_activity_sign_ups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_activity_sign_ups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_activity_sign_up" do
    assert_difference('StudentActivitySignUp.count') do
      post :create, student_activity_sign_up: { activity_discount: @student_activity_sign_up.activity_discount, ended_at: @student_activity_sign_up.ended_at, payment_type_eid: @student_activity_sign_up.payment_type_eid, started_at: @student_activity_sign_up.started_at }
    end

    assert_redirected_to student_activity_sign_up_path(assigns(:student_activity_sign_up))
  end

  test "should show student_activity_sign_up" do
    get :show, id: @student_activity_sign_up
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_activity_sign_up
    assert_response :success
  end

  test "should update student_activity_sign_up" do
    patch :update, id: @student_activity_sign_up, student_activity_sign_up: { activity_discount: @student_activity_sign_up.activity_discount, ended_at: @student_activity_sign_up.ended_at, payment_type_eid: @student_activity_sign_up.payment_type_eid, started_at: @student_activity_sign_up.started_at }
    assert_redirected_to student_activity_sign_up_path(assigns(:student_activity_sign_up))
  end

  test "should destroy student_activity_sign_up" do
    assert_difference('StudentActivitySignUp.count', -1) do
      delete :destroy, id: @student_activity_sign_up
    end

    assert_redirected_to student_activity_sign_ups_path
  end
end
