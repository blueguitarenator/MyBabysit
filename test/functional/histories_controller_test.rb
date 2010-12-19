require 'test_helper'

class HistoriesControllerTest < ActionController::TestCase
  def setup
    @controller  = HistoriesController.new
    @request     = ActionController::TestRequest.new
    @response    = ActionController::TestResponse.new

    @rich = Factory(:rich)
    @amanda = Factory(:amanda)
    @dinner = Factory(:dinner)
    @wedding = Factory(:wedding)
    @yes = Factory(:yes_reply)
    @no = Factory(:no_reply)

    @dinner.user_id = @rich.id

    @yes.event_id = @dinner.id
    @no.event_id = @dinner.id
    @yes.user_id = @amanda.id
    @no.user_id = @amanda.id

    @amanda.replies << @yes
    @amanda.replies << @no
    @controller.stubs(:current_user).returns(@rich)
  end
  
  test "should show historic events" do
    get :index
    assert_response :success
  end
  
  test "should show historic replies" do
    get :index
    assert_response :success
  end
  
end
