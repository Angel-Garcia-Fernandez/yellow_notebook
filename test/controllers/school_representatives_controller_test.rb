require 'test_helper'

class SchoolRepresentativesControllerTest < ActionController::TestCase
  setup do
    @school_representative = school_representatives(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:school_representatives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create school_representative" do
    assert_difference('SchoolRepresentative.count') do
      post :create, school_representative: { details: @school_representative.details, name: @school_representative.name, position: @school_representative.position }
    end

    assert_redirected_to school_representative_path(assigns(:school_representative))
  end

  test "should show school_representative" do
    get :show, id: @school_representative
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @school_representative
    assert_response :success
  end

  test "should update school_representative" do
    patch :update, id: @school_representative, school_representative: { details: @school_representative.details, name: @school_representative.name, position: @school_representative.position }
    assert_redirected_to school_representative_path(assigns(:school_representative))
  end

  test "should destroy school_representative" do
    assert_difference('SchoolRepresentative.count', -1) do
      delete :destroy, id: @school_representative
    end

    assert_redirected_to school_representatives_path
  end
end
