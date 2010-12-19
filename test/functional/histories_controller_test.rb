require 'test_helper'

class HistoriesControllerTest < ActionController::TestCase
  def setup
    @controller  = HistoriesController.new
    @request     = ActionController::TestRequest.new
    @response    = ActionController::TestResponse.new

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
  
  test "should show historic events" do
    @controller.stubs(:current_user).returns(@rich)
    get :index
    assert_response :success
    events = assigns(:historic_events)
    assert_equal(1, events.count)
  end
  
  test "should show historic replies" do
    @controller.stubs(:current_user).returns(@amanda)
    get :index
    assert_response :success
    replies = assigns(:historic_replies)
    assert_equal(1, replies.count)
  end
  
end
