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

    @rich = Factory(:rich)
    @amanda = Factory(:amanda)
    @dinner = Factory(:dinner)
    @yes = Factory(:yes_reply)
    @no = Factory(:no_reply)

    @rich.events << @dinner
    @dinner.user_id = @rich.id

    @yes.event_id = @dinner.id
    @no.event_id = @dinner.id
    @yes.user_id = @amanda.id
    @no.user_id = @amanda.id

    @amanda.replies << @yes
    @amanda.replies << @no
    @controller.stubs(:current_user).returns(@rich)
  end
  
  def test_user_show
    invitation = Factory(:invitation)
    invitation.user_id = @rich.id
    Invitation.stubs(:find_by_email).returns(invitation)
    @rich.expects(:add_friend)
    @rich.friends << @amanda
    invitation.expects(:destroy)
    get :show, :id => @rich.id
    assert_response :success
  end
  
  def test_user_edit
    get :edit, :id => @rich.id
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response 200
  end

  test "should create user_session" do
    assert_difference('User.count') do
      post :create, :user => {:last_name => 'smith', 
                            :first_name => 'ron', 
                            :email => 'ron@msn.com', 
                            :password => 'asdf', 
                            :password_confirmation => 'asdf', 
                            :accttype => 'parent' }
    end
    assert_response 302
  end

  test "should show user_session" do
    get :show, :id => @rich.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @rich.to_param
    assert_response :success
  end

  test "should update user_session" do
    put :update, :id => @rich.to_param, :user => { }
    assert_redirected_to user_path(@rich)
  end

  test "should destroy user_session" do
    assert_difference('User.count', -1) do
      delete :destroy, :id => @rich.to_param
    end
    assert_redirected_to logout_url
  end
end
