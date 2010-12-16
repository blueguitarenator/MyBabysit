require 'test_helper'

class UserSessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should create user session" do
    post :create, :user_session => { :login => "rich@msn.com", :password => "asdf" }
    assert user_session = UserSession.find(1)
    assert_equal Factory(:rich), user_session.user
    assert_redirected_to user_path
  end
  
  test "should destroy user session" do
    delete :destroy
    assert_nil UserSession.find
    assert_redirected_to login_url
  end
end
