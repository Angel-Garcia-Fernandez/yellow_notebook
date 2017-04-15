require 'test_helper'

class XlsFilesControllerTest < ActionController::TestCase
  setup do
    @xls_file = xls_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xls_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xls_file" do
    assert_difference('XlsFile.count') do
      post :create, xls_file: {  }
    end

    assert_redirected_to xls_file_path(assigns(:xls_file))
  end

  test "should show xls_file" do
    get :show, id: @xls_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @xls_file
    assert_response :success
  end

  test "should update xls_file" do
    patch :update, id: @xls_file, xls_file: {  }
    assert_redirected_to xls_file_path(assigns(:xls_file))
  end

  test "should destroy xls_file" do
    assert_difference('XlsFile.count', -1) do
      delete :destroy, id: @xls_file
    end

    assert_redirected_to xls_files_path
  end
end
