require 'test_helper'

class StudentClassDataControllerTest < ActionController::TestCase
  setup do
    @student_class_datum = student_class_data(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:student_class_data)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student_class_datum" do
    assert_difference('StudentClassDatum.count') do
      post :create, student_class_datum: { attended: @student_class_datum.attended, paid: @student_class_datum.paid }
    end

    assert_redirected_to student_class_datum_path(assigns(:student_class_datum))
  end

  test "should show student_class_datum" do
    get :show, id: @student_class_datum
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student_class_datum
    assert_response :success
  end

  test "should update student_class_datum" do
    patch :update, id: @student_class_datum, student_class_datum: { attended: @student_class_datum.attended, paid: @student_class_datum.paid }
    assert_redirected_to student_class_datum_path(assigns(:student_class_datum))
  end

  test "should destroy student_class_datum" do
    assert_difference('StudentClassDatum.count', -1) do
      delete :destroy, id: @student_class_datum
    end

    assert_redirected_to student_class_data_path
  end
end
