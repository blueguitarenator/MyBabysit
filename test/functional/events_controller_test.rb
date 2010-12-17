require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  def setup
    @controller  = EventsController.new
    @request     = ActionController::TestRequest.new
    @response    = ActionController::TestResponse.new
  end

  test "should get index" do
    get :index
    assert_raise("no_route_matches")
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    rich = Factory(:rich)
    @controller.stubs(:current_user).returns(rich)
    assert_difference('Event.count') do
      post :create, :event => { }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, :id => Factory(:dinner).to_param
    assert_response :success
  end

  test "should get edit" do
    rich = Factory(:rich)
    Event.stubs(:find).returns(Factory(:wedding))
    @controller.stubs(:current_user).returns(rich)
    get :edit, :id => Factory(:wedding).to_param
    assert_response :success
  end

  test "should update event" do
    rich = Factory(:rich)
    Event.stubs(:find).returns(Factory(:wedding))
    @controller.stubs(:current_user).returns(rich)
    put :update, :id => Factory(:dinner).to_param, :event => { }
    assert_redirected_to user_path(assigns(rich)) #event_path(assigns(:event))
  end

  test "should destroy event" do
    rich = Factory(:rich)
    Event.stubs(:find).returns(Factory(:dinner))
    @controller.stubs(:current_user).returns(rich)
    assert_difference('Event.count', -1) do
      delete :destroy, :id => Factory(:dinner).to_param
    end

    assert_redirected_to events_path
  end
end
