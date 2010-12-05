require 'test_helper'

class ParentUserSessionsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parent_user_sessions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parent_user_session" do
    assert_difference('ParentUserSession.count') do
      post :create, :parent_user_session => { }
    end

    assert_redirected_to parent_user_session_path(assigns(:parent_user_session))
  end

  test "should show parent_user_session" do
    get :show, :id => parent_user_sessions(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => parent_user_sessions(:one).to_param
    assert_response :success
  end

  test "should update parent_user_session" do
    put :update, :id => parent_user_sessions(:one).to_param, :parent_user_session => { }
    assert_redirected_to parent_user_session_path(assigns(:parent_user_session))
  end

  test "should destroy parent_user_session" do
    assert_difference('ParentUserSession.count', -1) do
      delete :destroy, :id => parent_user_sessions(:one).to_param
    end

    assert_redirected_to parent_user_sessions_path
  end
end
