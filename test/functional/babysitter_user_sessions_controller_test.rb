require 'test_helper'

class BabysitterUserSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:babysitter_user_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create babysitter_user_session" do
    assert_difference('BabysitterUserSession.count') do
      post :create, :babysitter_user_session => { }
    end

    assert_redirected_to babysitter_user_session_path(assigns(:babysitter_user_session))
  end

  test "should show babysitter_user_session" do
    get :show, :id => babysitter_user_sessions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => babysitter_user_sessions(:one).to_param
    assert_response :success
  end

  test "should update babysitter_user_session" do
    put :update, :id => babysitter_user_sessions(:one).to_param, :babysitter_user_session => { }
    assert_redirected_to babysitter_user_session_path(assigns(:babysitter_user_session))
  end

  test "should destroy babysitter_user_session" do
    assert_difference('BabysitterUserSession.count', -1) do
      delete :destroy, :id => babysitter_user_sessions(:one).to_param
    end

    assert_redirected_to babysitter_user_sessions_path
  end
end
