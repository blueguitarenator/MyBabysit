require 'test_helper'

class RepliesControllerTest < ActionController::TestCase
  def setup
    @controller  = RepliesController.new
    @request     = ActionController::TestRequest.new
    @response    = ActionController::TestResponse.new

    @rich = Factory(:rich)
    @amanda = Factory(:amanda)
    @dinner = Factory(:dinner)
    @yes = Factory(:yes_reply)
    @no = Factory(:no_reply)

    @dinner.user_id = @rich.id

    @yes.event_id = @dinner.id
    @no.event_id = @dinner.id
    @yes.user_id = @amanda.id
    @no.user_id = @amanda.id

    @amanda.replies << @yes
    @amanda.replies << @no
    @controller.stubs(:current_user).returns(@amanda)
  end
  
  test "should show reply" do
    get :show, :id => @yes.to_param
    assert_response :success
    reply = assigns(:reply)
    user = assigns(:user)
    assert_equal @yes, reply
    assert_equal @amanda, user
  end

  test "should get edit" do
    get :edit, :id => @no.to_param
    assert_response :success
  end

  test "should update reply" do
    BabysitMailer.expects(:deliver_reply)
    put :update, :id => @yes.to_param, :reply => { :answer => 'no' }
    assert_redirected_to user_path(@amanda)
  end
end
