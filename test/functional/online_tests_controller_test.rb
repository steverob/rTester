require 'test_helper'

class OnlineTestsControllerTest < ActionController::TestCase
  setup do
    @online_test = online_tests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:online_tests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create online_test" do
    assert_difference('OnlineTest.count') do
      post :create, online_test: {  }
    end

    assert_redirected_to online_test_path(assigns(:online_test))
  end

  test "should show online_test" do
    get :show, id: @online_test
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @online_test
    assert_response :success
  end

  test "should update online_test" do
    put :update, id: @online_test, online_test: {  }
    assert_redirected_to online_test_path(assigns(:online_test))
  end

  test "should destroy online_test" do
    assert_difference('OnlineTest.count', -1) do
      delete :destroy, id: @online_test
    end

    assert_redirected_to online_tests_path
  end
end
