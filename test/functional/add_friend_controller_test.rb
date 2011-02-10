require 'test_helper'
require 'mocha'

class AddFriendControllerTest < ActionController::TestCase

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

  def test_add_friend
    @controller.stubs(:current_user).returns(@rich)
    jane = Factory(:babysitter)
    assert_equal(0, @rich.friends.count)
    put :update, :id => @rich.id, :friend_id => jane.to_param
    assert_equal(1, @rich.friends.count)
    assert_response 302
  end

end
