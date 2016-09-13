require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, student: { NIC: @student.NIC, address: @student.address, default_discount: @student.default_discount, default_payment_type_eid: @student.default_payment_type_eid, name: @student.name, phone_number: @student.phone_number, province: @student.province, scholar_phone_number: @student.scholar_phone_number, surname: @student.surname, town: @student.town, zip_code: @student.zip_code }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, id: @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @student
    assert_response :success
  end

  test "should update student" do
    patch :update, id: @student, student: { NIC: @student.NIC, address: @student.address, default_discount: @student.default_discount, default_payment_type_eid: @student.default_payment_type_eid, name: @student.name, phone_number: @student.phone_number, province: @student.province, scholar_phone_number: @student.scholar_phone_number, surname: @student.surname, town: @student.town, zip_code: @student.zip_code }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, id: @student
    end

    assert_redirected_to students_path
  end
end
