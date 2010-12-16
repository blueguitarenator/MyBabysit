require 'test_helper'
require 'mocha'

class UsersControllerTest < ActionController::TestCase
  #fixtures :functional_users
  include Authlogic::TestCase
  setup :activate_authlogic
  
  def setup
    @controller  = UsersController.new
    @request     = ActionController::TestRequest.new
    @response    = ActionController::TestResponse.new
  end
  
  test "index should redirect to login when no session" do
    get :index
    assert_redirected_to(:controller => "sessions", :action => "create")
    assert_nil assigns(:users)
  end

  test "index should redirect to home when session" do
    evt = mock()
    evt.expects(:sitter_name).returns("foo")
    controller.stubs(:current_user).returns(Factory(:rich))
    get :index
    #assert_redirected_to(:controller => "users", :action => "show")
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response 302
  end

  test "should create user_session" do
    assert_difference('UserSession.count') do
      post :create, :user_session => { }
    end

    assert_redirected_to user_session_path(assigns(:user_session))
  end

  test "should show user_session" do
    get :show, :id => sessions(Factory(:rich)).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => sessions(:one).to_param
    assert_response :success
  end

  test "should update user_session" do
    put :update, :id => user_sessions(:one).to_param, :user_session => { }
    assert_redirected_to user_session_path(assigns(:user_session))
  end

  test "should destroy user_session" do
    assert_difference('UserSession.count', -1) do
      delete :destroy, :id => user_sessions(:one).to_param
    end

    assert_redirected_to user_sessions_path
  end
end
