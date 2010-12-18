require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @controller  = EventsController.new
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
    @controller.stubs(:current_user).returns(@rich)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, :event => { :name => 'ho down',
                                :eventDate => Time.now,
                                :startTime => '6pm',
                                :endTime => '10pm',
                                :note => 'Thanks'}
    end
#    assert_redirected_to event_path()
    assert_response 302
  end

  test "should show event" do
    get :show, :id => Factory(:dinner).to_param
    assert_response :success
  end

  test "should get edit" do
    Event.stubs(:find).returns(@dinner)
    get :edit, :id => @dinner.to_param
    assert_response :success
  end

  test "should update event" do
    Event.stubs(:find).returns(@dinner)
    put :update, :id => @dinner.to_param, :event => { }
    assert_redirected_to user_path(@rich) #event_path(assigns(:event))
    evt = assigns(:event)
    user = assigns(:user)
    assert_equal @dinner, evt
    assert_equal @rich, user
    
  end
end
