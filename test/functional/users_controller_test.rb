require 'test_helper'
require 'mocha'

class UsersControllerTest < ActionController::TestCase
  #fixtures :functional_users
  include Authlogic::TestCase
  setup :activate_authlogic
  
  def setup
    
    @rich = Factory(:rich)
    @amanda = Factory(:amanda)
    @morgan = Factory(:morgan)
    
    @dinner = Factory(:dinner)
    @dinner.eventDate = Time.now.advance(:days => -5)
    @dinner_yes = Factory(:yes_reply)
    @dinner_no = Factory(:no_reply)
    @dinner.user_id = @rich.id
    @dinner_yes.event_id = @dinner.id
    @dinner_no.event_id = @dinner.id
    @dinner_yes.user_id = @amanda.id
    @dinner_no.user_id = @morgan.id
    
    @wedding = Factory(:wedding)
    @wedding.eventDate = Time.now.advance(:days => 5)
    @wedding_yes = Factory(:yes_reply)
    @wedding_no = Factory(:no_reply)
    @wedding.user_id = @rich.id
    @wedding_yes.event_id = @wedding.id
    @wedding_no.event_id = @wedding.id
    @wedding_no.user_id = @amanda.id
    @wedding_yes.user_id = @morgan.id

    @rich.events << @dinner
    @rich.events << @wedding
    @amanda.replies << @dinner_yes
    @amanda.replies << @wedding_no
    @morgan.replies << @dinner_no
    @morgan.replies << @wedding_yes
    
  end
  
  def test_user_show
    @controller.stubs(:current_user).returns(@rich)
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
    @controller.stubs(:current_user).returns(@rich)
    get :edit, :id => @rich.id
    assert_response :success
  end

  test "should get new" do
    @controller.stubs(:current_user).returns(@rich)
    get :new
    assert_response 200
  end

  test "should create user_session" do
    @controller.stubs(:current_user).returns(@rich)
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
    @controller.stubs(:current_user).returns(@rich)
    get :show, :id => @rich.to_param
    assert_response :success
  end

  test "should get edit" do
    @controller.stubs(:current_user).returns(@rich)
    get :edit, :id => @rich.to_param
    assert_response :success
  end

  test "should update user_session" do
    @controller.stubs(:current_user).returns(@rich)
    put :update, :id => @rich.to_param, :user => { }
    assert_redirected_to user_path(@rich)
  end

  test "should destroy user_session" do
    @controller.stubs(:current_user).returns(@rich)
    assert_difference('User.count', -1) do
      delete :destroy, :id => @rich.to_param
    end
    assert_redirected_to logout_url
  end
  
  test "should show upcoming events" do
    @controller.stubs(:current_user).returns(@rich)
    get :show, :id => @rich.to_param
    assert_response :success
    events = assigns(:upcoming_events)
    assert_equal(1, events.count)
  end
  
  test "should show upcoming replies" do
    @controller.stubs(:current_user).returns(@amanda)
    get :show, :id => @amanda.to_param
    assert_response :success
    replies = assigns(:upcoming_replies)
    assert_equal(1, replies.count)
  end
  
end
