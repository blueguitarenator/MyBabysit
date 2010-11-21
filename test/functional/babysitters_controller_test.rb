require 'test_helper'

class BabysittersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:babysitters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create babysitter" do
    assert_difference('Babysitter.count') do
      post :create, :babysitter => { }
    end

    assert_redirected_to babysitter_path(assigns(:babysitter))
  end

  test "should show babysitter" do
    get :show, :id => babysitters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => babysitters(:one).to_param
    assert_response :success
  end

  test "should update babysitter" do
    put :update, :id => babysitters(:one).to_param, :babysitter => { }
    assert_redirected_to babysitter_path(assigns(:babysitter))
  end

  test "should destroy babysitter" do
    assert_difference('Babysitter.count', -1) do
      delete :destroy, :id => babysitters(:one).to_param
    end

    assert_redirected_to babysitters_path
  end
end
