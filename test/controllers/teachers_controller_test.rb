require 'test_helper'

class TeachersControllerTest < ActionController::TestCase


  setup do
    @user = users(:one)
    @teacher = teachers(:one)
    @teacher_new = { name: 'MyString3', surname: 'MyString3', default_attendance_management: false, default_collection_management: true, details: 'MyText' }
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:teachers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create teacher" do
    assert_difference('Teacher.count') do
      post :create, teacher: @teacher_new
    end

    assert_redirected_to teacher_path(assigns(:teacher))
    # puts assigns(:teacher)
    # assert_equal @teacher_new, assigns(:teacher)
  end

  test "should show teacher" do
    get :show, id: @teacher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @teacher
    assert_response :success
  end

  test "should update teacher" do
    patch :update, id: @teacher, teacher: { details: @teacher.details, default_attendance_management: @teacher.default_attendance_management, default_collection_management: @teacher.default_collection_management, name: @teacher.name, surname: @teacher.surname }
    assert_redirected_to teacher_path(assigns(:teacher))
  end

  test "should destroy teacher" do
    assert_difference('Teacher.count', -1) do
      delete :destroy, id: @teacher
    end

    assert_redirected_to teachers_path
  end
end
