require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  def setup
    @controller  = InvitationsController.new
    @request     = ActionController::TestRequest.new
    @response    = ActionController::TestResponse.new

    @rich = Factory(:rich)
    inv = Factory(:invitation)
    @rich.invitations << inv
    @controller.stubs(:current_user).returns(@rich)
  end

  test "should show users pending invitations" do
    get :index
    assert_response :success
    invitations = assigns(:invitations)
    assert_equal 1, invitations.count
  end
  
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invitation" do
    BabysitMailer.expects(:deliver_invite)
    assert_difference('Invitation.count') do
      post :create, :invitation => { :email => 'one@two.com' }
    end
    inv = assigns(:invitation)
    assert_equal("one@two.com", inv.email)
    assert_equal(@rich.id, inv.user_id)
    assert_redirected_to invitation_path(assigns(:invitation))
  end

  test "should show invitation" do
    get :show, :id => Factory(:invitation).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => Factory(:invitation).to_param
    assert_response :success
  end

  test "should destroy invitation" do
    inv = Factory(:invitation)
    inv.user_id = @rich.id
    assert_difference('Invitation.count', -1) do
      delete :destroy, :id => inv.to_param
    end

    assert_redirected_to user_path(@rich)
  end
end
